import { useState } from 'react';
import PropTypes from 'prop-types';
import { useRouter } from 'next/router'
import Link from 'next/link'
import { makeStyles } from '@material-ui/core/styles';
import useScrollTrigger from '@material-ui/core/useScrollTrigger';
import Drawer from '@material-ui/core/Drawer';
import Hidden from '@material-ui/core/Hidden';
import Slide from '@material-ui/core/Slide';
import { AppBar, IconButton, Toolbar, List, ListItem, ListItemText, Divider }
  from '@material-ui/core';
import MenuIcon from '@material-ui/icons/Menu';
import SearchBox from "./SearchBox"

const drawerWidth = 240;

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
}));

const links = [
  {
    name: 'Xbox Game Pass',
    url: '/platform/xbox-game-pass',
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

const MenuBar = (props) => {
  const { window, pageProps } = props;
  const classes = useStyles();
  const [drawerOpen, setDrawerOpen] = useState(false);
  const router = useRouter();

  const handleDrawerToggle = () => {
      setDrawerOpen(!drawerOpen);
  };

  const container = window !== undefined ? () => window().document.body : undefined;

  const drawer = (
      <div>
          <div className={classes.toolbar} />
          <Divider />
          <List>
          {links.map((link, index) => (
              <Link href={link.url} passHref key={link.url}>
                <ListItem button component="a" onClick={handleDrawerToggle}>
                    <ListItemText primary={link.name} />
                </ListItem>
              </Link>
          ))}
          </List>
      </div>
  );

  return (
    <>
      <div className={classes.root}>
        <AppBar position="fixed" className={classes.appBar}>
          <Toolbar>
            <IconButton
              color="inherit"
              aria-label="open drawer"
              edge="start"
              onClick={handleDrawerToggle}
              className={classes.menuButton}
            >
              <MenuIcon />
            </IconButton>
            <SearchBox term={router.query.q} {...pageProps} />
          </Toolbar>
        </AppBar>
        <nav className={classes.drawer} aria-label="manu drawer">
            <Drawer
              container={container}
              variant="temporary"
              anchor="left"
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
      </div>
    </>
  );
}

export default MenuBar;