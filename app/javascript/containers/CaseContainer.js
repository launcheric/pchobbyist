import React, { Component } from 'react';
import SelectFormContainer from '../containers/SelectFormContainer';

class CaseContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      caseOptions: []
    }
    this.handleCaseSelect = this.handleCaseSelect.bind(this)
  }

  handleCaseSelect(value){ this.props.handleCaseSelect(value) }
  componentDidMount(){
    fetch(`/api/v1/computer_cases`, {
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
      let caseOptions=body.computer_cases
      this.setState({
        caseOptions: caseOptions
      })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    return(
      <div className="main-wrapper">
        <SelectFormContainer
          className={ this.props.className }
          selectOptions={ this.state.caseOptions }
          handleSelect={ this.handleCaseSelect }/>
      </div>
    )
  }


}
export default CaseContainer;
