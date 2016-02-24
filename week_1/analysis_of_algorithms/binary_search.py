import unittest

class BinarySearch:

    def __init__(self, array):
      self.array = array
      self.n = len(self.array)

    def find(self, key):
        lo, hi = 0, self.n -1 
        while (lo <= hi):
            mid = lo + (hi - lo)/2
            if key < self.array[mid]:
                hi = mid -1
            elif key > self.array[mid]:
                lo = mid +1
            else:
                return mid
        return False



class BinarySearchTest(unittest.TestCase):
  
  def setUp(self):
    array = [1, 5, 7, 11, 12, 18, 19, 20, 33, 42, 77, 93, 101]
    self.obj = BinarySearch(array)

  def test_find(self):
    self.assertEqual(self.obj.find(12), 4)
    self.assertEqual(self.obj.find(101), 12)
    self.assertEqual(self.obj.find(8), False)



if __name__ == '__main__':
    unittest.main()