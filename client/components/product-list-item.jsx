import React from 'react';

export default class ProductListItem extends React.Component {
  render() {
    return (
      <div className="card col-sm-6">
        <img src="http://placekitten.com/200/300" className="product-img card-img-top" alt=""/>
        <div className="card-body">
          <h5 className="card-title">Card Title</h5>
          <p className="card-text">Some quick text</p>
          <a href="#" className="btn btn-primary">Go somewhere</a>
        </div>
      </div>
    );
  }
}
