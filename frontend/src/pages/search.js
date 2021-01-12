import { useRouter } from 'next/router'
import Link from 'next/link'
import SearchedItem from "../components/SearchedItem"
import configData from "../config.json";

const SearchResult = (props) => {
    const router = useRouter();
    const { games } = props;

    return (
        <>
            {games.map((game, index) =>
                <SearchedItem key={game.slug} game={game} />
            )}
        </>
    );
}

export async function getServerSideProps({ query }) {
    const resp =
        await fetch(`${configData.API_SERVER_URL}search/${encodeURI(query.q)}/`)
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