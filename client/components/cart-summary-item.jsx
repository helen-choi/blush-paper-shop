import React from 'react';

export default class CartSummaryItem extends React.Component {
  render() {
    const name = this.props.cartItem.name;
    const priceNum = (this.props.cartItem.price / 100).toFixed(2);
    const price = `$${priceNum}`;
    const shortDesc = this.props.cartItem.shortDescription;
    const image = this.props.cartItem.image;

    return (
      <li className="cart-item list-group-item list-group-item-light mb-3">
        <div className="cart-item-container row">
          <div className="cart-item-img col-md-4">
            <img src={image} alt=""/>
          </div>
          <div className="cart-item-info col-md-8 row align-items-end">
            <h2 className="d-block">{name}</h2>
            <h6 className="card-subtitle mb-2 text-muted d-block">{price}</h6>
            <p className="card-text d-block">{shortDesc}</p>
          </div>

        </div>
      </li>
    );
  }
}
