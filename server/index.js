require('dotenv/config');
const express = require('express');

const db = require('./database');
const ClientError = require('./client-error');
const staticMiddleware = require('./static-middleware');
const sessionMiddleware = require('./session-middleware');

const app = express();

app.use(staticMiddleware);
app.use(sessionMiddleware);

app.use(express.json());

app.get('/api/health-check', (req, res, next) => {
  db.query('select \'successfully connected\' as "message"')
    .then(result => res.json(result.rows[0]))
    .catch(err => next(err));
});

app.get('/api/products', (req, res, next) => {
  const sql = `
  select "productId",
        "name",
        "price",
        "image",
        "shortDescription"
  from "products"
  `;
  db.query(sql)
    .then(result =>
      res.json(result.rows)
    )
    .catch(err => next(err));
});

app.get('/api/products/:productId', (req, res, next) => {
  const productId = req.params.productId;
  const sql = `
  select *
  from "products"
  where "productId" = $1
  `;
  const values = [productId];

  db.query(sql, values)
    .then(result => {
      if (result.rows[0] === undefined) {
        next(new ClientError(`Product with productId ${productId} cannot be found`, 404));
      } else {
        res.json(result.rows[0]);
      }
    })
    .catch(err => next(err));
});

app.get('/api/cart', (req, res, next) => {
  const sql = `
  select *
  from "carts";
  `;
  db.query(sql)
    .then(result => res.json(result.rows))
    .catch(err => next(err));
});

app.post('/api/cart', (req, res, next) => {
  const productId = req.body.productId;

  if (productId < 0 || productId % 1 !== 0 || productId === undefined) {
    res.status(400).send('productId you provided is not valid');
  } else {
    const getPrice = `
    select "price"
    from "products"
    where "productId" = $1;
    `;
    const productValue = [productId];

    db.query(getPrice, productValue)
      .then(result => {
        const price = result.rows[0].price;
        if (result.rows[0] === undefined) {
          next(new ClientError(`Product with productId ${productId} cannot be found`, 400));
        } else {
          const createCart = `
          insert into "carts" ("cartId", "createdAt")
          values (default, default)
          returning "cartId"
          `;
          db.query(createCart)
            .then(result => {
              return ({
                cartId: result.rows[0].cartId,
                productId: productId
              });
            })
            .then(result => {
              const cartId = result.cartId;
              req.session.cartId = cartId;
              const createCartItem = `
              insert into "cartItems" ("cartId", "productId", "price")
              values ($1,$2,$3)
              returning "cartItemId"
              `;
              const cartItemValue = [cartId, productId, price];

              return db.query(createCartItem, cartItemValue)
                .then(result => {
                  const cartItemId = result.rows[0].cartItemId;
                  return cartItemId;
                })
                .then(result => {
                  return result;
                })
                .catch(err => next(err));
            })
            .then(result => {
              const cartItemId = result;
              const newCartItem = `
              select "c"."cartItemId",
              "c"."price",
              "p"."productId",
              "p"."image",
              "p"."name",
              "p"."shortDescription"
              from "cartItems" as "c"
              join "products" as "p" using ("productId")
              where "c"."cartItemId" = $1
              `;
              const newCartItemValue = [cartItemId];

              return db.query(newCartItem, newCartItemValue)
                .then(result => {
                  res.status(201);
                  res.json(result.rows[0]);
                })
                .catch(err => next(err));
            })
            .catch(err => next(err));
        }
      })
      .catch(err => next(err));
  }
});

app.use('/api', (req, res, next) => {
  next(new ClientError(`cannot ${req.method} ${req.originalUrl}`, 404));
});

app.use((err, req, res, next) => {
  if (err instanceof ClientError) {
    res.status(err.status).json({ error: err.message });
  } else {
    console.error(err);
    res.status(500).json({
      error: 'an unexpected error occurred'
    });
  }
});

app.listen(process.env.PORT, () => {
  // eslint-disable-next-line no-console
  console.log('Listening on port', process.env.PORT);
});
