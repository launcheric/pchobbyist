import React, { Component } from 'react';
import {browserHistory} from 'react-router';
import BuildTile from '../components/BuildTile';
import NewBuildTile from '../components/NewBuildTile';
import DefaultBuilds from '../constants/DefaultBuilds';
import Search from '../components/Search';
import BuildButton from '../components/BuildButton';

class BuildContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      user: null,
      searchedBuilds: DefaultBuilds,
      allBuilds: [],
      currentPage: 1,
      buildsPerPage: 4
    }
    this.handleClick = this.handleClick.bind(this);
    this.searchBuilds = this.searchBuilds.bind(this);
  }

  handleClick(event) {
    this.setState({
      currentPage: Number(event.target.id)
    });
  }

  searchBuilds(query){
    if(query){
      let results = this.state.allBuilds.filter((build) => {
        let build_name = build.build.name.split(' ').join('').split('-').join('')
        let cpu_name = build.cpu.split(' ').join('').split('-').join('')
        let video_card_name =build.video_card.split(' ').join('').split('-').join('');
        let stripped_query = query.split(' ').join('').split('-').join('');
        return build_name.toLowerCase().includes(stripped_query) || cpu_name.toLowerCase().includes(stripped_query) || video_card_name.toLowerCase().includes(stripped_query)
      });
      this.setState({ searchedBuilds: results })
    } else {
      this.setState({ searchedBuilds: this.state.allBuilds })
    }
  }

  componentDidMount() {
    fetch('/api/v1/builds', {
      credentials: 'same-origin'
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
    .then(response => {
      let parsed = response.json()
      return parsed
    }).then(body => {
      if (body.user) {
         body.builds.unshift(body.builds[0])
      }
      this.setState({
        searchedBuilds: body.builds,
        allBuilds: body.builds,
        user: body.user
      })
    })
  }

  render(){
    const { searchedBuilds, currentPage, buildsPerPage } = this.state;
    const indexOfLastBuild = currentPage * buildsPerPage;
    const indexOfFirstBuild = indexOfLastBuild - buildsPerPage;
    const currentBuilds = searchedBuilds.slice(indexOfFirstBuild, indexOfLastBuild);
    const pageNumbers = [];
    for (let i = 1; i <= Math.ceil(searchedBuilds.length / buildsPerPage); i++) {
      pageNumbers.push(i);
    }
    const renderPageNumbers = pageNumbers.map(number => {
      return (
        <li
          className="button"
          key={number}
          id={number}
          onClick={this.handleClick}
        >
          {number}
        </li>
      );
    });
    if (this.state.user && this.state.currentPage == 1 ) {
      currentBuilds.shift()
    }
    let renderBuilds = currentBuilds.map((build, index) => {
      return(
        <div className="build-tile" key={index}>
          <BuildTile
            id={build.build.id}
            name={build.build.name}
            description={build.build.description}
            image_url={build.build.image_url.url}
          />
        </div>
      )
    });



    let newBuildTile = (
        <div className="build-tile" >
          <NewBuildTile/>
        </div>)
    if (this.state.user && this.state.currentPage == 1 ){
      renderBuilds = [newBuildTile].concat(renderBuilds) }
    return(
      <div className="main-wrapper large-10 columns">
        <div className="top-field large-14 medium-12 small-12 columns">
          <div className='search-button large-2 medium-12 small-12 columns' ></div>
      <div className="search-wrapper large-10 medium-12 small-12 columns">
        <div className="search-container">
          <Search searchBuilds={this.searchBuilds}/>
        </div>
      </div>
    </div>
      <div className="builds-wrapper large-12 columns">
        <ul>
          {renderBuilds}
        </ul>
        <ul id="page-numbers">
          {renderPageNumbers}
        </ul>
      </div>
      </div>
    )
  }
}

export default BuildContainer;
