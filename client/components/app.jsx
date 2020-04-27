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
  }

  getCartItems() {
    fetch('/api/cart')
      .then(result => result);
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
    const productDetails = <ProductDetails name={this.state.view.name} params={this.state.view.params} onClick={this.setView} />;
    return (
      <div className="container">
        <Header />
        {
          (this.state.view.name !== 'catalog')
            ? productDetails
            : productList

        }
      </div>
    );
  }
}
