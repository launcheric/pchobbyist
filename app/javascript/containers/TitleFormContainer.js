import React, { Component } from 'react';
import TitleForm from '../components/TitleForm';

class TitleFormContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      title: '',
      description: '',
      titleError: '',
      descriptionError: ''
    }
    this.handleFormSubmit = this.handleFormSubmit.bind(this);
    this.handleTitleChange = this.handleTitleChange.bind(this);
    this.handleDescriptionChange = this.handleDescriptionChange.bind(this);
    this.validateChange = this.validateChange.bind(this)
  }

  handleFormSubmit(e) {
    e.preventDefault();
    if (
      this.validateChange()
    ) {
      let payload = {
        title: this.state.title,
        description: this.state.description
        }
        this.props.handleTitleChange(payload)
      }
  }

  handleTitleChange(e) {
    console.log(e.target.value)
    this.setState({ title: e.target.value })
  }
  handleDescriptionChange(e) {
    this.setState({ description: e.target.value })
  }

  validateChange() {
    if (this.state.title.trim() === '') {
      let titleError = "Please Enter a title"
      this.setState({ titleError: titleError})
      return false
    }
    else if (this.state.description.trim() === '') {
      let descriptionError = "Please Enter a description"
      this.setState({
        titleError: '',
        descriptionError: descriptionError})
      return false
    } else return true
  }
  render() {
    let errorMessage
    if (this.state.titleError || this.state.descriptionError)
      {
        errorMessage = this.state.titleError + `\n` + this.state.descriptionError
      }
    let commentForm;
    return(
      <div className="main-wrapper">
        <div className="error-message">
          {errorMessage}
        </div>
        <TitleForm
          title={this.state.title}
          description={this.state.description}
          handleFormSubmit={this.handleFormSubmit}
          handleDescriptionChange={this.handleDescriptionChange}
          handleTitleChange={this.handleTitleChange}
        />
      </div>
    )
  }


}
export default TitleFormContainer;