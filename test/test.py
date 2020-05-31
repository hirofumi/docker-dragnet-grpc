from dragnet import extract_content
import unittest


HTML = '''
<html>
<head><title>hello, world</title></head>
<body>
<div>
<h1>hello, world</h1>
<p>The quick brown fox jumps over the lazy dog.</p>
</div>
</body>
</html>
'''


class Test(unittest.TestCase):

    def test_extraction(self):
        self.assertEqual('The quick brown fox jumps over the lazy dog.', extract_content(HTML))


if __name__ == '__main__':
    unittest.main()
