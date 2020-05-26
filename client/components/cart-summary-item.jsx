import React from 'react';

export default class CartSummaryItem extends React.Component {
  render() {
    const name = this.props.cartItem.name;
    const priceNum = (this.props.cartItem.price / 100).toFixed(2);
    const price = `$${priceNum}`;
    const image = this.props.cartItem.image;

    return (
      <li className="cart-item mb-3">
        <div className="cart-item-container d-flex align-items-center">
          <div className="cart-item-img">
            <img src={image} alt=""/>
          </div>
          <div className="cart-item-info row ml-2">
            <h2 className="mb-2">{name}</h2>
            <h6 className="w-100 text-muted">{price}</h6>
          </div>

        </div>
      </li>
    );
  }
}
