import React from 'react';
import { Link } from 'react-router';

const NewBuildTile = props => {
  let build_image = "images/default_build.png"
  return(
    <div className="build">
      <Link to='/builds/new'>
        <img src={build_image} style={{width:250, height:250}}/>
        <h4>Create New Build</h4>
        </Link>
    </div>
  )
}

export default NewBuildTile;
