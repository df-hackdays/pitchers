import React from 'React';

import Typography from '@material-ui/core/Typography';
import Paper from '@material-ui/core/Paper';
import Input from '@material-ui/core/Input';
import InputLabel from '@material-ui/core/InputLabel';
import InputAdornment from '@material-ui/core/InputAdornment';
import FormControl from '@material-ui/core/FormControl';
import TextField from '@material-ui/core/TextField';
import Grid from '@material-ui/core/Grid';
import AccountCircle from '@material-ui/icons/AccountCircle';
import Key from '@material-ui/icons/VpnKey';
import Button from '@material-ui/core/Button';
import Snackbar from '@material-ui/core/Snackbar';
import IconButton from '@material-ui/core/IconButton';
import CloseIcon from '@material-ui/icons/Close';
import Select from '@material-ui/core/Select';
import MenuItem from '@material-ui/core/MenuItem';
import Radio from '@material-ui/core/Radio';
import RadioGroup from '@material-ui/core/RadioGroup';
import FormHelperText from '@material-ui/core/FormHelperText';
import FormControlLabel from '@material-ui/core/FormControlLabel';
import FormLabel from '@material-ui/core/FormLabel';

export class QuizzesPage extends React.Component {

  state = {
    messageopen: false,
    messageInfo: {},
    gender: 'male'
  }

  onSubmit = () => {

    this.giveSuccessMessage('send successfully ');

    //this.props.startAddLogin(user);

    // this.props.history.push('/');

  };
  handleClose = (event, reason) => {
    if (reason === 'clickaway') {
      return;
    }
    this.setState({ messageopen: false });
  };

