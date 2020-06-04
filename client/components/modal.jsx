import React from 'react';
import Modal from 'react-bootstrap/Modal';
import Button from 'react-bootstrap/Button';

export default class Disclaimer extends React.Component {
  constructor(props) {
    super(props);
    this.handleClose = this.handleClose.bind(this);
  }

  handleClose() {
    this.props.demoAccepted();
  }

  render() {
    return (
      <Modal.Dialog onHide={this.handleClose}>
        <Modal.Header closeButton>
          <Modal.Title>Modal title</Modal.Title>
        </Modal.Header>

        <Modal.Body>
          <p>Modal body text goes here.</p>
        </Modal.Body>

        <Modal.Footer>
          <Button variant="primary" onClick={this.handleClose}>I agree</Button>
        </Modal.Footer>
      </Modal.Dialog>
    );
  }
}
