require 'test/unit'

class QuickUnionUF
 
  attr_reader :array

  def initialize n
    @n = n-1
   @array = (0..@n).to_a
  end

  def connected x, y
    root(x) == root(y)
  end

  def union x, y
    i, j = root(x), root(y)
    @array[i] = j
  end

  private

  def root (i)
    i = @array[i] until i == @array[i]
    return i
  end

end


class QuickUnionUFTest < Test::Unit::TestCase
  
  def setup
    @obj = QuickUnionUF.new(10)
  end

  def test_initialize
    expected = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    assert_equal(expected, @obj.array)
  end

  def test_connected
    assert_equal(false, @obj.connected(2, 3))
  end

  def test_union
    @obj.union(2, 3)
    assert_equal(true, @obj.connected(2, 3))
  end

end