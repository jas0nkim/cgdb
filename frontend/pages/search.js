import { useState } from 'react';
import Link from 'next/link'
import configData from "../config.json";

const SearchPage = (props) => {
    const [input, setInput] = useState('');
    const [gameListDefault, setGameListDefault] = useState(props.games);
    const [gameList, setGameList] = useState(props.games);

    const updateInput = async (input) => {
        const filtered = gameListDefault.filter(game => {
         return game.title.toLowerCase().includes(input.toLowerCase())
        })
        setInput(input);
        setGameList(filtered);
    }

    return (
        <>
            <label htmlFor="search">Search Games</label>
            <input type="text"
                value={input}
                placeholder={"Search game"}
                onChange={(e) => updateInput(e.target.value) } />
            <div>
                <ul>
                {gameList.map((game, index) => {
                    if (game) {
                        const picture = (pictures, slug) => {
                            if (pictures.length < 1) {
                                return null;
                            }
                            return (
                                <Link href={'/game/' + slug}>
                                    <img src={game.pictures[0]} style={{ cursor: 'pointer' }} />
                                </Link>
                            )
                        }
                        const translations = title_lc => {
                            const ret = []
                            for (const key in title_lc) {
                                ret.push(<li key={key}><small>{title_lc[key]}: {key}</small></li>)
                            }
                            return ret
                        }
                        const platforms = game.platforms.map(platform => {
                            return <li key={platform.slug}>{platform.name}</li>
                        })

                        return (
                            <li key={game.title}>
                                <div>
                                    {picture(game.pictures, game.slug)}
                                    <Link href={'/game/' + game.slug}>
                                        {game.title}
                                    </Link>
                                    <div>Translations:
                                        <ul>{translations(game.title_lc)}</ul>
                                    </div>
                                    <div>
                                        Platforms: <ul>{platforms}</ul>
                                    </div>
                                </div>
                            </li>
                        )
                    }
                    return null
                })}
                </ul>
            </div>
        </>
    )
}

export async function getStaticProps() {
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


export default SearchPage;