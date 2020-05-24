import React from 'react';

export default class Header extends React.Component {
  constructor(props) {
    super(props);
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    this.props.onCartClick('cart', {});
  }

  render() {
    return (
      <div className="row header-container justify-content-between align-items-center p-2 flex-nowrap">
        <div className="logo d-flex align-items-center">
          <img src="./images/blushpaper-black.png" alt="Blush Paper Shop" className="mr-2"/>
          <h3 className="mb-0">Blush Paper Shop</h3>
        </div>
        <div className="cart-icon position-relative" onClick={this.handleClick}>
          <i className="fas fa-shopping-cart"></i>
          <div className="cart-count position-absolute d-flex justify-content-center align-items-center">
            <span>{this.props.cartItemCount}</span>
          </div>
        </div>
      </div>
    );
  }
}
