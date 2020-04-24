import React from 'react';

export default class ProductDetails extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      product: null
    };
  }

  componentDidMount() {
    fetch('/api/products/2')
      .then(res => res.json());
  }

  render() {
    return <h1>Details</h1>;
  }
}
