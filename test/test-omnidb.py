import unittest
import logging
import requests
from requests.adapters import HTTPAdapter
from requests.packages.urllib3.util.retry import Retry

logging.basicConfig(level = logging.DEBUG)

session = requests.Session()
# retry for a total of 5 times, sleeping between retries with an
# increasing backoff of 1s, 2s, 4s, 8s, 16s
retries = Retry(total = 5, backoff_factor = 1)
session.mount('http://', HTTPAdapter(max_retries = retries))

class OmniDBResponseTest(unittest.TestCase):
    global session

    def get_status_code(self, url):
        return session.get(url).status_code

    def test_alpine(self):
        self.assertEqual(500, self.get_status_code("http://omnidb:8080"))

if __name__ == '__main__':
    unittest.main()
