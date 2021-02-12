import Link from "next/link";
import { makeStyles } from '@material-ui/core/styles';
import { CardMedia, Grid, Paper, Typography } from "@material-ui/core";
import configData from "../../../config.json";

const useStyles = makeStyles((theme) => ({
    root: {
        flexGrow: 1,
    },
    paper: {
        width: 100,
    },
    media: {
        height: 100,
    },
    control: {
        padding: theme.spacing(2),
    },
}));

const StadiaGamesPage = ({ platform }) => {
    const classes = useStyles();

    return (
        <>
            <Typography gutterBottom variant="h5" component="h5">
                Stadia Games
            </Typography>
            <Grid container className={classes.root} spacing={2}>
                {platform.games.map((game) => (
                    <Grid key={game.slug} item>
                        <Paper className={classes.paper} elevation={0}>
                            <Link href={'/game/' + game.slug} passHref>
                                <CardMedia
                                    className={classes.media}
                                    image={ game.pictures.length > 0 ? game.pictures[0] : configData.PLACEHOLDER_IMG }
                                    title={ game.slug }
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

export async function getStaticProps({ params }) {
    const resp = await fetch(`${configData.API_SERVER_URL}platforms/stadia/`)
    const platform = await resp.json()
    if (!platform) {
        return {
            notFound: true,
        }
    }
    return {
        props: { platform },
    }
}

export default StadiaGamesPage;