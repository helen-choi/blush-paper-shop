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
      <div className="row header-container justify-content-between align-items-center p-2">
        <div className="container logo d-flex align-items-center">
          <img src="./images/blushpaper.png" alt="Blush Paper Shop" className="mr-2"/>
          <h3 className="mb-0">Blush Paper Shop</h3>
        </div>
        <p className="text-white" onClick={this.handleClick}>{this.props.cartItemCount} items <i className="fas fa-shopping-cart"></i></p>
      </div>
    );
  }
}
