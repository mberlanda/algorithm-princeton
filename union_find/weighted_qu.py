import unittest

class QuickUnionUF:

    def __init__(self, n):
      self.n = n
      self.array = list(range(n))
      self.size = { key: 0 for key in self.array }

    def connected(self, x, y):
      return self.__root(x) == self.__root(y)

    def union(self, x, y):
      i, j = self.__root(x), self.__root(y)
      if i == j:
        return
      elif self.size[i] < self.size[j]:
        self.array[i] = j
        self.size[j] += self.size[i]
      else:
        self.array[j] = i
        self.size[i] += self.size[j]

    def __root(self, i):
      while i != self.array[i]:
        i = self.array[i]
      return i

class QuickUnionUFTest(unittest.TestCase):
  
    def setUp(self):
        self.obj = QuickUnionUF(10)

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