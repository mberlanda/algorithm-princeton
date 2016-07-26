import unittest

# http://interactivepython.org/runestone/static/pythonds/Trees/BinaryHeapImplementation.html
class BinHeap:

    def __init__(self):
        self.heapList = [0]
        self.currentSize = 0
    
    def percUp(self,i):
        while i // 2 > 0:
          if self.heapList[i] < self.heapList[i // 2]:
             tmp = self.heapList[i // 2]
             self.heapList[i // 2] = self.heapList[i]
             self.heapList[i] = tmp
          i = i // 2

    def insert(self,k):
        self.heapList.append(k)
        self.currentSize = self.currentSize + 1
        self.percUp(self.currentSize)

    def percDown(self,i):
        while (i * 2) <= self.currentSize:
            mc = self.minChild(i)
            if self.heapList[i] > self.heapList[mc]:
                tmp = self.heapList[i]
                self.heapList[i] = self.heapList[mc]
                self.heapList[mc] = tmp
            i = mc

    def minChild(self,i):
        if i * 2 + 1 > self.currentSize:
            return i * 2
        else:
            if self.heapList[i*2] < self.heapList[i*2+1]:
                return i * 2
            else:
                return i * 2 + 1

    def delMin(self):
        retval = self.heapList[1]
        self.heapList[1] = self.heapList[self.currentSize]
        self.currentSize = self.currentSize - 1
        self.heapList.pop()
        self.percDown(1)
        return retval

    def buildHeap(self,alist):
        i = len(alist) // 2
        self.currentSize = len(alist)
        self.heapList = [0] + alist[:]
        while (i > 0):
            self.percDown(i)
            i = i - 1

class BinaryHeapTest(unittest.TestCase):

    def setUp(self):
      self.bin_heap = BinHeap()

    def test_initialize(self):
      self.assertEqual(self.bin_heap.heapList, [0])
      self.assertEqual(self.bin_heap.currentSize, 0)

    def test_insert(self):
      self.bin_heap.insert(5)
      self.assertEqual(self.bin_heap.currentSize, 1)
      self.assertEqual(self.bin_heap.heapList, [0, 5])

      self.bin_heap.insert(8)
      self.assertEqual(self.bin_heap.currentSize, 2)      
      self.assertEqual(self.bin_heap.heapList, [0, 5, 8])

      self.bin_heap.insert(2)
      self.assertEqual(self.bin_heap.currentSize, 3) 
      self.assertEqual(self.bin_heap.heapList, [0, 2, 8, 5])

    def test_delMin(self):
      self.bin_heap.buildHeap([1, 3, 4, 2, 5])
      self.assertEqual(self.bin_heap.heapList, [0, 1, 2, 4, 3, 5])
      self.assertEqual(self.bin_heap.currentSize, 5)

      self.assertEqual(self.bin_heap.delMin(), 1)

if __name__ == '__main__':
    unittest.main()