import React from 'react';
import CartSummaryItem from './cart-summary-item';

export default class CartSummary extends React.Component {
  render() {
    return (
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
    );
  }
}
