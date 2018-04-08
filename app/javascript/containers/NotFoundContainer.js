import React, { Component } from 'react';
import {browserHistory} from 'react-router';

class NotFoundContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
    }
  }
  render(){
    return(
      <div className="main-wrapper large-10 columns">
        <p>Not Found</p>
      </div>
    )
  }
}

export default NotFoundContainer;
