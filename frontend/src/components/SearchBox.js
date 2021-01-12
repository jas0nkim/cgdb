import { useState } from 'react';
import { useRouter } from 'next/router'
import Autocomplete from '@material-ui/lab/Autocomplete';
import { FormControl, InputBase, InputAdornment, IconButton }
    from '@material-ui/core';
import SearchIcon from '@material-ui/icons/Search';
import { fade, makeStyles } from '@material-ui/core/styles';
import configData from "../config.json";

const useStyles = makeStyles((theme) => ({
    root: {
      flexGrow: 1,
    },
    menuButton: {
      marginRight: theme.spacing(2),
    },
    title: {
      flexGrow: 1,
      display: 'none',
      [theme.breakpoints.up('sm')]: {
        display: 'block',
      },
    },
    search: {
      position: 'relative',
      borderRadius: theme.shape.borderRadius,
      backgroundColor: fade(theme.palette.common.white, 0.15),
      '&:hover': {
        backgroundColor: fade(theme.palette.common.white, 0.25),
      },
      marginLeft: 0,
      width: '100%',
      [theme.breakpoints.up('sm')]: {
        marginLeft: theme.spacing(1),
        width: 'auto',
      },
    },
    searchIcon: {
      padding: theme.spacing(0, 2),
      height: '100%',
      position: 'absolute',
      pointerEvents: 'none',
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'center',
    },
    inputRoot: {
      color: 'inherit',
    },
    inputInput: {
      padding: theme.spacing(1, 1, 1, 0),
      // vertical padding + font size from searchIcon
      paddingLeft: `calc(${theme.spacing(4)}px)`,
      transition: theme.transitions.create('width'),
      width: '100%',
      [theme.breakpoints.up('sm')]: {
        width: '12ch',
        '&:focus': {
          width: '20ch',
        },
      },
    },
}));


const SearchBox = ({ term }) => {
    let initTerm = ''
    if (typeof term !== 'undefined' && typeof term == 'string') {
        initTerm = term
    }

    const classes = useStyles();
    const router = useRouter();
    const [input, setInput] = useState(initTerm);
    const [suggestions, setSuggestions] = useState([]);

    const onClickSuggestion = (e, value, reason) => {
        if (reason === 'select-option') {
            router.push(value.link);
        }
    }

    const onChageInput = (e, value, reason) => {
        updateSuggestionList(value);
    }

    const updateSuggestionList = async (inputValue) => {
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

    const getSuggestionLabel = (option) => (typeof option === 'string' ? option : option.text)

    const doSearch = (e) => {
        e.preventDefault();
        setSuggestions([]);
        router.push(`/search?q=${input}`)
    }

    const inputBox = (params) =>
        <form className={classes.search} onSubmit={doSearch} ref={params.InputProps.ref}>
            <FormControl variant="filled">
                <InputBase
                    placeholder="Search Game..."
                    classes={{
                        root: classes.inputRoot,
                        input: classes.inputInput,
                    }}
                    endAdornment={
                        <InputAdornment position="end">
                            <IconButton
                                aria-label="search button"
                                onClick={doSearch}
                            >
                                <SearchIcon />
                            </IconButton>
                        </InputAdornment>
                    }
                    {...params.inputProps}
                />
            </FormControl>
        </form>

    return (
        <Autocomplete
            id="search-box"
            value={input}
            options={suggestions}
            onInputChange={onChageInput}
            getOptionLabel={getSuggestionLabel}
            onChange={onClickSuggestion}
            renderInput={inputBox}
            freeSolo={true}
        />
    )
}

export default SearchBox;