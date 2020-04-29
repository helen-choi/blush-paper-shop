import React from 'react';

export default class CartSummaryItem extends React.Component {
  render() {
    const name = this.props.cartItem.name;
    const priceNum = (this.props.cartItem.price / 100).toFixed(2);
    const price = `$${priceNum}`;
    const shortDesc = this.props.cartItem.shortDescription;
    const image = this.props.cartItem.image;

    return (
      <li className="cart-item list-group-item mb-3">
        <div className="cart-item-container row">
          <div className="cart-item-img col-md-4">
            <img src={image} alt=""/>
          </div>
          <div className="cart-item-info col-md-8 row pb-4 pt-4 ml-2">
            <h2 className="w-100">{name}</h2>
            <h6 className="card-subtitle mb-2 w-100 text-muted">{price}</h6>
            <p className="card-text w-100">{shortDesc}</p>
          </div>

        </div>
      </li>
    );
  }
}
