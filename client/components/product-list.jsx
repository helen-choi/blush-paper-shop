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
      <div className="products-container row flex-wrap justify-content-between">
        {
          this.state.products.map(product => {
            return (
              <ProductListItem
                key={product.productId}
                image={product.image}
                name={product.name}
                price={product.price}
                description={product.description}
              />
            );
          })
        }
      </div>
    );
  }
}
