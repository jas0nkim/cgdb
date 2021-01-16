import Link from 'next/link'
import { useRouter } from 'next/router';
import { makeStyles, withStyles } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import CardActionArea from '@material-ui/core/CardActionArea';
import CardContent from '@material-ui/core/CardContent';
import CardMedia from '@material-ui/core/CardMedia';
import MuiAccordion from '@material-ui/core/Accordion';
import MuiAccordionSummary from '@material-ui/core/AccordionSummary';
import MuiAccordionDetails from '@material-ui/core/AccordionDetails';
import Typography from '@material-ui/core/Typography';
import configData from "../../config.json";
import Head from 'next/head';
import { List, ListItem, ListItemText } from '@material-ui/core';

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

const Accordion = withStyles({
    root: {
      border: '1px solid rgba(0, 0, 0, .125)',
      boxShadow: 'none',
      '&:not(:last-child)': {
        borderBottom: 0,
      },
      '&:before': {
        display: 'none',
      },
      '&$expanded': {
        margin: 'auto',
      },
    },
    expanded: {},
})(MuiAccordion);

const AccordionSummary = withStyles({
    root: {
      backgroundColor: 'rgba(0, 0, 0, .03)',
      borderBottom: '1px solid rgba(0, 0, 0, .125)',
      marginBottom: -1,
      minHeight: 56,
      '&$expanded': {
        minHeight: 56,
      },
    },
    content: {
      '&$expanded': {
        margin: '12px 0',
      },
    },
    expanded: {},
})(MuiAccordionSummary);

const AccordionDetails = withStyles((theme) => ({
    root: {
      padding: theme.spacing(2),
    },
}))(MuiAccordionDetails);

const PlatformPage = ({ platform }) => {
    const classes = useStyles();
    const router = useRouter();

    if (router.isFallback) {
        return <div>Loading...</div>
    }

    const verdict = (
        <List>
            {platform.verdict.map((verdict) => (
                <ListItem key={`verdict-${Math.random()}`}>
                    <ListItemText primary={verdict}/>
                </ListItem>
            ))}
        </List>
    );

    const countries = (
        <Accordion square>
            <AccordionSummary
                aria-controls="panel-countries-content"
                id="panel-countries-header"
            >
                <Typography>Available regions</Typography>
            </AccordionSummary>
            <AccordionDetails>
                <List>
                    {platform.available_countries.map((country) => (
                        <ListItem key={`country-${Math.random()}`}>
                            <ListItemText primary={country}/>
                        </ListItem>
                    ))}
                </List>
            </AccordionDetails>
        </Accordion>
    );

    const requirements = (
        <Accordion square>
            <AccordionSummary
                aria-controls="panel-requirements-content"
                id="panel-requirements-header"
            >
                <Typography>Internet requirements</Typography>
            </AccordionSummary>
            <AccordionDetails>
                <Typography>
                    {platform.internet_requirements}
                </Typography>
            </AccordionDetails>
        </Accordion>
    );

    const devices = (
        <Accordion square>
            <AccordionSummary
                aria-controls="panel-devices-content"
                id="panel-devices-header"
            >
                <Typography>Supported devices</Typography>
            </AccordionSummary>
            <AccordionDetails>
                <List>
                    {platform.supported_devices.map((device) => (
                        <ListItem key={`device-${Math.random()}`}>
                            <ListItemText primary={device}/>
                        </ListItem>
                    ))}
                </List>
            </AccordionDetails>
        </Accordion>
    );

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
            <Head>
                <title>{configData.SITE_NAME} - {platform.name}</title>
                <meta name="description" content={platform.description} />
                <meta property="og:title" content={`${configData.SITE_NAME} - ${platform.name}`} key="og-title" />
                <meta property="og:url" content={`${configData.SITE_HOST}/platform/${platform.slug}`} key="og-url" />
                <meta property="og:description" content={platform.description} key="og-description" />
                <meta property="og:image" content={platform.pictures.length > 0 ? platform.pictures[0] : configData.PLACEHOLDER_IMG} key="og-image" />
            </Head>
            <Card className={classes.root} variant="outlined">
                <CardMedia
                    className={classes.media}
                    image={ platform.pictures.length > 0 ? platform.pictures[0] : configData.PLACEHOLDER_IMG }
                    title={ platform.slug }
                />
                <CardContent>
                    <Typography gutterBottom variant="h5" component="h2">
                        { platform.name }
                    </Typography>
                </CardContent>
                <CardContent>
                    {verdict}
                    {countries}
                    {requirements}
                    {devices}
                </CardContent>
            </Card>
            <div>
                <Typography gutterBottom variant="h5" component="h5">
                    Games
                </Typography>
                {games}
            </div>
        </>
    );
};

export async function getStaticPaths() {
    const resp = await fetch(`${configData.API_SERVER_URL}platforms/`)
    const platforms = await resp.json()
    const paths = platforms.map((platform) => {
        return {
            params: { slug: platform.slug }
        }
    })
    return { paths, fallback: true }
}

export async function getStaticProps({ params }) {
    const resp = await fetch(`${configData.API_SERVER_URL}platforms/${params.slug}/`)
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

export default PlatformPage;