import React from 'react';
import { Link } from 'react-router';

const BackButton = props => {
  return(
    <div className="back-button">
      <button className="back-button" onClick={props.handleBack}>
        Need to change previouse components.
      </button>
    </div>
  )
}

export default BackButton;
