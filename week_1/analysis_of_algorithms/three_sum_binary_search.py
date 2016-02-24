import unittest
import timeit

class ThreeSumBinarySearch:

    def __init__(self, array):
      self.array = array
      self.array.sort()
      self.n = len(self.array)

    def count(self):
      count = 0
      for i in range(self.n):
        for j in range(i+1, self.n):
          val = (self.array[i] + self.array[j]) * -1
          if self.find(j+1, self.n-1, val):
            count += 1 
      return count

    def find(self, lo, hi, key):

        while (lo <= hi):
          mid = lo + (hi - lo)/2
          if key < self.array[mid]:
            hi = mid -1
          elif key > self.array[mid]:
            lo = mid +1
          else:
            return True 

        return False


class ThreeSumBinarySearchTest(unittest.TestCase):
    
  def test_count(self):
    arr1 = [-3, -2, -1, 0, 1, 2, 3]
    obj = ThreeSumBinarySearch(arr1)
    self.assertEqual(obj.count(), 5)

    arr2 = [3, 2, 1, 0, 1, 2, 3]
    obj = ThreeSumBinarySearch(arr2)
    self.assertEqual(obj.count(), 0)

if __name__ == '__main__':
    setup = '''
from __main__ import ThreeSumBinarySearch
import random

array = random.sample(range(-1000, 1000), 100)
'''
    print(max(timeit.repeat("ThreeSumBinarySearch(array).count()", setup= setup, number= 10)))
    unittest.main()