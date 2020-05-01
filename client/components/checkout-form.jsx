import React from 'react';

export default class CheckoutForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: '',
      creditCard: '',
      address: ''
    };
    this.handleChange = this.handleChange.bind(this);
    this.handlePlaceOrder = this.handlePlaceOrder.bind(this);
  }

  handleChange() {
    this.setState({ [event.target.name]: event.target.value });
  }

  handlePlaceOrder(event) {
    event.preventDefault();
    const orderInfo = {
      name: this.state.name,
      creditCard: this.state.creditCard,
      shippingAddress: this.state.address
    };
    this.props.placeOrder(orderInfo);
  }

  render() {
    const cartItems = this.props.cartItems;
    let totalPriceNum = 0;
    for (let i = 0; i < cartItems.length; i++) {
      totalPriceNum += cartItems[i].price;
    }
    const totalPrice = (totalPriceNum / 100).toFixed(2);
    return (
      <div className="form">
        <h2>My Cart</h2>
        <p className="mt-3 text-muted">Order Total: <span>{totalPrice}</span></p>
        <form onSubmit={this.handlePlaceOrder}>
          <label className="mt-3" htmlFor="name" >Name</label>
          <input className="col-md-12" type="name" name="name" id="name" value={this.state.value} onChange={this.handleChange}/>
          <label className="mt-3" htmlFor="credit-card">Credit Card</label>
          <input className="col-md-12" type="credit-card" name="creditCard" id="credit-card" value={this.state.value} onChange={this.handleChange}/>
          <label className="mt-3" htmlFor="address">Shipping Address</label>
          <textarea className="col-md-12" name="address" id="address" cols="30" rows="10" onChange={this.handleChange}></textarea>
          <button type="submit" className="btn btn-primary">Place Order</button>
        </form>
      </div>
    );
  }
}
