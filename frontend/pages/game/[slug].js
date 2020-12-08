import Link from 'next/link'
import { useRouter } from 'next/router';
import configData from "../../config.json";

const Game = ({ game }) => {
    const router = useRouter()
    if (router.isFallback) {
        return <div>Loading...</div>
    }
    const pictures = game.pictures.map((picture) => {
        if ('high' in picture) {
            return <li><img src={picture.high} /></li>
        } else if ('mid' in picture) {
            return <li><img src={picture.mid} /></li>
        } else if ('low' in picture) {
            return <li><img src={picture.low} /></li>
        }
    })
    const links = (references) => {
        const ret = []
        for (const key in references) {
            ret.push(<li><a href={references[key]} target="_blank">{key}</a></li>)
        }
        return ret
    }
    const developers = game.developers.map((developer) => <li>{developer.name}</li>)
    const publishers = game.publishers.map((publisher) => <li>{publisher.name}</li>)
    const series = game.series.map((series) => <li>{series.name}</li>)
    const platforms = game.platforms.map((platform) => (
        <Link href={'/platform/' + platform.slug}>{platform.name}</Link>
    ))
    const genres = game.genres.map((genre) => <li>{genre.name}</li>)
    const modes = game.modes.map((mode) => <li>{mode.name}</li>)

    return (
        <div>
            <div>Title: {game.title}</div>
            <div>Description: {game.description}</div>
            <div>Pictures: <ul>{ pictures }</ul></div>
            <div>Links: <ul>{ links(game.links) }</ul></div>
            <div>Developers: <ul>{ developers }</ul></div>
            <div>Publishers: <ul>{ publishers }</ul></div>
            <div>Series: <ul>{ series }</ul></div>
            <div>Platforms: <ul>{ platforms }</ul></div>
            <div>Genres: <ul>{ genres }</ul></div>
            <div>Modes: <ul>{ modes }</ul></div>
        </div>
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