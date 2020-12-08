import { useRouter } from 'next/router';
import configData from "../../config.json";

const Platform = ({ platform }) => {
    const router = useRouter()    
    if (router.isFallback) {
        return <div>Loading...</div>
    }
    const pictures = (pictures) => {
        if ('high' in pictures) {
            return <li><img src={pictures.high} /></li>
        } else if ('mid' in picture) {
            return <li><img src={pictures.mid} /></li>
        } else if ('low' in picture) {
            return <li><img src={pictures.low} /></li>
        }
    }

    return (
        <div>
            <div>Name: {platform.name}</div>
            <div>Description: {platform.description}</div>
            <div>Pictures: <ul>{ pictures(platform.pictures) }</ul></div>
        </div>
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