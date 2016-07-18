from random import shuffle
import unittest

class MergeSort:

    def __init__(self, array):
        self.ary = array

    def execute(self):
        self.merge_sort(self.ary)
        return self.ary

    def merge_sort(self, lst):
        if len(lst) > 1:
            lhalf, rhalf = self.split_list(lst)
            self.merge_sort(lhalf)
            self.merge_sort(rhalf)

            lst, k, l_idx, r_idx = self.sort(lst, lhalf, rhalf)
            self.sort_remainder(lst, k, lhalf, l_idx)
            self.sort_remainder(lst, k, rhalf, r_idx)

    def sort_remainder(self, lst, k, half, half_idx):
      while half_idx < len(half):
          lst[k] = half[half_idx]
          half_idx += 1
          k += 1

    def sort(self, lst, lhalf, rhalf):
        i, j, k = 0, 0, 0
        while i < len(lhalf) and j < len(rhalf):
            if lhalf[i] < rhalf[j]:
                lst[k] = lhalf[i]
                i += 1
            else:
                lst[k] = rhalf[j]
                j += 1
            k += 1
        return lst, k, i, j

    def split_list(self, lst):
        mid = len(lst) /2
        lhalf = lst[:mid]
        rhalf = lst[mid:]    
        return lhalf, rhalf


class MergeSortTest(unittest.TestCase):
  
    def setUp(self):
        ary = list(range(10))
        shuffle(ary)
        self.obj = MergeSort(ary)

    def test_initialize(self):
        self.assertEqual(len(self.obj.ary), 10)

    def test_split_list(self):
        lhalf, rhalf = self.obj.split_list([0, 1, 2, 3, 4])
        self.assertEqual(lhalf, [0, 1])
        self.assertEqual(rhalf, [2, 3, 4])

    def test_merge_sort(self):
        expected = list(range(10))
        self.assertNotEqual(self.obj.ary, expected)
        self.assertEqual(self.obj.execute(), expected)


if __name__ == '__main__':
    unittest.main()
