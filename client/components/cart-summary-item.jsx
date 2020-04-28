import React from 'react';

export default class CartSummaryItem extends React.Component {
  render() {
    return (
      <li className="cart-item">
        <div className="cart-item-container row">
          <h1>{this.props.cartItem.name}</h1>
        </div>
      </li>
    );
  }
}
