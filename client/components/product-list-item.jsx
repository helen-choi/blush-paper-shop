import React from 'react';

export default class ProductListItem extends React.Component {

  render() {
    const image = this.props.image;
    const name = this.props.name;
    const priceNum = (this.props.price / 100).toFixed(2);
    const price = `$${priceNum}`;
    const description = this.props.description;
    return (
      <div className="column col-md-4 mb-3">
        <div className="product card">
          <img src={image} className="product-img card-img-top" alt="" />
          <div className="card-body">
            <h5 className="card-title">{name}</h5>
            <h6 className="card-subtitle mb-2 text-muted">{price}</h6>
            <p className="card-text">{description}</p>
          </div>
        </div>
      </div>
    );
  }
}
