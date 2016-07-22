from random import shuffle
import unittest

def quicksort(lst):
    return (quicksort([x for x in lst[1:] if x < lst[0]]) +
           lst[:1] + 
           quicksort([x for x in lst[1:] if x >= lst[0]])) if len(lst) > 1 else lst

class QuickSortTest(unittest.TestCase):
  
    def setUp(self):
        self.ary = list(range(10))
        shuffle(self.ary)
 
    def test_initialize(self):
        self.assertEqual(len(self.ary), 10)
        self.assertNotEqual(self.ary, list(range(10)))

    def test_quicksort(self):
        self.assertEqual(quicksort(self.ary), list(range(10)))

if __name__ == '__main__':
    unittest.main()