import React from 'react'
import { Route, IndexRoute, Router, browserHistory } from 'react-router'
import BuildContainer from './containers/BuildContainer'
import BuildNewContainer from './containers/BuildNewContainer'
import NotFoundContainer from './containers/NotFoundContainer'

const App = props => {
  return (
      <Router history={browserHistory}>
        <Route path='/(:locale)' component={BuildContainer}/>
        <Route path="/builds/new" component={BuildNewContainer} />
        <Route path="*" component={NotFoundContainer} />
      </Router>
  )
}

export default App;
