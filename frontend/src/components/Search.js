import { useState } from 'react';
import Input from '@material-ui/core/Input';
import SearchSuggestions from './SearchSuggestions';
import configData from "../config.json";

const Search = (props) => {
    const [input, setInput] = useState('');
    const [suggestions, setSuggestions] = useState([]);

    const updateInput = async (input) => {
        setInput(input);
        if (input.length < 3) {
            return false
        }
        const resp =
            await fetch(`${configData.API_SERVER_URL}search/${input}/`);
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

    return (
        <>
            <Input
                placeholder="Search Game..."
                value={input}
                onChange={(e) => updateInput(e.target.value)}
                inputProps={{ 'aria-label': 'search' }} />
            <SearchSuggestions suggestions={suggestions} />
        </>
    );
}

export async function getServerSideProps(context) {
    const resp = await fetch(`${configData.API_SERVER_URL}games/`)
    const games = await resp.json()
    if (!games) {
        return {
            notFound: true,
        }
    }
    return {
        props: { games },
    }
}

export default Search;