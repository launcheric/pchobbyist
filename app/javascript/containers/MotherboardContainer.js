import React, { Component } from 'react';
import SelectFormContainer from '../containers/SelectFormContainer';

class MotherboardContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      motherboardOptions: []
    }
    this.handleSelectMotherboard = this.handleSelectMotherboard.bind(this)
  }

  handleSelectMotherboard(value){ this.props.handleMotherboardSelect(value) }
  componentDidMount(){
    let cpuBrand = this.props.selectedCpu;
    fetch(`/api/v1/motherboards/${cpuBrand}`, {
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
      let motherboardOptions = body.motherboards
      this.setState({
        motherboardOptions: motherboardOptions
      })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    return(
      <div className="main-wrapper">
      <SelectFormContainer
        className={ this.props.className }
        selectOptions={ this.state.motherboardOptions }
        handleSelect={ this.handleSelectMotherboard } />
      </div>
    )
  }


}
export default MotherboardContainer;