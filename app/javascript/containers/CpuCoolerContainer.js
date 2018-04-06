import React, { Component } from 'react';
import SelectFormContainer from '../containers/SelectFormContainer';

class CpuCoolerContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      cpuCoolerOptions: []
    }
    this.handleCpuCoolerSelect = this.handleCpuCoolerSelect.bind(this)
  }

  handleCpuCoolerSelect(value){ this.props.handleCpuCoolerSelect(value) }
  componentDidMount(){
    fetch(`/api/v1/cpu_coolers`, {
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
      let cpuCoolerOptions = body.cpu_coolers
      this.setState({
        cpuCoolerOptions: cpuCoolerOptions
      })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    return(
      <div className="main-wrapper">
        <SelectFormContainer
          className={ this.props.className }
          selectOptions={ this.state.cpuCoolerOptions }
          handleSelect={ this.handleCpuCoolerSelect }/>
      </div>
    )
  }


}
export default CpuCoolerContainer;