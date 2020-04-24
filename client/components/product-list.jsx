import React from 'react';
import ProductListItem from './product-list-item';

export default class ProductList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      products: []
    };
  }

  componentDidMount() {
    this.getProducts();
  }

  getProducts() {
    fetch('/api/products')
      .then(res => res.json())
      .then(products => {
        this.setState({ products: products });
      });
  }

  render() {
    return (
      <div className="products-container d-flex flex-wrap justify-content-between">
        <ProductListItem products={this.state.products} />
      </div>
    );
  }
}
