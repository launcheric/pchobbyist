import React, { Component } from 'react';
import ProcessorTile from '../components/ProcessorTile';

class ProcessorContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {

    }
    this.selectIntel = this.selectIntel.bind(this)
    this.selectAmd = this.selectAmd.bind(this)
  }

  selectIntel(){ this.props.handleProcessorSelect("intel") }
  selectAmd(){ this.props.handleProcessorSelect("amd") }

  render() {
    return(
      <div className="main-wrapper">
        <ProcessorTile name={"Intel"} handleProcessorSelect={this.selectIntel}/>
        <ProcessorTile name={"Amd"} handleProcessorSelect={this.selectAmd}/>
      </div>

    )
  }


}

export default ProcessorContainer;