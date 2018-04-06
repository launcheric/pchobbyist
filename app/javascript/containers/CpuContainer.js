import React, { Component } from 'react';
import SelectFormContainer from '../containers/SelectFormContainer';

class CpuContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      cpuOptions: []
    }
    this.handleSelectCpu = this.handleSelectCpu.bind(this)
  }

  handleSelectCpu(value){ this.props.handleCpuSelect(value) }
  componentDidMount(){
    let cpuBrand = this.props.processorBrand;
    fetch('/api/v1/cpus', {
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
      let cpuOptions = []
      body.cpus.forEach(cpu =>{
        if (cpu.manufacturer.toLowerCase() == cpuBrand){
          cpuOptions.push(cpu);
        }
      })
      this.setState({
        cpuOptions: cpuOptions
      })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    return(
      <div className="main-wrapper">
      <SelectFormContainer
        className={ this.props.className }
        selectOptions={ this.state.cpuOptions }
        handleSelect={ this.handleSelectCpu } />
      </div>
    )
  }


}

export default CpuContainer;