import React, { Component } from 'react';
import SelectFormContainer from '../containers/SelectFormContainer';

class HardDriveContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      hardDriveOptions: []
    }
    this.handleHardDriveSelect = this.handleHardDriveSelect.bind(this)
  }

  handleHardDriveSelect(value){ this.props.handleHardDriveSelect(value) }
  componentDidMount(){
    fetch(`/api/v1/hard_drives`, {
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
      let hardDriveOptions = body.hard_drives
      this.setState({
        hardDriveOptions: hardDriveOptions
      })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    return(
      <div className="main-wrapper">
      <SelectFormContainer
        className={ this.props.className }
        selectOptions={ this.state.hardDriveOptions }
        handleSelect={ this.handleHardDriveSelect } />
      </div>
    )
  }


}
export default HardDriveContainer;