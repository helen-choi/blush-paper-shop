import React from 'react';

export default class ProductListItem extends React.Component {
  constructor(props) {
    super(props);
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    const name = this.props.product.name;
    const productId = this.props.product.productId;
    this.props.onClick(name, productId);
  }

  render() {
    const image = this.props.product.image;
    const name = this.props.product.name;
    const priceNum = (this.props.product.price / 100).toFixed(2);
    const price = `$${priceNum}`;
    // const description = this.props.product.shortDescription;
    return (
      <div onClick={this.handleClick} className="column col-md-4 mb-3">
        <div className="product">
          <img src={image} className="product-img card-img-top" alt="" />
          <div className="product-info">
            <p className="product-name">{name}</p>
            <p className="product-price mb-2 text-muted">{price}</p>
            {/* <p className="card-text">{description}</p> */}
          </div>
        </div>
      </div>
    );
  }
}
