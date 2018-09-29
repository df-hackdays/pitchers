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
import { BrowserRouter, Route, Switch, Link, NavLink, withRouter } from 'react-router-dom';
import Card from '@material-ui/core/Card';
import { Stitch, RemoteMongoClient } from 'mongodb-stitch-browser-sdk'

//Stitch.initializeDefaultAppClient('digiknow-mcfek');

const stitchClient = Stitch.defaultAppClient;

const OnClick = (props) => () => {
    props.history.push("/addquizzes");
};

export class QuizzesPage extends React.Component {

    constructor(props) {


        super(props);
        this.state = {
            quizzes: []
        };
    }

    componentDidMount = () => {
        const mongodb = stitchClient.getServiceClient(
            RemoteMongoClient.factory,
            "mongodb-atlas"
        );
        // Get a reference to the blog database
        const db = mongodb.db("digilearn");
        db.collection("digiquiz")
            .find({}, { limit: 5 })
            .asArray()
            .then(quizzes => {
                console.log(quizzes);
                this.setState({ quizzes });;
            });
    }



    render() {
        return (
            < div className="landingPagebodyComponent" >
                <Grid container spacing={24} justify="center">
                    <Grid item xs={12}>
                    </Grid>
                    <Typography variant="headline" component="h3">
                        <div className="padding10">
                            Quizzes
                        </div>
                    </Typography>
                    <Grid item xs={12} lg={12} md={12} style={{ marginTop: 10 }}></Grid>
                    {this.state.quizzes.map((quiz) => {
                        return (
                            <div className="quizcard">

                                <Grid item xs={12} lg={12} md={12} style={{ marginTop: 10 }}>
                                    <Card className="padding10">
                                        <div>Name: {quiz.quizName}</div>
                                        <div>Short Description: {quiz.shortDescription}</div>
                                    </Card>
                                </Grid>
                            </div>

                        )
                    })}

                    <Grid item xs={12} lg={12} md={12} style={{ marginTop: 10 }}></Grid>
                    <Grid item xs={12}>

                    </Grid>
                    <Button variant="raised" color="primary" onClick={OnClick(this.props)}><Typography variant="button" gutterBottom className="logintypography">
                        Create a New Course
                    </Typography></Button>
                    <Grid container spacing={24} >
                        <Grid item xs={12} md={12}>

                        </Grid>
                    </Grid>
                </Grid>

            </div >
        );
    }


}




export default QuizzesPage;
