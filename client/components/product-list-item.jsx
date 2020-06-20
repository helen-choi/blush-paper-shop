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
    let tag;
    if (this.props.product.name.toLowerCase().includes('menu')) {
      tag = 'menu';
    }
    if (this.props.product.name.toLowerCase().includes('invitation')) {
      tag = 'invitation';
    }
    if (this.props.product.name.toLowerCase().includes('numbers')) {
      tag = 'numbers';
    }
    if (this.props.product.name.toLowerCase().includes('program')) {
      tag = 'program';
    }
    return (
      <div onClick={this.handleClick} className={this.props.classNames} data-tag={tag}>
        <div className="product">
          <img src={image} className="product-img card-img-top" alt="" />
          <div className="product-info p-2">
            <p className="product-name mb-1">{name}</p>
            <p className="product-price mb-2 text-muted">{price}</p>
          </div>
        </div>
      </div>
    );
  }
}
