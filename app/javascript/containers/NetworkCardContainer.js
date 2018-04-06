import React, { Component } from 'react';
import SelectFormContainer from '../containers/SelectFormContainer';

class NetworkCardContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      networkCardOptions: []
    }
    this.handleNetworkCardSelect = this.handleNetworkCardSelect.bind(this)
  }

  handleNetworkCardSelect(value){ this.props.handleNetworkCardSelect(value) }
  componentDidMount(){
    fetch(`/api/v1/network_cards`, {
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
      let networkCardOptions=body.network_cards
      this.setState({
        networkCardOptions: networkCardOptions
      })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    return(
      <div className="main-wrapper">
        <SelectFormContainer
          className={ this.props.className }
          selectOptions={ this.state.networkCardOptions }
          handleSelect={ this.handleNetworkCardSelect }/>
      </div>
    )
  }


}
export default NetworkCardContainer;