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
        res.json(result);
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
            });
        }
      })
      .catch(err => next(err));
  }
});
// app.post('/api/cart', (req, res, next) => {
//   const productId = req.body.productId;
//   // if (productId < 0 || productId % 1 !== 0 || productId === undefined) {
//   //   res.status(400).send('cartId you provided is not valid');

//   // } else {
//   //   const sql = `
//   //   select "price"
//   //   from "carts"
//   //   where "productId" = $1;
//   //   `;
//   //   const values = [productId];

//   //   db.query(sql, values)
//   //     .then(result => {
//   //       if (result.rows[0] === undefined) {
//   //         next(new ClientError(`Priec with productId ${productId} cannot be found`, 400));
//   //         const createCart = `
//   //         insert into "carts" ("cartId", "createdAt")
//   //         values (default, default)
//   //         returning "cartId"
//   //         `;
//   //         db.query(createCart)
//   //           .then(result => {
//   //             console.log(result);
//   //           });
//   //       }
//       // })
//       // .catch(err => next(err));

//   }

// });

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
