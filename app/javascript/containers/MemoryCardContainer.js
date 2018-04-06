import React, { Component } from 'react';
import SelectFormContainer from '../containers/SelectFormContainer';

class MotherboardContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      memoryCardOptions: []
    }
    this.handleMemoryCardSelect = this.handleMemoryCardSelect.bind(this)
    }

  handleMemoryCardSelect(value){ this.props.handleMemoryCardSelect(value) }
  componentDidMount(){
    let motherboardBrand = this.props.motherboard;
    fetch(`/api/v1/memory_cards/${motherboardBrand}`, {
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
      let memoryCardOptions = body.memory_cards
      this.setState({
        memoryCardOptions: memoryCardOptions
      })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    return(
      <div className="main-wrapper">
      <SelectFormContainer
        className={ this.props.className }
        selectOptions={ this.state.memoryCardOptions }
        handleSelect={ this.handleMemoryCardSelect } />
      </div>
    )
  }


}
export default MotherboardContainer;