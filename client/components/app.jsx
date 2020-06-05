import React from 'react';
import Header from './header';
import ProductList from './product-list';
import ProductDetails from './product-details';
import CartSummary from './cart-summary';
import CheckoutForm from './checkout-form';
import Disclaimer from './modal';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      view: { name: 'checkout', params: {} },
      cart: [],
      cartOpen: false,
      demoAccepted: true
    };
    this.setView = this.setView.bind(this);
    this.addToCart = this.addToCart.bind(this);
    this.placeOrder = this.placeOrder.bind(this);
    this.handleCart = this.handleCart.bind(this);
    this.modalClicked = this.modalClicked.bind(this);
  }

  getCartItems() {
    fetch('/api/cart')
      .then(res => res.json())
      .then(cart => {
        this.setState({
          cart: cart
        });
      });
  }

  addToCart(product) {
    fetch('/api/cart', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ productId: product })
    })
      .then(res => res.json())
      .then(newCart => {
        const cart = this.state.cart.concat();
        cart.push(newCart);
        this.setState({
          cart: cart
        });
      });
  }

  placeOrder(orderInfo) {
    fetch('/api/orders', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(orderInfo)
    })
      .then(() => {
        this.setState({
          view: { name: 'catalog', params: {} },
          cart: []
        });
      });

  }

  setView(name, params) {
    this.setState({
      view: {
        name: name,
        params: params
      }
    });
  }

  handleCart() {
    this.setState({
      cartOpen: !this.state.cartOpen
    });
  }

  modalClicked() {
    this.setState({
      demoAccepted: true
    });
  }

  componentDidMount() {
    this.getCartItems();
  }

  render() {
    let view;
    if (this.state.view.name === 'checkout') {
      view = <CheckoutForm cartItems={this.state.cart} onClick={this.setView} placeOrder={this.placeOrder} />;
    } else if (this.state.view.name !== 'catalog') {
      view = <ProductDetails name={this.state.view.name} params={this.state.view.params} onClick={this.setView} addToCart={this.addToCart} />;
    } else {
      view = <ProductList onClick={this.setView} />;
    }

    return (
      <>
        {(!this.state.demoAccepted &&
          <Disclaimer demoAccepted={this.modalClicked} />)
        }
        {(this.state.cartOpen &&
          <div className="cart">
            <CartSummary cartItems={this.state.cart} onClick={this.setView} onCartClick={this.handleCart}/>
          </div>) ||
          <div className="cart cart-hidden">
            <CartSummary cartItems={this.state.cart} onClick={this.setView} onCartClick={this.handleCart} />
          </div>
        }
        <div className="container wrapper pb-4">
          <Header cartItemCount={this.state.cart.length} onCartClick={this.handleCart}/>
          {view}

        </div>
      </>
    );
  }
}
