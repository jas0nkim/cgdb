import { Button, Checkbox, Divider, Drawer, FormControl, FormControlLabel, FormGroup, FormHelperText, FormLabel, List, ListItem, ListItemText, makeStyles } from "@material-ui/core"
import Link from "next/link";
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

const links = [
    {
      name: 'xCloud',
      url: '/platform/xcloud',
    },
    {
      name: 'Stadia',
      url: '/platform/stadia',
    },
    {
      name: 'Stadia Games',
      url: '/platform/stadia/games',
    },
    {
      name: 'GeForce Now',
      url: '/platform/geforce-now',
    },
    {
      name: 'PlayStation Now',
      url: '/platform/playstation-now',
    },
    {
      name: 'Apple Arcade',
      url: '/platform/apple-arcade',
    },
    {
      name: 'Luna',
      url: '/platform/luna',
    },
]
  
const GameFilterDrawer = (props) => {
    const { window } = props;
    const classes = useStyles();
    const [drawerOpen, setDrawerOpen] = useState(false);
    const [toggleGenres, setToggleGenres] = useState(false);
    const [state, setState] = useState({
        gilad: true,
        jason: false,
        antoine: false,
    });

    const handleDrawerToggle = () => {
        setDrawerOpen(!drawerOpen);
    };

    const handleGenreToggle = () => {
        setToggleGenres(!toggleGenres);
    };

    const container = window !== undefined ? () => window().document.body : undefined;

    const handleChange = (event) => {
        setState({ ...state, [event.target.name]: event.target.checked });
    };

    const drawer = (
        <div>
            <div className={classes.toolbar} />
            <Divider />
            <FormControl component="fieldset" className={classes.formControl}>
                <FormLabel component="legend">Stadia Pro</FormLabel>
                <FormGroup>
                    <FormControlLabel
                        control={<Checkbox onChange={handleChange} name="free" />}
                        label="Free with Pro"
                    />
                </FormGroup>
                <FormLabel component="legend">ESRB rating</FormLabel>
                <FormGroup>
                    <FormControlLabel
                        control={<Checkbox onChange={handleChange} name="e" />}
                        label="Everyone"
                    />
                    <FormControlLabel
                        control={<Checkbox onChange={handleChange} name="e10+" />}
                        label="Everyone 10+"
                    />
                    <FormControlLabel
                        control={<Checkbox onChange={handleChange} name="t" />}
                        label="Teen"
                    />
                    <FormControlLabel
                        control={<Checkbox onChange={handleChange} name="m" />}
                        label="Mature 17+"
                    />
                    <FormControlLabel
                        control={<Checkbox onChange={handleChange} name="na" />}
                        label="Not available"
                    />
                </FormGroup>
                <FormLabel component="legend">Genre</FormLabel>
                <FormGroup>
                    <FormControlLabel
                        control={<Checkbox onChange={handleChange} name="e" />}
                        label="Shooter"
                    />
                    <FormControlLabel
                        control={<Checkbox onChange={handleChange} name="e10+" />}
                        label="Indie"
                    />
                    <FormControlLabel
                        control={<Checkbox onChange={handleChange} name="t" />}
                        label="Role-playing game"
                    />
                    <FormControlLabel
                        control={<Checkbox onChange={handleChange} name="m" />}
                        label="Arcade"
                    />
                    <FormControlLabel
                        control={<Checkbox onChange={handleChange} name="m" />}
                        label="Kids & family"
                        display="none"
                    />
                    { toggleGenres ?
                        <Button onClick={handleGenreToggle}>More</Button>
                        :
                        <>
                            <FormControlLabel
                                control={<Checkbox onChange={handleChange} name="m" />}
                                label="Kids & family"
                                display="none"
                            />
                            <FormControlLabel
                                control={<Checkbox onChange={handleChange} name="m" />}
                                label="Kids & family"
                                display="none"
                            />
                            <FormControlLabel
                                control={<Checkbox onChange={handleChange} name="m" />}
                                label="Kids & family"
                                display="none"
                            />
                            <Button onClick={handleGenreToggle}>Less</Button>
                        </>
                    }
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