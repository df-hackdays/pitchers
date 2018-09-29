import React from 'react';
import Header from './Header';
import Button from '@material-ui/core/Button';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';
import Typography from '@material-ui/core/Typography';
import AccountCircle from '@material-ui/icons/AccountCircle';
import TextField from '@material-ui/core/TextField';
import Key from '@material-ui/icons/VpnKey';

const OnClickLogin = () => {


  this.props.startLogin('1284565ertr');

  this.props.history.push('/home');

};

const LandingPage = () => (
  <div className="landingPagebodyComponent">

    <br />
    <Typography variant="display3" gutterBottom align="center">
      Welcome to the Digino Admin Portal
      </Typography>

    <Grid container spacing={24} >

      <Grid item xs={12}>

      </Grid>
      <div className="login-page-class">



        <Paper className="loginPaper">
          <Typography variant="headline" component="h3">
            <div className="padding10">
              Login to your account
              </div>
          </Typography>
          <form>
            <div className="loginformgroup">

              <AccountCircle />

              <TextField id="input-username" label="Username" />

            </div>
            <div className="loginformgroup">



              <Key />

              <TextField type="password" id="input-password" label="Password" />

            </div>
          </form>

          <Button variant="raised" color="primary" onClick={OnClickLogin}><Typography variant="button" gutterBottom className="logintypography">
            Login
      </Typography></Button>
        </Paper>
      </div>
    </Grid>

    <Grid container spacing={24} >
      <Grid item xs={12} md={12}>

      </Grid>
    </Grid>

  </div>
);

export default LandingPage;