import React, { Component } from 'react';
import { Link } from 'react-router';

class SelectFormContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      selectedParts: null,
      errorMessage: ""
    }

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    this.setState({selectedParts: event.target.value});
  }

  handleSubmit(event) {
    event.preventDefault();
    if (this.state.selectedParts){
      this.props.handleSelect(this.state.selectedParts)}
    else {
      let part = this.props.className
      let errorMessage = `Please select ${this.props.className} to continue`
      this.setState({errorMessage: errorMessage})
    }
  }

  componentDidMount(){
    if (this.props.selectOptions.length>0){
      this.setState({selectedParts: this.props.selectOptions[0].id})
  }}

  render() {
    let errorMessage = this.state.errorMessage
    let options = this.props.selectOptions.map((item, index) =>{
        return <option value={item.id} key={item.id}>{item.name}</option>
    })
    let boxSize = this.props.selectOptions.length
    if (boxSize > 30) { boxSize = 30 }
    return (
      <div>
      <div className="error-message">
        {errorMessage}
      </div>
      <form onSubmit={this.handleSubmit}>
        <label>
          {this.props.className}:
          <select multiple onChange={this.handleChange} className="select-box" size={boxSize}>
            {options}
          </select>
        </label>
        <input type="submit" value="Add to My Build" className="button"/>
      </form>
      </div>
    );
  }
}

export default SelectFormContainer;