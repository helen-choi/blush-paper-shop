import React from 'react';
import CartSummaryItem from './cart-summary-item';

export default class CartSummary extends React.Component {
  constructor(props) {
    super(props);
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    this.props.onClick('catalog', {});
  }

  render() {
    return (
      <div className="cart-container">
        <button type="button" className="btn btn-dark mb-3" onClick={this.handleClick}>Back to catalog</button>
        <h1>My Cart</h1>
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
