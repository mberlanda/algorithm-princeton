require 'test/unit'
require 'benchmark'

class ThreeSumBinarySearch

  def initialize array=[]
    @array = array.sort
    @n = (@array.size) -1
  end

  def count
    count = 0
    (0..@n).to_a.each do |i|
      j = i+1
      (j..@n).to_a.each do |j|
        val = (@array[i] + @array[j]) * -1
        k = j+1
        count += 1 if search(k, @n, val)
        end
      end
    return count
  end

  def search lo, hi, key

    while (lo <= hi) do
      mid = lo + (hi - lo)/2

      if key < @array[mid]
        hi = mid -1
      elsif key > @array[mid]
        lo = mid +1
      else
        return true
      end
    end

    return false
  end

end

# Check performance
BM_ARRAY = (-10000..10000).map { rand }

Benchmark.bm do |x|
  x.report { 50.times do;  ThreeSumBinarySearch.new(BM_ARRAY.sample(100)).count(); end }
end

# Test object
class ThreeSumBinarySearchTest < Test::Unit::TestCase

  def test_count
    arr1 = [-3, -2, -1, 0, 1, 2, 3]
    obj = ThreeSumBinarySearch.new(arr1)
    assert_equal(5, obj.count())

    arr2 = [3, 2, 1, 0, 1, 2, 3]
    obj = ThreeSumBinarySearch.new(arr2)
    assert_equal(0, obj.count())
  end

end
