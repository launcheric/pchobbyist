import React from 'react';
import { Link } from 'react-router';

const ProcessorTile = props => {
  return(
    <div className="build-components">
      <button className="cpu-button" onClick={props.handleProcessorSelect}>
        {props.name}
      </button>
    </div>
  )
}

export default ProcessorTile;
