import React, { Component } from 'react';
import SelectFormContainer from '../containers/SelectFormContainer';

class VideoCardContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      videoCardOptions: []
    }
    this.handleVideoCardSelect = this.handleVideoCardSelect.bind(this)
  }

  handleVideoCardSelect(value){ this.props.handleVideoCardSelect(value) }
  componentDidMount(){
    fetch(`/api/v1/video_cards`, {
      method: "GET"
    })
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status} (${response.statusText})`,
        error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(response => response.json())
    .then(body => {
      let videoCardOptions=body.video_cards
      this.setState({
        videoCardOptions: videoCardOptions
      })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    return(
      <div className="main-wrapper">
        <SelectFormContainer
          className={ this.props.className }
          selectOptions={ this.state.videoCardOptions }
          handleSelect={ this.handleVideoCardSelect }/>
      </div>
    )
  }


}
export default VideoCardContainer;