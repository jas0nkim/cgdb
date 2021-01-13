import React from 'react';
import PropTypes from 'prop-types';
import Head from 'next/head';
import { makeStyles, ThemeProvider } from '@material-ui/core/styles';
import CssBaseline from '@material-ui/core/CssBaseline';
import Container from '@material-ui/core/Container';
import MenuBar from '../components/MenuBar'
import theme from '../theme';
import configData from "../config.json";

const useStyles = makeStyles((theme) => ({
  // necessary for content to be below app bar
  toolbar: theme.mixins.toolbar,
  content: {
    flexGrow: 1,
    padding: theme.spacing(3),
  },
}));

export default function MyApp(props) {
  const classes = useStyles();
  const { Component, pageProps } = props;

  React.useEffect(() => {
    // Remove the server-side injected CSS.
    const jssStyles = document.querySelector('#jss-server-side');
    if (jssStyles) {
      jssStyles.parentElement.removeChild(jssStyles);
    }
  }, []);

  return (
    <React.Fragment>
      <Head>
        <title>{ configData.SITE_NAME } - Cloud Gaming Database</title>
        <meta name="description" content="" />
        <meta property="og:title" content={`${configData.SITE_NAME} - Cloud Gaming Database`} key="og-title" />
        <meta property="og:url" content={`${configData.SITE_HOST}/`} key="og-url" />
        <meta property="og:description" content="" key="og-description" />
        <meta property="og:og-image" content="" key="description" />
        <meta name="viewport" content="minimum-scale=1, initial-scale=1, width=device-width" />
      </Head>
      <ThemeProvider theme={theme}>
        {/* CssBaseline kickstart an elegant, consistent, and simple baseline to build upon. */}
        <CssBaseline />
        <Container maxWidth="md">
          <MenuBar {...pageProps} />
          <main className={classes.content}>
            <div className={classes.toolbar} />
            <Component {...pageProps} />
          </main>
        </Container>
      </ThemeProvider>
    </React.Fragment>
  );
}

MyApp.propTypes = {
  Component: PropTypes.elementType.isRequired,
  pageProps: PropTypes.object.isRequired,
};