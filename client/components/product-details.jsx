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

    if (this.state.product !== null) {
      return (
        <div className="details-container">
          <p className="mt-3 mb-3 btn-back"><span className="text-muted" onClick={this.handleClick}>Home</span> / {name}</p>
          <div className="details-info row">
            <div className="details-img col-md-5">
              <img className="card-img-top mb-3" src={imageUrl} alt="" />
            </div>
            <div className="details-desc col-md-7">
              <h2 className="details-name">{name}</h2>
              <h6 className="card-subtitle mb-2 mt-2 text-muted">{price}</h6>
              <p className="card-text">{shortDesc}</p>
              <div className="download-instructions mt-4">
                <h6 className="text-muted d-inline">EASY TO USE</h6>
                <ul>
                  <li className="mt-3">1. Download the PDF</li>
                  <li>2. Open file with <a href="https://get.adobe.com/reader/" target="_blank" rel="noopener noreferrer">Acrobat Reader</a></li>
                  <li>3. Edit highlighted text</li>
                  <li>4. Print at home or at a print shop near you</li>
                  <li>5. Trim along the indicated crop marks</li>
                  <li>6. Have the most awesome wedding!</li>
                </ul>
              </div>
              <button type="button" className="btn button mt-2" onClick={this.handleAddToCart}>Add to Cart</button>
            </div>
          </div>
        </div>
      );
    }
  }
}
