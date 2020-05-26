import React from 'react';

export default class CheckoutForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: '',
      creditCard: '',
      address: '',
      isSubmitted: false
    };
    this.handleChange = this.handleChange.bind(this);
    this.handlePlaceOrder = this.handlePlaceOrder.bind(this);
    this.handleBack = this.handleBack.bind(this);
  }

  handleChange() {
    this.setState({ [event.target.name]: event.target.value });
  }

  handleBack() {
    this.props.onClick('catalog', {});
  }

  handlePlaceOrder(event) {
    event.preventDefault();
    this.setState({
      isSubmitted: true
    });
    const orderInfo = {
      name: this.state.name,
      creditCard: this.state.creditCard,
      shippingAddress: this.state.address
    };
    if (this.state.name && this.state.creditCard && this.state.address) {
      this.props.placeOrder(orderInfo);
    }
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
        <p className="btn-back text-muted" onClick={this.handleBack}><span>Keep shopping</span></p>
        <h2 className="mt-3">My Cart</h2>
        <p className="mt-3 text-muted">Order Total: <span>{totalPrice}</span></p>
        <form onSubmit={this.handlePlaceOrder}>
          <label className="mt-3" htmlFor="name" >Name<sup className="text-danger">*</sup></label>
          <input className="col-md-12" type="name" name="name" id="name" value={this.state.value} onChange={this.handleChange}/>
          {!this.state.name && this.state.isSubmitted && <p className="text-danger">Your name is required</p>}
          <label className="mt-3" htmlFor="credit-card">Credit Card<sup className="text-danger">*</sup></label>
          <input className="col-md-12" type="credit-card" name="creditCard" id="credit-card" value={this.state.value} onChange={this.handleChange}/>
          {!this.state.creditCard && this.state.isSubmitted && <p className="text-danger">Credit card information is required</p>}
          <label className="mt-3" htmlFor="address">Shipping Address<sup className="text-danger">*</sup></label>
          <textarea className="col-md-12" name="address" id="address" cols="30" rows="10" onChange={this.handleChange}></textarea>
          {!this.state.address && this.state.isSubmitted && <p className="text-danger">Your shipping address is required</p>}
          <button className="btn btn-primary mb-3">Place Order</button>
        </form>
      </div>
    );
  }
}
