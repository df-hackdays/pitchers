import React from 'react';
import { Button, Input, InputLabel } from '@material-ui/core';
import { withStyles } from '@material-ui/core/styles';
import Typography from '@material-ui/core/Typography';
import { Link } from 'gatsby';

import Layout from '../components/layout';

const styles = theme => ({
    section: {
        marginTop: theme.spacing.unit * 3
    },
    toolbar: {
        marginTop: theme.spacing.unit * 2
    },
    button: {
        marginRight: theme.spacing.unit
    }
});

const IndexPage = ({ classes }) => (
    <Layout>
        
        <Typography variant="display2" gutterBottom>
            Welcome to CodeTrek
        </Typography>
        <Typography>To begin, please sign in using your username and password.</Typography>
        <section className={classes.section}>
            <Typography variant="title" gutterBottom>
                Please enter your Username/Password
            </Typography>
            <div className={classes.toolbar}>
                <div>
                    <InputLabel>
                        Username
                    </InputLabel>
                </div>
                <div>
                    <Input className={classes.input}> </Input>
                </div>
            </div>
            <div className={classes.toolbar}>
                <div>
                    <InputLabel>
                        Password
                    </InputLabel>
                </div>
                <div>
                    <Input className={classes.input}> </Input>
                </div>
            </div>
            <div className={classes.toolbar}>
                <Button
                    variant="contained"
                    color="primary"
                    className={classes.button}
                    onClick={() => {console.log("test")}}
                >
                    Sign In
                </Button>
            </div>
        </section>
        <section className={classes.section}>
            <Link to="/sign-up/">Don't have a username? Sign-Up here!</Link>
        </section>
    </Layout>
);

export default withStyles(styles)(IndexPage);
