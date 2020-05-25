import React from 'react';

export default class ProductDetails extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      product: null
    };
    this.handleClick = this.handleClick.bind(this);
    this.handleAddToCart = this.handleAddToCart.bind(this);
  }

  componentDidMount() {
    const params = this.props.params;
    fetch(`/api/products/${params}`)
      .then(res => res.json())
      .then(product => {
        this.setState({ product: product });
      });
  }

  handleClick() {
    this.props.onClick('catalog', {});

  }

  handleAddToCart() {
    const productId = this.state.product.productId;
    this.props.addToCart(productId);
  }

  render() {
    if (this.state.product === null) {
      return null;
    }
    const imageUrl = this.state.product.image;
    const name = this.state.product.name;
    const priceNum = ((this.state.product.price) / 100).toFixed(2);
    const price = `$${priceNum}`;
    const shortDesc = this.state.product.shortDescription;
    const longDesc = this.state.product.longDescription;
    if (this.state.product !== null) {
      return (
        <div className="details-container">
          <p className="mt-3 mb-3 btn-back"><span className="text-muted" onClick={this.handleClick}>Home</span> / {name}</p>
          <div className="details-info row">
            <div className="details-img col-md-5">
              <img className="card-img-top" src={imageUrl} alt="" />
            </div>
            <div className="details-desc col-md-7">
              <h2 className="card-title">{name}</h2>
              <h6 className="card-subtitle mb-2 text-muted">{price}</h6>
              <p className="card-text">{shortDesc}</p>
              <button type="button" className="btn button" onClick={this.handleAddToCart}>Add to Cart</button>
            </div>
          </div>
          <div className="details-desc col-md-12">
            <p>{longDesc}</p>
          </div>
        </div>
      );
    }
  }
}
