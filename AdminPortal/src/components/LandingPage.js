import React from 'react';
import Header from './Header';
import Button from '@material-ui/core/Button';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';
import Typography from '@material-ui/core/Typography';
import AccountCircle from '@material-ui/icons/AccountCircle';
import TextField from '@material-ui/core/TextField';
import Key from '@material-ui/icons/VpnKey';
import { Stitch, AnonymousCredential } from 'mongodb-stitch-browser-sdk'


Stitch.initializeDefaultAppClient("digiknow-mcfek");
const stitchClient = Stitch.defaultAppClient;

const OnClickLogin = (props) => () => {
  stitchClient.auth.loginWithCredential(new AnonymousCredential()).then(user => {
    console.log(`logged in anonymously as user ${user.id}`)
    props.history.push("/quizzes");
  });

};

class LandingPage extends React.Component {



  render() {
    return (
      < div className="landingPagebodyComponent" >
        {console.log(this)}
        <br />
        <Typography variant="display3" gutterBottom align="center">
          Welcome to the digiknow Admin Portal
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

              <Button variant="raised" color="primary" onClick={OnClickLogin(this.props)}><Typography variant="button" gutterBottom className="logintypography">
                Login
      </Typography></Button>
            </Paper>
          </div>
        </Grid>

        <Grid container spacing={24} >
          <Grid item xs={12} md={12}>

          </Grid>
        </Grid>

      </div >
    )
  }

};

export default LandingPage;