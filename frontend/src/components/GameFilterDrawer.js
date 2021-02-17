import { Button, Checkbox, Divider, Drawer, FormControl, FormControlLabel, FormGroup, FormLabel, makeStyles } from "@material-ui/core"
import { useState } from "react";

const drawerWidth = 360;

const useStyles = makeStyles((theme) => ({
  root: {
    display: 'flex',
  },
  menuButton: {
    marginRight: theme.spacing(2),
  },
  // necessary for content to be below app bar
  toolbar: theme.mixins.toolbar,
  drawerPaper: {
    width: drawerWidth,
  },
  formControl: {
    margin: theme.spacing(2),
  },  
}));

const GameFilterDrawer = (props) => {
    const { window, genres } = props;
    const classes = useStyles();
    const [drawerOpen, setDrawerOpen] = useState(false);
    const [genresMore, setGenresMore] = useState(false);
    const [filters, setFilters] = useState({});
    const esrbs = [
        {
            'name': 'Everyone',
            'value': 'E',
        },
        {
            'name': 'Everyone 10+',
            'value': 'E10+',
        },
        {
            'name': 'Teen',
            'value': 'T',
        },
        {
            'name': 'Mature 17+',
            'value': 'M',
        },
        {
            'name': 'Not available',
            'value': 'NA',
        },
    ]

    const handleDrawerToggle = () => {
        setDrawerOpen(!drawerOpen);
    };

    const handleGenreToggle = () => {
        setGenresMore(!genresMore);
    };

    const container = window !== undefined ? () => window().document.body : undefined;

    const handleChangeFilter = (event) => {
        setFilters({
            ...filters,
            [event.target.name]: {
                ...filters[event.target.name],
                [event.target.value]: event.target.checked
            }
        });
    };

    const esrbHtml = esrbs.map((esrb) =>
        <FormControlLabel
            key={`esrb-${esrb.value}`}
            control={<Checkbox onChange={handleChangeFilter}
                                name="esrb"
                                value={esrb.value} />}
            label={esrb.name}
        />
    )

    const genresHtml = genres.map((genre, index) => {
        const template = (
            <FormControlLabel
                key={`genre-${genre.id}`}
                control={<Checkbox onChange={handleChangeFilter}
                                    name="genre"
                                    value={genre.id.toString()}/>}
                label={genre.name}
            />
        );

        if (index < 5) {
            return template;
        } else if (genresMore) {
            return template;
        } else {
            return null;
        }
    })

    const drawer = (
        <div>
            <div className={classes.toolbar} />
            <Divider />
            <FormControl component="fieldset" className={classes.formControl}>
                <FormLabel component="legend">Stadia Pro</FormLabel>
                <FormGroup>
                    <FormControlLabel
                        control={<Checkbox onChange={handleChangeFilter} name="free" />}
                        label="Free with Pro"
                    />
                </FormGroup>
                <FormLabel component="legend">ESRB rating</FormLabel>
                <FormGroup>
                    {esrbHtml}
                </FormGroup>
                <FormLabel component="legend">Genre</FormLabel>
                <FormGroup>
                    {genresHtml}
                    <Button onClick={handleGenreToggle}>
                        { genresMore ? 'Less' : 'More' }
                    </Button>
                </FormGroup>
            </FormControl>
        </div>
    );
  
    return (
        <>
            <Button onClick={handleDrawerToggle}>Filter</Button>
            <nav className={classes.drawer} aria-label="manu drawer">
                <Drawer
                container={container}
                variant="temporary"
                anchor="right"
                open={drawerOpen}
                onClose={handleDrawerToggle}
                classes={{
                    paper: classes.drawerPaper
                }}
                ModalProps={{
                    keepMounted: true, // Better open performance on mobile.
                }}
                >
                    {drawer}
                </Drawer>
            </nav>
        </>
    );
}

export default GameFilterDrawer;