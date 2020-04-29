import React from 'react';
import CartSummaryItem from './cart-summary-item';

export default class CartSummary extends React.Component {
  render() {
    return (
      <div className="cart-container">
        <button type="button" className="btn btn-dark mb-3" onClick={this.handleClick}>Back to catalog</button>
        <ul className="list-group">
          {
            this.props.cartItems.map(cartItem => {
              return (
                <CartSummaryItem
                  key={cartItem.cartItemId}
                  cartItem={cartItem} />
              );
            })
          }
        </ul>
      </div>
    );
  }
}
