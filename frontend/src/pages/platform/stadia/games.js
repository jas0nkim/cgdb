import Link from "next/link";
import { useState } from "react";
import { makeStyles } from '@material-ui/core/styles';
import { CardMedia, Grid, Paper, Typography } from "@material-ui/core";
import GameFilterDrawer from "../../../components/GameFilterDrawer";

const useStyles = makeStyles((theme) => ({
    root: {
        flexGrow: 1,
    },
    paper: {
        width: 100,
    },
    media: {
        height: 100,
        cursor: 'pointer',
    },
    control: {
        padding: theme.spacing(2),
    },
}));

const defaultQueryString = "platform=3"

const StadiaGamesPage = ({ allGames, gameGenres, loading }) => {
    const classes = useStyles();
    const [games, setGames] = useState(allGames);
    const [loadingGames, setLoadingGames] = useState(loading);
    const [filterQueryString, setFilterQueryString] = useState('');
    const defaultFilters = [
        {
            value: 'subscription',
            label: 'Stadia Pro',
            showMore: false,
            items: [
                {
                    label: 'Free with Pro',
                    value: 'free',
                    checked: false,
                },
            ],
        },
        {
            value: 'esrb',
            label: 'ESRB rating',
            showMore: false,
            items: [
                {
                    label: 'Everyone',
                    value: 'E',
                    checked: false,
                },
                {
                    label: 'Everyone 10+',
                    value: 'E10+',
                    checked: false,
                },
                {
                    label: 'Teen',
                    value: 'T',
                    checked: false,
                },
                {
                    label: 'Mature 17+',
                    value: 'M',
                    checked: false,
                },
                {
                    label: 'Not available',
                    value: 'NA',
                    checked: false,
                },
            ],
        },
        {
            value: 'genre',
            label: 'Genre',
            showMore: false,
            items: gameGenres.map((genre) => {
                return {
                    label: genre.name,
                    value: genre.id.toString(),
                    checked: false,
                }
            }),
        },
    ]

    const handleFilterChanged = (querystring) => {
        setFilterQueryString(querystring);
        querystring = defaultQueryString + '&' + querystring;
        setLoadingGames(true);
        fetch(
            `${process.env.NEXT_PUBLIC_API_SERVER_URL}games/?${querystring}`
        ).then(async (resp) => {
            const filteredGames = await resp.json()
            setGames(filteredGames)
            setLoadingGames(false);
        })
    };

    return (
        <>
            <CardMedia
                className={classes.media}
                image="https://ssl.gstatic.com/stadia/gamers/assets/stadia_logo_and_text_v1.jpg"
                title="Stadia logo"
            />
            <Typography gutterBottom variant="h5" component="h5">
                Stadia Games
            </Typography>
            <GameFilterDrawer
                defaultFilters={defaultFilters}
                prevQueryString={filterQueryString}
                loadingGames={loadingGames}
                onChange={handleFilterChanged}
            />
            <Grid container className={classes.root} spacing={2}>
                {games.map((game) => (
                    <Grid key={game.slug} item>
                        <Paper className={classes.paper} elevation={0}>
                            <Link href={'/game/' + game.slug} passHref>
                                <CardMedia
                                    className={classes.media}
                                    image={ game.images.length > 0 ? game.images[0] : process.env.NEXT_PUBLIC_PLACEHOLDER_IMG }
                                    title={game.slug}
                                />
                            </Link>
                            <Link href={'/game/' + game.slug}>
                                { game.title }
                            </Link>
                        </Paper>
                    </Grid>
                ))}
            </Grid>
        </>
    )
}

export async function getServerSideProps({ params }) {
    let resp = await fetch(`${process.env.NEXT_PUBLIC_API_SERVER_URL}games/?${defaultQueryString}`)
    const allGames = await resp.json()
    if (!allGames) {
        return {
            notFound: true,
        }
    }
    resp = await fetch(`${process.env.NEXT_PUBLIC_API_SERVER_URL}game-genres/`)
    const gameGenres = await resp.json()
    const loading = false;
    return {
        props: { allGames, gameGenres, loading },
    }
}

export default StadiaGamesPage;