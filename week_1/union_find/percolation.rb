require 'test/unit'


# http://coursera.cs.princeton.edu/algs4/assignments/percolation.html
class Percolation
  
  attr_reader :matrix

  def initialize n
    @n = n
    row = [nil] * @n
    @matrix = []
    @n.times do
      @matrix << row
    end
  end

  def open(i, j)
    @matrix[i][j] = i
  end

  def isOpen(i, j)
    !@matrix[i][j].nil?
  end

  def isFull(i, j)
    @matrix[i][j] == 0
  end

  def percolates
  end
end

class RandomSites

  attr_reader :sites

  def initialize n
    rows = (0..n-1).to_a.shuffle
    cols = (0..n-1).to_a.shuffle
    @sites = rows.product(cols).shuffle   
  end

end

class PercolationTest < Test::Unit::TestCase

  def setup
    n = 5
    @sites = RandomSites.new(n).sites
    @percolation = Percolation.new(n)
    print @sites
    print @percolation.matrix
  end

  def test_open
    print @sites[0]
    @percolation.open(*@sites[0])
    print @percolation.matrix 
  end
end