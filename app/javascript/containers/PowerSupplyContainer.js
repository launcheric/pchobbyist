import React, { Component } from 'react';
import SelectFormContainer from '../containers/SelectFormContainer';

class PowerSupplyContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      powerSupplyOptions: []
    }
    this.handlePowerSupplySelect = this.handlePowerSupplySelect.bind(this)
  }

  handlePowerSupplySelect(value){ this.props.handlePowerSupplySelect(value) }
  componentDidMount(){
    fetch(`/api/v1/power_supplies`, {
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
      let powerSupplyOptions=body.power_supplies
      this.setState({
        powerSupplyOptions: powerSupplyOptions
      })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    return(
      <div className="main-wrapper">
        <SelectFormContainer
          className={ this.props.className }
          selectOptions={ this.state.powerSupplyOptions }
          handleSelect={ this.handlePowerSupplySelect }/>
      </div>
    )
  }


}
export default PowerSupplyContainer;