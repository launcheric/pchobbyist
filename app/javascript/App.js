import React from 'react'
import { Route, IndexRoute, Router, browserHistory } from 'react-router'
import BuildContainer from './containers/BuildContainer'
import BuildNewContainer from './containers/BuildNewContainer'

const App = props => {
  return (
      <Router history={browserHistory}>
        <Route path='/' component={BuildContainer}/>
        <Route path="/builds/new" component={BuildNewContainer} />
      </Router>
  )
}

export default App;
