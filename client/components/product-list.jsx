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
      <>
        <div className="banner">
          <div className="row">
            <img className="w-100" src="./images/banner.jpg" alt="It's Your Special Day." />
          </div>
        </div>
        <div className="filer d-flex justify-content-center mt-5">
          <div className="filter-invitation"><i className="fas fa-envelope-open-text fa-2x"></i></div>
        </div>
        <div className="container ml-auto mr-auto mt-5 products-container row flex-wrap justify-content-between">
          {
            this.state.products.map(product => {
              return (
                <ProductListItem
                  key={product.productId}
                  product={product}
                  onClick={this.props.onClick}
                />
              );
            })
          }
        </div>
      </>
    );
  }
}
