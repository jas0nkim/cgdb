import unittest
import boto3
from urllib.request import urlopen

class PictureUploadToS3Tests(unittest.TestCase):
    
    def setUp(self):
        self.s3 = boto3.resource('s3')
    
    def test_connection(self):
        self.assertIn('cgdb-image', [b.name for b in self.s3.buckets.all()])

    def test_upload_images(self):
        image_url = 'https://cdn.akamai.steamstatic.com/steam/apps/289650/capsule_616x353.jpg'
        with urlopen(image_url) as imageobj:
            self.assertIsNone(self.s3.meta.client.upload_fileobj(
                                imageobj,
                                'cgdb-image',
                                '_test-image.jpg',
                                ExtraArgs={
                                    'ACL': 'public-read',
                                    'ContentType': 'image/jpeg'
                                }
                            ))
