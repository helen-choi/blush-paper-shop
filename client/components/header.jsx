import React from 'react';

export default class Header extends React.Component {
  render() {
    return (
      <div className="header-container d-flex justify-content-between align-items-center mb-3 mt-3">
        <h1>Wicked Sales</h1>
        <p>{this.props.cartItemCount} items <i className="fas fa-shopping-cart"></i></p>
      </div>
    );
  }
}
