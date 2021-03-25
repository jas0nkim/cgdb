import unittest
from cgdb_core import utils

class PictureUploadToS3Tests(unittest.TestCase):

    s3_filename = '_test-image.jpg'
    
    def tearDown(self):
        """
        Delete all images uploaded to s3 during this test
        """
        utils.delete_from_s3(self.s3_filename)

    def test_upload_images(self):
        image_url = 'https://cdn.akamai.steamstatic.com/steam/apps/289650/capsule_616x353.jpg'
        self.assertEqual(utils.upload_to_s3(
                            source_url=image_url,
                            s3_filename=self.s3_filename),
                        f"{utils.S3_IMAGES_HOST}{self.s3_filename}")
