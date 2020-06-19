import React from 'react';
import ProductListItem from './product-list-item';

export default class ProductList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      products: [],
      filterOn: false,
      setFilterClass: 'column col-md-4 mb-3'
    };
    this.filter = this.filter.bind(this);
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

  filter() {
  /* eslint-disable no-console */
    this.setState({
      filterOn: true
    });
    const target = event.target.parentElement;
    const filterClass = target.className.slice(7);
    console.log(filterClass);
  }

  render() {
    return (
      <>
        <div className="banner">
          <div className="row">
            <img className="w-100" src="./images/banner.jpg" alt="It's Your Special Day." />
          </div>
        </div>
        <div className="filter d-flex justify-content-center mt-5">
          <div className="filter-invitation"><i onClick={this.filter} className="fas fa-envelope-open-text fa-2x"></i></div>
          <div className="filter-menu"><i onClick={this.filter} className="fas fa-utensils fa-2x"></i></div>
          <div className="filter-program"><i onClick={this.filter} className="fas fa-bars fa-2x"></i></div>
          <div className="filter-numbers"><i onClick={this.filter} className="far fa-file-excel fa-2x"></i></div>
        </div>
        <div className="container ml-auto mr-auto mt-5 products-container row flex-wrap justify-content-between">
          {
            this.state.products.map(product => {
              return (
                <ProductListItem
                  key={product.productId}
                  product={product}
                  onClick={this.props.onClick}
                  classNames={this.state.setFilterClass}
                />
              );
            })
          }
        </div>
      </>
    );
  }
}
