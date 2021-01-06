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
    const { suggestion } = props
    return (
        <Link href={suggestion.link}>
            <ListItem button component="a">
                <ListItemText>{props.suggestion.text}</ListItemText>
            </ListItem>
        </Link>
    );
}

const SearchSuggestions = (props) => {
    const { suggestions } = props
    const classes = useStyles();

    return (
        <div className={classes.root}>
            <List component="nav" aria-label="searchbox suggestions">
                {suggestions.map((suggestion, index) =>
                    <ListItemNextLink
                        key={suggestion.slug}
                        suggestion={suggestion}
                    />
                )}
            </List>
        </div>
    );
}

export default SearchSuggestions;