require 'test/unit'
require_relative 'weighted_quick_union_uf'

class Percolation

  def initialize(n)
    @size = n
    @top = 0
    @bottom = @size ** 2 + 1
    @qf = WeightedQuickUnionUF.new(@size ** 2 + 2)
    @opened = Array.new(@size){Array.new(@size){false}}
  end

  def open(i, j)
    @opened[i -1][j -1] = true
    
    @qf.union(get_qf_index(i, j), @top) if i == 1
    @qf.union(get_qf_index(i, j), @bottom) if i == @size

    @qf.union(get_qf_index(i, j), get_qf_index(i, j - 1)) if (j > 1 && is_open(i, j - 1))
    @qf.union(get_qf_index(i, j), get_qf_index(i, j + 1)) if (j < @size && is_open(i, j + 1))
    @qf.union(get_qf_index(i, j), get_qf_index(i - 1 , j)) if (i > 1  && is_open(i - 1, j))
    @qf.union(get_qf_index(i, j), get_qf_index(i + 1 , j)) if (i < @size && is_open(i + 1, j))
  end

  def is_open(i, j)
    @opened[i -1][j -1]
  end

  def is_full(i, j)
    return @qf.connected(@top, get_qf_index(i, j)) if (0 < i && i <= @size && 0 < j && j <= @size)
    false
  end

  def percolates
    @qf.connected(@top, @bottom)
  end

  def get_qf_index(i, j)
    @size * (i -1) + j
  end

end

class RandomValues

  class << self
    def generate_for n
      range = (1..n).to_a
      range.product(range).shuffle
    end
  end

end

class PercolationTest < Test::Unit::TestCase
  
  def setup
    n = 5
    @perc = Percolation.new(n)
    @rv = RandomValues.generate_for(n)
  end


  def test_percolates

    c = 0
    
    while @perc.percolates == false do
      @perc.open(*@rv[c])
      c += 1
    end

    print "Pecolates after #{c} attempts"

  end

end
