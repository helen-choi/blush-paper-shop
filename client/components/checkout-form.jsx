import React from 'react';

export default class CheckoutForm extends React.Component {
  render() {
    return (
      <div className="form">
        <h2>My Cart</h2>
        <p>Order Total: </p>
        <form>
          <input type="name" name="name" id="name" />
          <input type="credit-card" name="credit-card" id="credit-card" />
          <textarea name="address" id="address" cols="30" rows="10"></textarea>
          <button>Place Order</button>
        </form>
      </div>
    );
  }
}
