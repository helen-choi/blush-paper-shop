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
      <div className="header-container d-flex justify-content-between align-items-center mb-3 mt-3">
        <h1>Wicked Sales</h1>
        <p onClick={this.handleClick}>{this.props.cartItemCount} items <i className="fas fa-shopping-cart"></i></p>
      </div>
    );
  }
}
