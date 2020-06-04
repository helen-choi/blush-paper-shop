import React from 'react';

export default function Disclaimer(props) {

  const handleClose = () => {
    props.demoAccepted();
  };

  return (
    <div className=" container disclaminer d-flex justify-content-center align-items-center">
      <div className="col-9 d-flex justify-content-center flex-wrap text-center">
        <p>Please note that this website is for <span>demonstration purposes only</span>.</p>
        <p>By clicking the following button, I understand that no real purchases will be made and that personal information such as names, addresses, and real credit card numbers should not be used.</p>
        <button className="button btn" onClick={() => {
          handleClose();
          props.demoAccepted();
        }}>I Agree</button>
      </div>
    </div>
  );
}
