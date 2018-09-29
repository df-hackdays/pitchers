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
        <div class="mdc-card">
  <div class="mdc-card__media mdc-card__media--square">
    <div class="mdc-card__media-content">Title</div>
  </div>
  <div class="mdc-card__actions">
    <div class="mdc-card__action-buttons">
      <button class="mdc-button mdc-card__action mdc-card__action--button">Action 1</button>
      <button class="mdc-button mdc-card__action mdc-card__action--button">Action 2</button>
    </div>
    <div class="mdc-card__action-icons">
      <button class="material-icons mdc-icon-button mdc-card__action mdc-card__action--icon" title="Share">share</button>
      <button class="material-icons mdc-icon-button mdc-card__action mdc-card__action--icon" title="More options">more_vert</button>
    </div>
  </div>
</div>
    </Layout>
);

export default withStyles(styles)(IndexPage);
