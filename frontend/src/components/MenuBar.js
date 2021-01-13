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

function HideOnScroll(props) {
  const { children, window } = props;
  // Note that you normally won't need to set the window ref as useScrollTrigger
  // will default to window.
  // This is only being set here because the demo is in an iframe.
  const trigger = useScrollTrigger({ target: window ? window() : undefined });

  return (
    <Slide appear={false} direction="down" in={!trigger}>
      {children}
    </Slide>
  );
}

HideOnScroll.propTypes = {
  children: PropTypes.element.isRequired,
  /**
   * Injected by the documentation to work in an iframe.
   * You won't need it on your project.
   */
  window: PropTypes.func,
};

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

const platforms = [
  {
    name: 'xCloud',
    slug: 'xcloud',
  },
  {
    name: 'Stadia',
    slug: 'stadia',
  },
  {
    name: 'Luna',
    slug: 'luna',
  },
]

const MenuBar = (props) => {
  const { window, pageProps } = props;
  const classes = useStyles();
  const [drawerOpen, setDrawerOpen] = useState(false);
  const router = useRouter();

  const handleDrawerToggle = () => {
      console.log('clicked')
      setDrawerOpen(!drawerOpen);
  };

  const container = window !== undefined ? () => window().document.body : undefined;

  const drawer = (
      <div>
          <div className={classes.toolbar} />
          <Divider />
          <List>
          {platforms.map((platform, index) => (
              <Link href={`/platform/${platform.slug}`} passHref key={platform.slug}>
                <ListItem button component="a" onClick={handleDrawerToggle}>
                    <ListItemText primary={platform.name} />
                </ListItem>
              </Link>
          ))}
          </List>
      </div>
  );

  return (
    <HideOnScroll {...props}>
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
    </HideOnScroll>
  );
}

export default MenuBar;