import { useRouter } from 'next/router'
import Link from 'next/link'
import configData from "../config.json";

const SearchResult = (props) => {
    const router = useRouter();
    const { games } = props;

    return (
        <>
            <ul>
                {games.map((game, index) => {
                    return (
                        <li key={game.slug}>
                            <Link href={'/game/' + game.slug}>
                                {game.title}
                            </Link>
                        </li>
                    )
                })}
            </ul>
        </>
    );
}

export async function getServerSideProps({ query }) {
    const resp =
        await fetch(`${configData.API_SERVER_URL}search/${query.q}/`)
    const games = await resp.json()
    if (!games) {
        return {
            notFound: true,
        }
    }
    return {
        props: { games },
    }
}

export default SearchResult;