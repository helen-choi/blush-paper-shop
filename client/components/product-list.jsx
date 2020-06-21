import React from 'react';
import ProductListItem from './product-list-item';

export default class ProductList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      products: [],
      filterOn: false
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
    const target = event.target.parentElement.parentElement;
    const filterClass = target.className.slice(7);
    const card = document.querySelectorAll('.column');

    for (let i = 0; i < this.state.products.length; i++) {
      card[i].classList.add('d-none');
      if (filterClass === 'all') {
        this.setState({
          filterOn: false
        });
        card[i].classList.remove('d-none');
      }
      if (this.state.products[i].name.toLowerCase().indexOf(filterClass) > -1) {
        card[i].classList.remove('d-none');
      }
    }
  }

  render() {
    return (
      <>
        <div className="banner">
          <div className="row">
            <img className="w-100" src="./images/banner.jpg" alt="It's Your Special Day." />
          </div>
        </div>
        <div className="filter d-flex justify-content-center mt-4">
          <div className="filter-all" onClick={this.filter}><h3>ALL</h3></div>
          <div className="filter-invitation" onClick={this.filter}><figure><img src="./images/icons/invitation.png" alt="Invitation" /><figcaption>Invitation</figcaption></figure></div>
          <div className="filter-menu" onClick={this.filter}><figure><img src="./images/icons/menu.png" alt="Menu" /><figcaption>Menu</figcaption></figure></div>
          <div className="filter-program" onClick={this.filter}><figure><img src="./images/icons/program.png" alt="Program" /><figcaption>Program</figcaption></figure></div>
          <div className="filter-numbers" onClick={this.filter}><figure><img src="./images/icons/numbers.png" alt="Numbers" /><figcaption>Table Numbers</figcaption></figure></div>
        </div>
        <div className="container ml-auto mr-auto mt-4 products-container row flex-wrap">
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
