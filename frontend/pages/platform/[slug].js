import Link from 'next/link'
import { useRouter } from 'next/router';
import configData from "../../config.json";

const Platform = ({ platform }) => {
    const router = useRouter()
    if (router.isFallback) {
        return <div>Loading...</div>
    }
    const pictures = platform.pictures.map((picture) => {
        return <li key={picture}><img src={picture} /></li>
    })
    const games = platform.games.map((game) => (
        <li key={game.slug}><Link href={'/game/' + game.slug}>{game.title}</Link></li>
    ))

    return (
        <>
            <div>Name: {platform.name}</div>
            <div>Description: {platform.description}</div>
            <div>Pictures: <ul>{pictures}</ul></div>
            <div>Games: <ul>{ games }</ul></div>
        </>
    )
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

export default Platform;