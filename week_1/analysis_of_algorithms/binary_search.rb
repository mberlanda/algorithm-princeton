require 'test/unit'

class BinarySearch
 
  def initialize array=[]
    @array = array
    @n = (@array.size) -1
  end

  def find key
    lo, hi = 0, @n
    while (lo <= hi) do
      mid = lo + (hi - lo)/2
      if key < @array[mid]
        hi = mid -1
      elsif key > @array[mid]
        lo = mid +1
      else
        return mid
      end
    end

    return false
  end

end

class BinarySearchTest < Test::Unit::TestCase
  
  def setup
    array = [1, 5, 7, 11, 12, 18, 19, 20, 33, 42, 77, 93, 101]
    @obj = BinarySearch.new(array)
  end


  def test_find
    assert_equal(4, @obj.find(12))
    assert_equal(false, @obj.find(8))

  end

end
