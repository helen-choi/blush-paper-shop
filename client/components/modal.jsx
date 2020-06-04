import React, { useState } from 'react';
import Modal from 'react-bootstrap/Modal';
import Button from 'react-bootstrap/Button';

export default function Disclaimer(props) {

  const [show, setShow] = useState(true);

  const handleClose = () => setShow(false);

  return (
    <Modal className="modal" backdrop="static" show={show} onHide={handleClose} centered>
      <Modal.Header closeButton>
      </Modal.Header>
      <Modal.Body>Woohoo, reading this text in a modal!</Modal.Body>
      <Modal.Footer>
        <Button variant="primary" onClick={() => {
          handleClose();
          props.demoAccepted();
        }}>
                  Save Changes
        </Button>
      </Modal.Footer>
    </Modal>
  );
}
