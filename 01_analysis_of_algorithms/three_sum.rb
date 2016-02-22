require 'test/unit'
require 'benchmark'

class ThreeSum
 
  def initialize array=[]
    @array = array
    @n = (@array.size) -1
  end

  def count
    count = 0
    (0..@n).to_a.each do |i|
      j = i+1
      (j..@n).to_a.each do |j|
        k = j+1
        (k..@n).to_a.each do |k|
          count += 1 if (@array[i] + @array[j] + @array[k] == 0)
        end
      end
    end
    return count
  end

end

# Check performance
BM_ARRAY = (-10000..10000).map { rand }

Benchmark.bm do |x|
  x.report { 50.times do;  ThreeSum.new(BM_ARRAY.sample(100)); end }
end

# Test object
class ThreeSumTest < Test::Unit::TestCase
  
  def test_count
    arr1 = [-3, -2, -1, 0, 1, 2, 3]
    obj = ThreeSum.new(arr1)
    assert_equal(5, obj.count())

    arr2 = [3, 2, 1, 0, 1, 2, 3]
    obj = ThreeSum.new(arr2)
    assert_equal(0, obj.count())
  end

end
