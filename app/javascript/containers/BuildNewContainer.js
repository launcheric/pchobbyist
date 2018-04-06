import React, { Component } from 'react';
import { Route, IndexRoute, Router, browserHistory } from 'react-router'
import ProcessorContainer from './ProcessorContainer';
import MotherboardContainer from './MotherboardContainer';
import MemoryCardContainer from './MemoryCardContainer';
import CpuContainer from './CpuContainer';
import HardDriveContainer from './HardDriveContainer';
import VideoCardContainer from './VideoCardContainer';
import CpuCoolerContainer from './CpuCoolerContainer';
import NetworkCardContainer from './NetworkCardContainer';
import PowerSupplyContainer from './PowerSupplyContainer';
import CaseContainer from './CaseContainer';
import TitleFormContainer from './TitleFormContainer';
import BackButton from '../components/BackButton';
import BuildModel from '../components/BuildModel';
class BuildNewContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      computerCase: '',
      stageNumber: 0,
      processor: '',
      cpu: '',
      motherboard: '',
      memoryCard: '',
      hardDrive: '',
      videoCard: '',
      cpuCooler: '',
      networkCard: '',
      powerSupply: '',
      title: '',
      description: '',
      stage: null
    }
    this.handleStage=this.handleStage.bind(this)
    this.handleBack = this.handleBack.bind(this)
    this.handleStageChange = this.handleStageChange.bind(this)
    this.handleProcessorSelect = this.handleProcessorSelect.bind(this)
    this.handleMotherboardSelect = this.handleMotherboardSelect.bind(this)
    this.handleCpuSelect = this.handleCpuSelect.bind(this)
    this.handleMotherboardSelect = this.handleMotherboardSelect.bind(this)
    this.handleMemoryCardSelect = this.handleMemoryCardSelect.bind(this)
    this.handleHardDriveSelect = this.handleHardDriveSelect.bind(this)
    this.handleVideoCardSelect = this.handleVideoCardSelect.bind(this)
    this.handleCpuCoolerSelect = this.handleCpuCoolerSelect.bind(this)
    this.handleNetworkCardSelect = this.handleNetworkCardSelect.bind(this)
    this.handlePowerSupplySelect = this.handlePowerSupplySelect.bind(this)
    this.handleComputerCaseSelect = this.handleComputerCaseSelect.bind(this)
    this.handleTitleChange = this.handleTitleChange.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
  }

  handleSubmit(){
    let token = $('meta[name=csrf-token]').attr('content');
    fetch(`/api/v1/builds`, {
      method: 'POST',
      body: JSON.stringify(this.state),
      credentials: 'same-origin',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'X-CSRF-Token': token
      }
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
   .then(response =>{
     browserHistory.push('/')
   })

  }

  handleStageChange(){
    let currentStageNumber = this.state.stageNumber
    let newStageNumber = currentStageNumber + 1
    this.setState({
      stageNumber: newStageNumber
    })
  }
  handleBack(){
    let currentStageNumber = this.state.stageNumber
    let newStageNumber = currentStageNumber - 1
    this.setState({
      stageNumber: newStageNumber
    })
  }
  handleTitleChange(value){
    this.setState({ title: value.title, description: value.description})
    this.handleStageChange()
  }
  handleProcessorSelect(processor){
    this.setState({ processor: processor })
    this.handleStageChange()
  }
  handleCpuSelect(cpu){
    this.setState({ cpu: cpu })
    this.handleStageChange()
  }
  handleMotherboardSelect(motherboard){
    this.setState({ motherboard: motherboard })
    this.handleStageChange()
   }
  handleMemoryCardSelect(memoryCard){
    this.setState({ memoryCard: memoryCard })
    this.handleStageChange()
   }
  handleHardDriveSelect(hardDrive){
    this.setState({ hardDrive: hardDrive })
    this.handleStageChange()
   }
  handleVideoCardSelect(videoCard){
     this.setState({ videoCard: videoCard })
     this.handleStageChange()
    }
  handleCpuCoolerSelect(cpuCooler){
    this.setState({ cpuCooler: cpuCooler })
    this.handleStageChange()
   }
  handleNetworkCardSelect(networkCard){
    this.setState({ networkCard: networkCard })
    this.handleStageChange()
   }
  handlePowerSupplySelect(powerSupply){
    this.setState({ powerSupply: powerSupply })
    this.handleStageChange()
   }
  handleComputerCaseSelect(computerCase){
      this.setState({ computerCase: computerCase })
      this.handleStageChange()
  }
  handleStage() {
    let currentStage = this.state.stageNumber
    switch (currentStage) {
      case 0:
        return <TitleFormContainer
                  handleTitleChange={this.handleTitleChange}/>
        break;
      case 1:
        return <ProcessorContainer
                  handleProcessorSelect={this.handleProcessorSelect}/>
        break;
      case 2:
        return <CpuContainer
                  className="Cpu"
                  handleCpuSelect={this.handleCpuSelect}
                  processorBrand={this.state.processor}/>
        break;
      case 3:
        return <MotherboardContainer
                  className="Motherboard"
                  handleMotherboardSelect={this.handleMotherboardSelect}
                  selectedCpu={this.state.cpu}/>
        break;
      case 4:
        return <MemoryCardContainer
                  className="Memory Card"
                  handleMemoryCardSelect={this.handleMemoryCardSelect}
                  motherboard={this.state.motherboard}/>
        break;
      case 5:
        return <HardDriveContainer
                  className="Hard Drive"
                  handleHardDriveSelect={this.handleHardDriveSelect}/>
        break;
      case 6:
        return <VideoCardContainer
                  className="Video Card"
                  handleVideoCardSelect={this.handleVideoCardSelect}/>
          break;
      case 7:
        return <CpuCoolerContainer
                  className="Cpu Cooler"
                  handleCpuCoolerSelect={this.handleCpuCoolerSelect}/>
        break;
      case 8:
        return <NetworkCardContainer
                    className="Network Card"
                    handleNetworkCardSelect={this.handleNetworkCardSelect}/>
        break;
      case 9:
        return <PowerSupplyContainer
            className="Power Supply"
            handlePowerSupplySelect={this.handlePowerSupplySelect}/>
        break;
      case 10:
        return <CaseContainer
            className="Cases"
            handleCaseSelect={this.handleComputerCaseSelect}/>
        break;
      case 11:
          this.handleSubmit()
        break;
    }
  }

  render() {
    let currentStage = this.handleStage()
    let backButton;
    if (this.state.stageNumber != 0)
      { backButton =
        <BackButton handleBack={this.handleBack}/>
        }
    return(
      <div className="main-wrapper">
        <p>Please save to a template or build.</p> <br/>
        <p>If you exit the page without saving it, the build will be rest.</p> <br/>
        { currentStage }
        { backButton }
      </div>
    )
  }


}

export default BuildNewContainer;