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
    this.props.onCartClick();
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
      btnCheckOut = <button type="button" className="btn text-right mb-3 button" onClick={this.handleCheckout}>Checkout</button>;
    }

    return (
      <div className="cart-container p-3">
        <p className="mb-3 btn-back text-muted d-flex align-items-center" onClick={this.props.onCartClick}><i className="far fa-times-circle mr-1"></i> <span>Keep Shopping</span></p>
        <div className="cart-header-container d-flex align-items-center mb-3">
          <h1>My Cart</h1>
        </div>
        <ul className="list-group list-unstyled">
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
        <p className="total-price mt-3 pt-3 pb-3 text-muted">Order total: ${totalPrice}</p>
        {btnCheckOut}
      </div>
    );
  }
}
