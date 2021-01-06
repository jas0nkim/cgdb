import { useState } from 'react';
import Link from 'next/link';
import { makeStyles } from '@material-ui/core/styles';
import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';
// import ListItemIcon from '@material-ui/core/ListItemIcon';
import ListItemText from '@material-ui/core/ListItemText';
// import Divider from '@material-ui/core/Divider';

const useStyles = makeStyles((theme) => ({
    root: {
        width: '100%',
        maxWidth: 360,
        backgroundColor: theme.palette.background.default,
    },
}));

const ListItemNextLink = (props) => {
    return (
        <Link href={props.suggestion.link}>
            <ListItem button component="a">
                <ListItemText>{props.suggestion.text}</ListItemText>
            </ListItem>
        </Link>
    );
}

const SearchSuggestions = (props) => {
    const classes = useStyles();

    console.log("props", props);

    return (
        <div className={classes.root}>
            <List component="nav" aria-label="searchbox suggestions">
                {props.suggestions.map((suggestion, index) =>
                    <ListItemNextLink key={suggestion.slug} suggestion={suggestion} />
                )}
            </List>
        </div>
    );
}

export default SearchSuggestions;