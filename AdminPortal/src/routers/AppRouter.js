import React from 'react';
import { BrowserRouter, Route, Switch, Link, NavLink } from 'react-router-dom';
import LandingPage from '../components/LandingPage';
import HomePage from '../components/HomePage';
import NotFoundPage from '../components/NotFoundPage';

import PublicRoute from './PublicRouter';
import PrivateRoute from './PrivateRouter';
import LoginPage from '../components/LoginPage';
import QuizzesPage from '../components/QuizzesPage';





const AppRouter = () => (
  <BrowserRouter>
    <div>

      <Switch>

        <PublicRoute path="/" component={LandingPage} exact={true} />
        <PrivateRoute path="/home" component={HomePage} />

        <Route path="/login" component={LoginPage} />
        <PublicRoute path="/quizzes" component={QuizzesPage} />
        <Route component={NotFoundPage} />
      </Switch>

    </div>
  </BrowserRouter>
);

export default AppRouter;