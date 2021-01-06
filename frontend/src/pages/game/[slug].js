import Link from 'next/link'
import { useRouter } from 'next/router';
import configData from "../../config.json";

const Game = ({ game }) => {
    const router = useRouter()
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
    const pictures = game.pictures.map((picture) => {
        return <li key={picture}><img key={picture} src={picture} /></li>
    })
    const links = (references) => {
        const ret = []
        for (const key in references) {
            ret.push(<li key={key}><a key={key} href={references[key]} target="_blank">{key}</a></li>)
        }
        return ret
    }
    const developers = game.developers.map((developer) => <li key={developer}>{developer}</li>)
    const publishers = game.publishers.map((publisher) => <li key={publisher}>{publisher}</li>)
    const series = game.series.map((series) => <li key={series}>{series}</li>)
    const platforms = game.platforms.map((platform) => (
        <li key={platform.slug}><Link href={'/platform/' + platform.slug}>{platform.name}</Link></li>
    ))
    const genres = game.genres.map((genre) => <li key={genre}>{genre}</li>)
    const modes = game.modes.map((mode) => <li key={mode}>{mode}</li>)

    return (
        <>
            <div>Title: {game.title}</div>
            <div>Title locales: {locales(game.title_lc)}</div>
            <div>Description: {game.description}</div>
            <div>Description locales: {locales(game.description_lc)}</div>
            <div>Pictures: <ul>{ pictures }</ul></div>
            <div>Links: <ul>{ links(game.links) }</ul></div>
            <div>Developers: <ul>{ developers }</ul></div>
            <div>Publishers: <ul>{ publishers }</ul></div>
            <div>Series: <ul>{ series }</ul></div>
            <div>Platforms: <ul>{ platforms }</ul></div>
            <div>Genres: <ul>{ genres }</ul></div>
            <div>Modes: <ul>{ modes }</ul></div>
        </>
    )
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

export default Game;