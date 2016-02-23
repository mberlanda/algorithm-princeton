require_relative 'weighted_quick_union_uf'

class Percolation

  def initialize(n)
    size = n
    bottom = size * size + 1
    qf = WeightedQuickUnionUF.new(size ** 2 + 2)
  end

  def open(i, j)
    opened[i -1][j -1] = true
  end
end

# https://github.com/vgoodvin/princeton-algs4/blob/master/Percolation/Percolation.java