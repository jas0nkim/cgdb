import Link from 'next/link'
import { makeStyles } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import CardActionArea from '@material-ui/core/CardActionArea';
import CardActions from '@material-ui/core/CardActions';
import CardContent from '@material-ui/core/CardContent';
import CardMedia from '@material-ui/core/CardMedia';
import Button from '@material-ui/core/Button';
import Typography from '@material-ui/core/Typography';

const useStyles = makeStyles((theme) => ({
  root: {
    maxWidth: '100%',
    marginBottom: theme.spacing(2),
  },
  media: {
    height: 140,
  },
}));

const MediaCard = ({ game }) => {
    const classes = useStyles();

    const platforms = game.platforms.map((platform) =>
        <Link key={platform.slug} href={'/platform/' + platform.slug} passHref>
            <Button size="small" color="primary">
                {platform.name}
            </Button>
        </Link>
    )

    return (
        <Card className={classes.root} variant="outlined">
            <Link href={'/game/' + game.slug} passHref>
                <CardActionArea>
                    <CardMedia
                        className={classes.media}
                        image={ game.images.length > 0 ? game.images[0] : process.env.NEXT_PUBLIC_PLACEHOLDER_IMG }
                        title={ game.slug }
                    />
                    <CardContent>
                        <Typography gutterBottom variant="h5" component="h2">
                            { game.title }
                        </Typography>
                        {/* <Typography variant="body2" color="textSecondary" component="p">
                            {Object.keys(game.title_lc).map((key, index) =>
                                <Chip
                                    key={key}
                                    avatar={<Avatar>{key}</Avatar>}
                                    label={game.title_lc[key]}
                                />
                            )}
                        </Typography> */}
                    </CardContent>
                </CardActionArea>
            </Link>
        <CardActions>
            {platforms}
        </CardActions>
        </Card>
    );
}

export default MediaCard;