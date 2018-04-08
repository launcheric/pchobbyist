import React from 'react';
import { Link } from 'react-router';

const BuildButton = props => {
  return(
    <div className="new-build">
      <Link to='/builds/new'>
      <button className="button">
        Build My Own
        </button>
      </Link>
    </div>
  )
}

export default BuildButton;