  render() {

    const { message, key } = this.state.messageInfo;


    return (
      <div className="contact-page-wrapper">


        <Snackbar
          key={key}
          anchorOrigin={{
            vertical: 'bottom',
            horizontal: 'left',
          }}
          open={this.state.messageopen}
          autoHideDuration={2000}
          onClose={this.handleClose}

          ContentProps={{
            'aria-describedby': 'message-id',
          }}
          message={<span id="message-id">{message}</span>}
          action={[

            <IconButton
              key="close"
              aria-label="Close"
              color="inherit"

              onClick={this.handleClose}
            >
              <CloseIcon />
            </IconButton>,
          ]}
        />
        <Grid container spacing={24} justify="center">
          <Grid item xs={12} md={10} style={{ marginTop: 10 }}>
            <Paper className="contact-page-paper"><Typography variant="display1" gutterBottom style={{ padding: 15 }}>
              Create Quiz
      </Typography>
              <Grid container spacing={24} >
                <Grid item xs={12} lg={12} md={12} style={{ marginTop: 10 }}>
                  <TextField
                    id="quizName"
                    label="Name"
                    placeholder="Quiz Name"
                    className="contact-page-name-list-field"
                    margin="normal"
                  />
                </Grid>

                <Grid item xs={12} lg={12} md={12} style={{ marginTop: 10 }}>
                  <TextField
                    id="quizDescription"
                    label="Description"
                    placeholder="Quiz Description"
                    className="contact-page-name-list-field"
                    margin="normal"
                  />
                </Grid>

                <Grid item xs={12} lg={12} md={12} style={{ marginTop: 10 }}>
                  <TextField
                    id="quizPoints"
                    label="Points"
                    placeholder="Points for Quiz"
                    className="contact-page-name-list-field"
                    margin="normal"
                  />
                </Grid>

                <Grid item xs={12} lg={6} md={6} style={{ marginTop: 10 }}>
                  <TextField
                    id="question1"
                    label="First Question"
                    placeholder="First Question"
                    className="contact-page-name-list-field"
                    margin="normal"
                  />
                </Grid>


                <Grid item xs={12} lg={6} md={6} style={{ marginTop: 10 }}>
                  <TextField
                    id="q1Option1"
                    label="Option 1"
                    placeholder="Option 1"
                    className="contact-page-name-list-field"
                    margin="normal"
                  />
                </Grid>

                <Grid item xs={12} lg={6} md={6} style={{ marginTop: 10 }}></Grid>

                <Grid item xs={12} lg={6} md={6} style={{ marginTop: 10 }}>
                  <TextField
                    id="q1Option2"
                    label="Option 2"
                    placeholder="Option 2"
                    className="contact-page-name-list-field"
                    margin="normal"
                  />
                </Grid>

                <Grid item xs={12} lg={6} md={6} style={{ marginTop: 10 }}></Grid>

                <Grid item xs={12} lg={6} md={6} style={{ marginTop: 10 }}>
                  <TextField
                    id="q1Option3"
                    label="Option 3"
                    placeholder="Option 3"
                    className="contact-page-name-list-field"
                    margin="normal"
                  />
                </Grid>

                <Grid item xs={12} lg={6} md={6} style={{ marginTop: 10 }}></Grid>

                <Grid item xs={12} lg={6} md={6} style={{ marginTop: 10 }}>
                  <TextField
                    id="q1Answer"
                    label="Answer to First Question"
                    placeholder="Answer to First Question"
                    className="contact-page-name-list-field"
                    margin="normal"
                  />
                </Grid>

                <Grid item xs={12} lg={6} md={6} style={{ marginTop: 10 }}>
                  <TextField
                    id="question2"
                    label="Second Question"
                    placeholder="Second Question"
                    className="contact-page-name-list-field"
                    margin="normal"
                  />
                </Grid>


                <Grid item xs={12} lg={6} md={6} style={{ marginTop: 10 }}>
                  <TextField
                    id="q2Option1"
                    label="Option 1"
                    placeholder="Option 1"
                    className="contact-page-name-list-field"
                    margin="normal"
                  />
                </Grid>

                <Grid item xs={12} lg={6} md={6} style={{ marginTop: 10 }}></Grid>

                <Grid item xs={12} lg={6} md={6} style={{ marginTop: 10 }}>
                  <TextField
                    id="q2Option2"
                    label="Option 2"
                    placeholder="Option 2"
                    className="contact-page-name-list-field"
                    margin="normal"
                  />
                </Grid>

                <Grid item xs={12} lg={6} md={6} style={{ marginTop: 10 }}></Grid>

                <Grid item xs={12} lg={6} md={6} style={{ marginTop: 10 }}>
                  <TextField
                    id="q2Option3"
                    label="Option 3"
                    placeholder="Option 3"
                    className="contact-page-name-list-field"
                    margin="normal"
                  />
                </Grid>

                <Grid item xs={12} lg={6} md={6} style={{ marginTop: 10 }}></Grid>

                <Grid item xs={12} lg={6} md={6} style={{ marginTop: 10 }}>
                  <TextField
                    id="q1Answer"
                    label="Answer to First Question"
                    placeholder="Answer to First Question"
                    className="contact-page-name-list-field"
                    margin="normal"
                  />
                </Grid>

                <Grid item xs={12} lg={6} md={6} style={{ marginTop: 10 }}>
                  <TextField
                    id="question3"
                    label="Third Question"
                    placeholder="Third Question"
                    className="contact-page-name-list-field"
                    margin="normal"
                  />
                </Grid>


                <Grid item xs={12} lg={6} md={6} style={{ marginTop: 10 }}>
                  <TextField
                    id="q3Option1"
                    label="Option 1"
                    placeholder="Option 1"
                    className="contact-page-name-list-field"
                    margin="normal"
                  />
                </Grid>

                <Grid item xs={12} lg={6} md={6} style={{ marginTop: 10 }}></Grid>

                <Grid item xs={12} lg={6} md={6} style={{ marginTop: 10 }}>
                  <TextField
                    id="q3Option2"
                    label="Option 2"
                    placeholder="Option 2"
                    className="contact-page-name-list-field"
                    margin="normal"
                  />
                </Grid>

                <Grid item xs={12} lg={6} md={6} style={{ marginTop: 10 }}></Grid>

                <Grid item xs={12} lg={6} md={6} style={{ marginTop: 10 }}>
                  <TextField
                    id="q3Option3"
                    label="Option 3"
                    placeholder="Option 3"
                    className="contact-page-name-list-field"
                    margin="normal"
                  />
                </Grid>

                <Grid item xs={12} lg={6} md={6} style={{ marginTop: 10 }}></Grid>

                <Grid item xs={12} lg={6} md={6} style={{ marginTop: 10 }}>
                  <TextField
                    id="q1Answer"
                    label="Answer to First Question"
                    placeholder="Answer to First Question"
                    className="contact-page-name-list-field"
                    margin="normal"
                  />
                </Grid>

                <Grid item xs={12} lg={12} md={12} style={{ marginTop: 10 }}>
                  <Button type="button" color="primary" variant="raised" onClick={this.onSubmit}>Submit</Button>
                </Grid>


              </Grid>
            </Paper>
          </Grid>
        </Grid>
      </div >
    );
  }


}




export default QuizzesPage;
