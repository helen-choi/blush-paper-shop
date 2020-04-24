import React from 'react';

export default class ProductListItem extends React.Component {

  render() {

    return (
      this.props.products.map(product => {
        const image = product.image;
        const name = product.name;
        const priceNum = (product.price / 100).toFixed(2);
        const price = `$${priceNum}`;
        const description = product.description;
        const id = product.productId;
        return (
          <div key={id} className="product card col-sm-4">
            <img src={image} className="product-img card-img-top" alt="" />
            <div className="card-body">
              <h5 className="card-title">{name}</h5>
              <h6 className="card-subtitle mb-2 text-muted">{price}</h6>
              <p className="card-text">{description}</p>
            </div>
          </div>
        );
      })
    );
  }
}
