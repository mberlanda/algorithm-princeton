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
      self.qf.union(get_qf_index(i, j), self.top) 
    elif (i == self.size):
      self.qf.union(get_qf_index(i, j), self.bottom) 

    if (j > 1 and self.is_open(i, j - 1)):
      self.qf.union(get_qf_index(i, j), get_qf_index(i, j - 1)) 
    if (j < self.size and self.is_open(i, j + 1)):
      self.qf.union(get_qf_index(i, j), get_qf_index(i, j + 1)) 
    if (i > 1  and self.is_open(i - 1, j)):
      self.qf.union(get_qf_index(i, j), get_qf_index(i - 1 , j))
    if (i < self.size and self.is_open(i + 1, j)):
      self.qf.union(get_qf_index(i, j), get_qf_index(i + 1 , j)) 

  def is_open(self, i, j):
    self.opened[i -1][j -1]

  def is_full(self, i, j):
    if (0 < i and i <= self.size and 0 < j and j <= self.size):
      return self.qf.connected(self.top, get_qf_index(i, j)) 
    else:
      return False

  def percolates(self):
    return self.qf.connected(self.top, self.bottom)

  def get_qf_index(self, i, j):
    return self.size * (i -1) + j
  
class RandomValues:

  def __init__(self, n):
    values = list(range(1, n+1))
    sample = []
    for x in values:
      for y in values:
        sample.append([x, y])
    return shuffle(sample)

class PercolationTest(unittest.TestCase):

  def test_percolation(self):
    n = 5
    perc = Percolation(n)
    rv = RandomValues(n)

    c = 0

    while (perc.percolates == True):
      perc.open(rv[c][0], rv[c][1])
      c += 1

    print("Pecolates after " + str(c) + " attempts")


if __name__ == '__main__':
  unittest.main()
