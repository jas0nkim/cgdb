import Link from 'next/link'
import { useRouter } from 'next/router';
import { makeStyles } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import CardActions from '@material-ui/core/CardActions';
import CardContent from '@material-ui/core/CardContent';
import CardMedia from '@material-ui/core/CardMedia';
import Button from '@material-ui/core/Button';
import Typography from '@material-ui/core/Typography';
import Table from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableCell from '@material-ui/core/TableCell';
import TableContainer from '@material-ui/core/TableContainer';
import TableRow from '@material-ui/core/TableRow';
import configData from "../../config.json";
import Head from 'next/head';

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

const GamePage = ({ game }) => {
    const classes = useStyles();
    const router = useRouter();

    if (router.isFallback) {
        return <div>Loading...</div>
    }

    const locales = (locales) => {
        const ret = []
        for (const locale in locales) {
            ret.push(<li key={locale}>{locale}: {locales[locale]}</li>)
        }
        return ret
    }
    const links = (references) => {
        const ret = []
        for (const key in references) {
            ret.push(<li key={key}><a key={key} href={references[key]} target="_blank">{key}</a></li>)
        }
        return ret
    }
    const platforms = game.platforms.map((platform) =>
        <Link key={platform.slug} href={'/platform/' + platform.slug} passHref>
            <Button size="small" color="primary">
                {platform.name}
            </Button>
        </Link>
    )
    const developers = game.developers.map((developer) =>
        <div key={developer.name}>{developer.name}</div>
    )
    const publishers = game.publishers.map((publisher) =>
        <div key={publisher.name}>{publisher.name}</div>
    )
    const series = game.series.map((series) =>
        <div key={series.name}>{series.name}</div>
    )
    const genres = game.genres.map((genre) =>
        <div key={genre.name}>{genre.name}</div>
    )
    const modes = game.modes.map((mode) =>
        <div key={mode.name}>{mode.name}</div>
    )

    return (
        <>
            <Head>
                <title>{configData.SITE_NAME} - {game.title}</title>
                <meta name="description" content={game.description} />
                <meta property="og:title" content={`${configData.SITE_NAME} - ${game.title}`} key="og-title" />
                <meta property="og:url" content={`${configData.SITE_HOST}/game/${game.slug}`} key="og-url" />
                <meta property="og:description" content={game.description} key="og-description" />
                <meta property="og:image" content={game.pictures.length > 0 ? game.pictures[0] : configData.PLACEHOLDER_IMG} key="og-image" />
            </Head>
            <Card className={classes.root} variant="outlined">
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
                <CardActions>
                    {platforms}
                </CardActions>
                <CardContent>
                    <Typography variant="body2" color="textSecondary" component="p">
                        {game.description}
                    </Typography>
                    <TableContainer>
                        <Table className={classes.table} size="small" aria-label="description table">
                            <TableBody>
                                <TableRow key="developers">
                                    <TableCell
                                        className={classes.tableCell}
                                        align="left"
                                    >
                                        Developers
                                    </TableCell>
                                    <TableCell
                                        className={classes.tableCell}
                                        align="right"
                                    >
                                        {developers}
                                    </TableCell>
                                </TableRow>
                                <TableRow key="publishers">
                                    <TableCell
                                        className={classes.tableCell}
                                        align="left"
                                    >
                                        Publishers
                                    </TableCell>
                                    <TableCell
                                        className={classes.tableCell}
                                        align="right"
                                    >
                                        {publishers}
                                    </TableCell>
                                </TableRow>
                                <TableRow key="series">
                                    <TableCell
                                        className={classes.tableCell}
                                        align="left"
                                    >
                                        Series
                                    </TableCell>
                                    <TableCell
                                        className={classes.tableCell}
                                        align="right"
                                    >
                                        {series}
                                    </TableCell>
                                </TableRow>
                                <TableRow key="genres">
                                    <TableCell
                                        className={classes.tableCell}
                                        align="left"
                                    >
                                        Genres
                                    </TableCell>
                                    <TableCell
                                        className={classes.tableCell}
                                        align="right"
                                    >
                                        {genres}
                                    </TableCell>
                                </TableRow>
                                <TableRow key="modes">
                                    <TableCell className={classes.tableCell} align="left">Modes</TableCell>
                                    <TableCell className={classes.tableCell} align="right">{modes}</TableCell>
                                </TableRow>
                            </TableBody>
                        </Table>
                    </TableContainer>
                </CardContent>
            </Card>
        </>
      );
};

export async function getStaticPaths() {
    const resp = await fetch(`${configData.API_SERVER_URL}games/`)
    const games = await resp.json()
    const paths = games.map((game) => {
        return {
            params: { slug: game.slug }
        }
    })
    return { paths, fallback: true }
}

export async function getStaticProps({ params }) {
    const resp = await fetch(`${configData.API_SERVER_URL}games/${params.slug}/`)
    const game = await resp.json()
    if (!game) {
        return {
            notFound: true,
        }
    }
    return {
        props: { game },
    }
}

export default GamePage;