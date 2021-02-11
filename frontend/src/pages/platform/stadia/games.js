import Link from "next/link";
import { makeStyles, withStyles } from '@material-ui/core/styles';
import { Card, CardActionArea, CardContent, CardMedia, Typography }
    from "@material-ui/core";
import configData from "../../../config.json";

const useStyles = makeStyles((theme) => ({
    root: {
      maxWidth: '100%',
      marginBottom: theme.spacing(2),
    },
    media: {
      height: 140,
    },
    table: {
        minWidth: 'sm',
    },
    tableCell: {
        color: theme.palette.text.secondary,
    },
}));

const StadiaGamesPage = ({ platform }) => {
    const classes = useStyles();

    const games = platform.games.map((game) => (
        <Card className={classes.root} key={game.slug} variant="outlined">
            <Link href={'/game/' + game.slug} passHref>
                <CardActionArea>
                    <CardMedia
                        className={classes.media}
                        image={ game.pictures.length > 0 ? game.pictures[0] : configData.PLACEHOLDER_IMG }
                        title={ game.slug }
                    />
                    <CardContent>
                        <Typography gutterBottom variant="h5" component="h2">
                            { game.title }
                        </Typography>
                    </CardContent>
                </CardActionArea>
            </Link>
        </Card>
    ))

    return (
        <>
            <Typography gutterBottom variant="h5" component="h5">
                Stadia Games
            </Typography>
            {games}
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