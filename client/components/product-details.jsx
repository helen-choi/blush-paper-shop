import React from 'react';

export default class ProductDetails extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      product: null
    };
    this.handleClick = this.handleClick.bind(this);
  }

  componentDidMount() {
    fetch('/api/products/2')
      .then(res => res.json());
  }

  handleClick() {
    this.props.onClick('catalog', {});

  }

  render() {
    return (
      <div className="details-container">
        <h1>Details</h1>
        <button onClick={this.handleClick}>Back to catalog</button>
      </div>
    );
  }
}
