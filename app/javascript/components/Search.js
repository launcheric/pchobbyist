import React, { Component } from 'react';
import { Link } from 'react-router';

class Search extends Component {
  handleSearch(event) {
    this.props.searchBuilds(event.target.value)
  }
  render() {
    return (
      <div className="large-9 small-10 columns">
          <input className="input-field search-field search animated-search-form" id="search" ref="search" placeholder="Search for cpu name or build name..."
            type="search" onKeyUp={this.handleSearch.bind(this)}/>
      </div>

    )
  }
 }

export default Search;
