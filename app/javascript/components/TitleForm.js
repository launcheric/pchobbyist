import React, { Component } from 'react';
import { Link } from 'react-router';


class TitleForm extends Component {
  handleTitleChange(event) {
    this.props.handleTitleChange(event.target.value)
  }
  handleDescriptionChange(event) {
    this.props.handleDescriptionChange(event.target.value)
  }

  render() {
    return (
      <div className="title-form">
        <form className="callout" onSubmit={this.props.handleFormSubmit}>
          <label>Title
            <input
              className="title"
              onChange={this.props.handleTitleChange}
              type='text'
              value={this.props.title}
            />
          </label>
          <label>Description
            <input
              className="description"
              onChange={this.props.handleDescriptionChange}
              type='text'
              value={this.props.description} />
          </label>
          <input type='submit' value='Sounds Good' className='button'/>
        </form>
      </div>
  )}
}

export default TitleForm;
