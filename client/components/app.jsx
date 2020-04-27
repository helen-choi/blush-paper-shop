import React from 'react';
import Header from './header';
import ProductList from './product-list';
import ProductDetails from './product-details';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      view: { name: 'catalog', params: {} },
      cart: []
    };
    this.setView = this.setView.bind(this);
    this.addToCart = this.addToCart.bind(this);
  }

  getCartItems() {
    fetch('/api/cart')
      .then(res => res.json())
      .then(cart => {
        const lastItem = (cart.length) - 1;
        this.setState({
          cart: cart[lastItem]
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
      .then(cart => {
        this.setState({
          cart: cart
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

  componentDidMount() {
    this.getCartItems();
  }

  render() {
    const productList = <ProductList onClick={this.setView} />;
    const productDetails = <ProductDetails name={this.state.view.name} params={this.state.view.params} onClick={this.setView} addToCart={this.addToCart}/>;
    return (
      <div className="container">
        <Header cartItemCount={this.state.cart.cartItemId} />
        {
          (this.state.view.name !== 'catalog')
            ? productDetails
            : productList

        }
      </div>
    );
  }
}
