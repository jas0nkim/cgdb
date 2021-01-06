import { useState } from 'react';
import { useRouter } from 'next/router'
import { FormControl, Input, InputAdornment, IconButton }
    from '@material-ui/core';
import { makeStyles } from '@material-ui/core/styles';
import SearchIcon from '@material-ui/icons/Search';
import SearchSuggestions from './SearchSuggestions';
import configData from "../config.json";

const useStyles = makeStyles((theme) => ({
    formControl: {
        margin: theme.spacing(3),
    },
}));

const Search = ({ term }) => {
    let initTerm = ''
    if (typeof term !== 'undefined' && typeof term == 'string') {
        initTerm = term
    }

    const classes = useStyles();
    const router = useRouter();
    const [input, setInput] = useState(initTerm);
    const [suggestions, setSuggestions] = useState([]);

    const updateInput = async (inputValue) => {
        setInput(inputValue);
        if (inputValue.length < 3) {
            setSuggestions([]);
            return false;
        }
        const resp =
            await fetch(`${configData.API_SERVER_URL}search/${inputValue}/`);
        const games = await resp.json();
        const suggestionList =
            games.slice(0, configData.MAX_SUGGESTIONS).map((game) => {
                return {
                    slug: game.slug,
                    text: game.title,
                    link: '/game/' + game.slug
                }
            })
        setSuggestions(suggestionList);
    }

    const handleSearch = (e) => {
        e.preventDefault();
        router.push(`/search?q=${input}`)
    }

    return (
        <form onSubmit={handleSearch}>
            <FormControl className={classes.formControl} variant="filled">
                <Input
                    placeholder="Search Game..."
                    value={input}
                    onChange={(e) => updateInput(e.target.value)}
                    inputProps={{ 'aria-label': 'search' }}
                    endAdornment={
                        <InputAdornment position="end">
                        <IconButton
                            aria-label="search button"
                            onClick={handleSearch}
                        >
                            <SearchIcon />
                        </IconButton>
                        </InputAdornment>
                    }
                />
                <SearchSuggestions suggestions={suggestions} />
            </FormControl>
        </form>
    );
}

export default Search;