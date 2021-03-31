import os
import re
import uuid
import boto3
import logging
from urllib.request import urlopen, Request
from urllib.error import HTTPError
from django.utils.text import slugify

logger = logging.getLogger(__name__)

# some stadia titles in wikipedia are not matching with titles in reddit:
#   'title in wikipedia': 'title in reddit', ...
STADIA_GAME_TITLE_MAP_FROM_WIKIPEDIA_TO_REDDIT = {
    "Attack on Titan 2": "Attack on Titan 2: Final Battle",
    "Baldur's Gate III": "Baldur's Gate 3",
    "Chronos": "Chronos: Before the Ashes",
    "Cyberpunk 2077": "Cyberpunk",
    "Jotun": "Jotun: Valhalla Edition",
    "Metro 2033": "Metro 2033 Redux",
    "Metro: Last Light": "Metro: Last Light Redux",
    "Monster Energy Supercross: The Official Videogame": "Monster Energy Supercross 3",
    "List of Monster Jam video games": "Monster Jam Steel Titans",
    "MotoGP 20": "MotoGP20",
    "Panzer Dragoon": "Panzer Dragoon: Remake",
    "Rise of the Tomb Raider": "Rise of the Tomb Raider: 20 Year Celebration",
    "Rock of Ages": "Rock of Ages 3: Make & Break",
    "Scott Pilgrim vs. the World: The Game": "Scott Pilgrim vs. The World",
    "Serious Sam": "Serious Sam Collection",
    "Shadow of the Tomb Raider": "Shadow of the Tomb Raider Definitive Edition",
    "SteamWorld Quest": "SteamWorld Quest: Hand of Gilgamech",
    "Submerged": "Submerged: Hidden Depths",
    "Sundered": "Sundered: Eldritch Edition",
    "Super Bomberman R": "SUPER BOMBERMAN R ONLINE",
    "Tomb Raider": "Tomb Raider: Definitive Edition",
    "Farming Simulator": "Farming Simulator 19",
    "Tom Clancy's The Division 2": "The Division 2",
    "Tom Clancy's Ghost Recon Wildlands": "Ghost Recon Wildlands",
    "Tom Clancy's Ghost Recon Breakpoint": "Ghost Recon Breakpoint",
    "Pac-Man": "PAC-MAN Mega Tunnel Battle",
    "Saints Row: The Third": "Saints Row: The Third - Remastered",
    "Dragon Quest XI": "DRAGON QUEST XI S",
    "Trine 4: The Nightmare Prince": "Trine 4",
}

# some stadia titles in wikipedia are not matching with titles in reddit:
#   'title in metacritic': 'title in reddit', ...
STADIA_GAME_TITLE_MAP_FROM_METACRITIC_TO_REDDIT = {
    "Borderlands 3: Designer's Cut": "Borderlands 3",
    "Destiny 2: The Collection": "Destiny 2",
    "Mortal Kombat 11 Ultimate": "Mortal Kombat 11",
    "Dead by Daylight: A Binding of Kin": "Dead by Daylight",
    "MotoGP 20": "MotoGP20",
    "Rise of the Tomb Raider": "Rise of the Tomb Raider: 20 Year Celebration",
    "The Elder Scrolls Online: Greymoor": "The Elder Scrolls Online",
    "DOOM Eternal: The Ancient Gods Part One": "DOOM Eternal",
    "Valkyria Chronicles 4: Complete Edition": "Valkyria Chronicles 4",
    "Cyberpunk 2077": "Cyberpunk",
    "Immortals Fenyx Rising: A New God": "Immortals Fenyx Rising",
    "Journey to the Savage Planet: Employee of the Month Edition": "Journey to the Savage Planet",
    "Monster Energy Supercross - The Official Videogame 3": "Monster Energy Supercross 3",
    "Monster Energy Supercross - The Official Videogame 4": "Monster Energy Supercross 4",
    "Hitman 3: Seven Deadly Sins - Greed": "HITMAN 3",
    "Disco Elysium: The Final Cut": "Disco Elysium",
    "Tom Clancy's The Division 2": "The Division 2",
    "Tom Clancy's Ghost Recon: Breakpoint": "Ghost Recon Breakpoint",
}

S3_IMAGES_BUCKET = os.getenv('S3_IMAGES_BUCKET', 'cgdb-image')
S3_IMAGES_HOST = f'https://{S3_IMAGES_BUCKET}.s3.amazonaws.com/'
S3_UPLOAD_EXTRA_ARGS = {
    'ACL': 'public-read',
    'ContentType': 'image/jpeg'
}

def generate_s3_filename(prefix, name):
    return f"{prefix}{slugify(name)}/{str(uuid.uuid4()).split('-')[0]}.jpg"

def upload_to_s3(source_url, s3_filename, s3_bucket=None):
    s3 = boto3.resource('s3')
    req = Request(source_url, headers={
                'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/605.1.15 (KHTML, like Gecko)'
            })
    try:
        with urlopen(req) as imageobj:
            s3.meta.client.upload_fileobj(
                            Fileobj=imageobj,
                            Bucket=s3_bucket if s3_bucket else S3_IMAGES_BUCKET,
                            Key=s3_filename,
                            ExtraArgs=S3_UPLOAD_EXTRA_ARGS,
                        )
    except HTTPError as e:
        logger.error(f'[HTTPError] {str(e)} - {source_url}')
        return None
    return f"{S3_IMAGES_HOST}{s3_filename}"

def delete_from_s3(s3_url, s3_bucket=None):
    s3 = boto3.resource('s3')
    return s3.meta.client.delete_object(
                        Bucket=s3_bucket if s3_bucket else S3_IMAGES_BUCKET,
                        Key=re.sub(f'^{S3_IMAGES_HOST}', '', s3_url),
                    )
