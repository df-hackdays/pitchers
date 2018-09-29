import React from 'react';
import { BrowserRouter, Route, Switch, Link, NavLink, withRouter } from 'react-router-dom';
import LandingPage from '../components/LandingPage';
import HomePage from '../components/HomePage';
import NotFoundPage from '../components/NotFoundPage';

import PublicRoute from './PublicRouter';
import PrivateRoute from './PrivateRouter';
import QuizzesPage from '../components/QuizzesPage';
import AddQuizzesPage from '../components/AddQuizzesPage';

import { Stitch } from 'mongodb-stitch-browser-sdk'

const client = Stitch.defaultAppClient;


const AppRouter = () => (
  <BrowserRouter>
    <div>

      <Switch>

        <PublicRoute path="/" component={LandingPage} client={client} exact={true} />
        <PrivateRoute path="/home" component={HomePage} client={client} />
        <PublicRoute path="/quizzes" component={QuizzesPage} client={client} />
        <PublicRoute path="/addquizzes" component={AddQuizzesPage} client={client} />
        <Route component={NotFoundPage} />
      </Switch>

    </div>
  </BrowserRouter>
);

export default AppRouter;