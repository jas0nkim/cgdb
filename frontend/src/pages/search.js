import { useRouter } from 'next/router'
import Head from 'next/head';
import SearchedItem from "../components/SearchedItem"

const SearchResultPage = (props) => {
    const router = useRouter();
    const { games } = props;

    return (
        <>
            <Head>
                <title>{ process.env.NEXT_PUBLIC_SITE_NAME } - Search</title>
                <meta name="description" content="" />
                <meta property="og:title" content={`${process.env.NEXT_PUBLIC_SITE_NAME} - Search`} key="og-title" />
                <meta property="og:url" content={`${process.env.NEXT_PUBLIC_SITE_HOST}/search`} key="og-url" />
                <meta property="og:description" content="" key="og-description" />
                <meta property="og:og-image" content="" key="description" />
            </Head>
            {games.map((game, index) =>
                <SearchedItem key={game.slug} game={game} />
            )}
        </>
    );
}

export async function getServerSideProps({ query }) {
    const resp =
        await fetch(`${process.env.NEXT_PUBLIC_API_SERVER_URL}search/${encodeURI(query.q)}/`)
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

export default SearchResultPage;