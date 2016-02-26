import unittest
from random import shuffle
from weighted_quick_union_uf import WeightedQuickUnionUF

class Percolation:

  def __init__(self, n):
    self.size = n
    self.top = 0
    self.bottom = self.size ** 2 + 1
    self.qf = WeightedQuickUnionUF(self.size ** 2 + 2)
    self.opened = [[False for x in range(self.size)] for x in range(self.size)]

  def open(self, i, j):
    self.opened[i -1][j -1] = True
    
    if (i == 1):
      self.qf.union(self.get_qf_index(i, j), self.top) 
    elif (i == self.size):
      self.qf.union(self.get_qf_index(i, j), self.bottom) 

    if (j > 1 and self.is_open(i, j - 1)):
      self.qf.union(self.get_qf_index(i, j), self.get_qf_index(i, j - 1)) 
    if (j < self.size and self.is_open(i, j + 1)):
      self.qf.union(self.get_qf_index(i, j), self.get_qf_index(i, j + 1)) 
    if (i > 1  and self.is_open(i - 1, j)):
      self.qf.union(self.get_qf_index(i, j), self.get_qf_index(i - 1 , j))
    if (i < self.size and self.is_open(i + 1, j)):
      self.qf.union(self.get_qf_index(i, j), self.get_qf_index(i + 1 , j)) 

  def is_open(self, i, j):
    self.opened[i -1][j -1]

  def is_full(self, i, j):
    if (0 < i and i <= self.size and 0 < j and j <= self.size):
      return self.qf.connected(self.top, self.get_qf_index(i, j)) 
    else:
      return False

  def percolates(self):
    return self.qf.connected(self.top, self.bottom)

  def get_qf_index(self, i, j):
    return self.size * (i -1) + j
  
class RandomValues:

  def __init__(self, n):
    values = list(range(1, n+1))
    self.sample = []
    for y in values:
      self.sample += [[x,y] for x in values]

class PercolationTest(unittest.TestCase):

  def test_percolation(self):
    n = 5
    perc = Percolation(n)
    rv = RandomValues(n).sample
    print(rv)
    c = 0

    while (perc.percolates() == False):
      print(rv[c])
      perc.open(*rv[c])
      print perc.percolates()
      c += 1
      print perc.qf.array

    print("Pecolates after " + str(c) + " attempts")


if __name__ == '__main__':
  unittest.main()
