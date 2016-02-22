import unittest
import timeit

class ThreeSum:

    def __init__(self, array):
      self.array = array
      self.n = len(self.array)

    def count(self):
      count = 0
      for i in range(self.n):
        for j in range(i+1, self.n):
          for k in range(j+1, self.n):
            if (self.array[i] + self.array[j] + self.array[k] == 0):
              count += 1 
      return count

class ThreeSumTest(unittest.TestCase):
    
  def test_count(self):
    arr1 = [-3, -2, -1, 0, 1, 2, 3]
    obj = ThreeSum(arr1)
    self.assertEqual(obj.count(), 5)

    arr2 = [3, 2, 1, 0, 1, 2, 3]
    obj = ThreeSum(arr2)
    self.assertEqual(obj.count(), 0)

if __name__ == '__main__':
    setup = '''
from __main__ import ThreeSum
import random

array = random.sample(range(-1000, 1000), 100)
'''
    print(max(timeit.repeat("ThreeSum(array).count()", setup= setup, number= 10)))
    unittest.main()