import React from 'react';
import { Link } from 'react-router';

const BuildTile = props => {
  let build_image = "images/default_build.png"
  if (props.image_url) { build_image= props.image_url}
  return(
    <div className="build">
      <a href={`/builds/${props.id}`}>
        <img src={build_image} style={{width:250, height:250}}/>
        <h4>{props.name}</h4>
      </a>
    </div>
  )
}

export default BuildTile;
