
import React from 'react';
import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';
import ListItemIcon from '@material-ui/core/ListItemIcon';
import ListItemText from '@material-ui/core/ListItemText';
import PropTypes from "prop-types";
import HomeIcon from '@material-ui/icons/Home';
import DescriptionIcon from '@material-ui/icons/Description';
import ExtensionIcon from '@material-ui/icons/Extension';
import PhoneIcon from '@material-ui/icons/Phone';

/* import your desired icon from material-ui icons library */
import { NavLink } from 'react-router-dom';


export const publicNavs = [
    {
        url: '/home',
        name: 'Home',
        icon: <HomeIcon />
    },
    {
        url: '/quizzes',
        name: 'Quizzes',
        icon: <DescriptionIcon />
    },
];



export default () => (
    publicNavs.map((navItem) => {
        return <NavLink to={navItem.url} className="NavLinkItem" key={navItem.url} activeClassName="NavLinkItem-selected"> <List component="nav" >  <ListItem button>
            <ListItemIcon className="innernavitem">
                {navItem.icon}
            </ListItemIcon>
            <ListItemText primary={navItem.name} className="innernavitem" color="black" />
        </ListItem></List> </NavLink>
    })




);





