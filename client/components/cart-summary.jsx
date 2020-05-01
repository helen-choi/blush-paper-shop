import React from 'react';
import CartSummaryItem from './cart-summary-item';

export default class CartSummary extends React.Component {
  constructor(props) {
    super(props);
    this.handleClick = this.handleClick.bind(this);
    this.handleCheckout = this.handleCheckout.bind(this);
  }

  handleClick() {
    this.props.onClick('catalog', {});
  }

  handleCheckout() {
    this.props.onClick('checkout', {});
  }

  render() {
    const cartItems = this.props.cartItems;
    let totalPriceNum = 0;
    for (let i = 0; i < cartItems.length; i++) {
      totalPriceNum += cartItems[i].price;
    }
    const totalPrice = (totalPriceNum / 100).toFixed(2);
    let btnCheckOut;
    if (cartItems[0] !== undefined) {
      btnCheckOut = <button type="button" className="btn btn-primary text-right" onClick={this.handleCheckout}>Checkout</button>;
    }

    return (
      <div className="cart-container">
        <button type="button" className="btn btn-dark mb-3" onClick={this.handleClick}>Back to catalog</button>
        <div className="cart-header-container row align-items-center">
          <h1 className="col-md-6">My Cart</h1>
          <p className="total-price col-md-6 text-right">Order total: <span className="text-muted">${totalPrice}</span></p>
        </div>
        <ul className="list-group">
          {
            cartItems.map(cartItem => {
              return (
                <CartSummaryItem
                  key={cartItem.cartItemId}
                  cartItem={cartItem} />
              );
            })
          }
        </ul>
        {btnCheckOut}
      </div>
    );
  }
}
