import unittest

class QuickFindUF:

    def __init__(self, n):
      self.n = n
      self.array = list(range(n))

    def connected(self, x, y):
      return self.array[x] == y

    def union(self, x, y):
      for i in range(self.n):
        if self.array[i] == x:
          self.array[i] = y

class QuickFindUFTest(unittest.TestCase):
  
    def setUp(self):
        self.obj = QuickFindUF(10)

    def test_initialize(self):
        expected = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        self.assertEqual(self.obj.array, expected)

    def test_connected(self):
        self.assertFalse(self.obj.connected(2, 3))

    def test_union(self):
        self.obj.union(2, 3)
        self.assertTrue(self.obj.connected(2, 3))

if __name__ == '__main__':
    unittest.main()