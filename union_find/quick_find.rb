require 'test/unit'

class QuickFindUF
 
 attr_reader :array

 def initialize n
  @n = n-1
  @array = (0..@n).to_a
 end

 def connected x, y
   @array[x] == y
 end

 def union x, y
  (0..@n).each do |i|
    @array[i] = y if @array[i] == x
  end
 end

end


class QuickFindUFTest < Test::Unit::TestCase
  
  def setup
    @obj = QuickFindUF.new(10)
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