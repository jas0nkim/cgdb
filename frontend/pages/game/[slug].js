import { useRouter } from 'next/router';

const Game = ({ game }) => {
    const router = useRouter()
    
    if (router.isFallback) {
        return <div>Loading...</div>
    }

    return <div>Title: {game.title}</div>
};

export async function getStaticPaths() {
    const resp = await fetch(`http://localhost:8001/api/games/`)
    const games = await resp.json()
    const paths = games.map((game) => {
        return {
            params: { slug: game.slug }
        }
    })
    return { paths, fallback: true }
}

export async function getStaticProps({ params }) {
    const resp = await fetch(`http://localhost:8001/api/games/${params.slug}/`)
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