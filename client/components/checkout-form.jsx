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
        <p className="mb-3 btn-back text-muted d-flex align-items-center mt-3" onClick={this.handleBack}><i className="far fa-times-circle mr-1"></i> <span>Keep Shopping</span></p>
        <h1 className="mt-3 pl-3">Checkout</h1>
        <p className="mt-3 text-muted pl-3">Order Total: $<span>{totalPrice}</span></p>
        <form onSubmit={this.handlePlaceOrder} className="d-flex justify-content-between flex-wrap">
          <div className="checkout-section col-12 col-md-6 p-3">
            <div className="checkout-content d-flex flex-wrap p-3">
              <h5 className="font-weight-bold">Shipping Information</h5>
              <label className="mt-3 w-100" htmlFor="name" >Full Name<sup className="text-danger">*</sup></label>
              <input className="col-md-12" type="name" name="name" id="name" value={this.state.value} onChange={this.handleChange} />
              {!this.state.name && this.state.isSubmitted && <p className="text-danger">Your name is required</p>}

              <div className="col-8 p-0">
                <label className="mt-3 w-100" htmlFor="address">Street Address<sup className="text-danger">*</sup></label>
                <input className="w-100" name="address" id="address" cols="30" rows="10" onChange={this.handleChange} />
                {!this.state.address && this.state.isSubmitted && <p className="text-danger">Your shipping address is required</p>}
              </div>
              <div className="col-4 pr-0">
                <label className="mt-3 w-100" htmlFor="apt">Apt/Suite</label>
                <input className="w-100" name="apt" id="apt" onChange={this.handleChange} />
              </div>
              <div className="col-4 p-0">
                <label className="mt-3 w-100" htmlFor="city">City<sup className="text-danger">*</sup></label>
                <input className="w-100" name="city" id="city" cols="30" rows="10" onChange={this.handleChange} />
              </div>
              <div className="col-5">
                <label className="mt-3 w-100" htmlFor="state">State<sup className="text-danger">*</sup></label>
                <select className="w-100" name="state" id="state">
                  <option hidden>--</option>
                  <option value="AL">AL</option>
                  <option value="AK">AK</option>
                  <option value="AZ">AZ</option>
                  <option value="AR">AR</option>
                  <option value="CA">CA</option>
                  <option value="CO">CO</option>
                  <option value="CT">CT</option>
                  <option value="DE">DE</option>
                  <option value="FL">FL</option>
                  <option value="GA">GA</option>
                  <option value="HI">HI</option>
                  <option value="ID">ID</option>
                  <option value="IL">IL</option>
                  <option value="IN">IN</option>
                  <option value="IA">IA</option>
                  <option value="KS">KS</option>
                  <option value="KY">KY</option>
                  <option value="LA">LA</option>
                  <option value="ME">ME</option>
                  <option value="MD">MD</option>
                  <option value="MA">MA</option>
                  <option value="MI">MI</option>
                  <option value="MN">MN</option>
                  <option value="MS">MS</option>
                  <option value="MO">MO</option>
                  <option value="MT">MT</option>
                  <option value="NE">NE</option>
                  <option value="NV">NV</option>
                  <option value="NH">NH</option>
                  <option value="NJ">NJ</option>
                  <option value="NM">NM</option>
                  <option value="NY">NY</option>
                  <option value="NC">NC</option>
                  <option value="ND">ND</option>
                  <option value="OH">OH</option>
                  <option value="OK">OK</option>
                  <option value="OR">OR</option>
                  <option value="PA">PA</option>
                  <option value="RI">RI</option>
                  <option value="SC">SC</option>
                  <option value="SD">SD</option>
                  <option value="TN">TN</option>
                  <option value="TX">TX</option>
                  <option value="UT">UT</option>
                  <option value="VT">VT</option>
                  <option value="VA">VA</option>
                  <option value="WA">WA</option>
                  <option value="WV">WV</option>
                  <option value="WI">WI</option>
                  <option value="WY">WY</option>

                </select>
              </div>
            </div>
          </div>
          <div className="checkout-section col-12 col-md-6 p-3">
            <div className="checkout-content p-3">
              <h5 className="font-weight-bold">Payment Information</h5>
              <label className="mt-3 w-100" htmlFor="credit-card">Credit Card<sup className="text-danger">*</sup></label>
              <input className="col-8" type="credit-card" name="creditCard" id="credit-card" value={this.state.value} onChange={this.handleChange} />
              <img className="col-4" src="./images/creditcards.jpg" alt=""/>
              {!this.state.creditCard && this.state.isSubmitted && <p className="text-danger">Credit card information is required</p>}
            </div>
          </div>
          <div className="col-12">
            <button className="btn button mb-3">Place Order</button>
          </div>
        </form>
      </div>
    );
  }
}
