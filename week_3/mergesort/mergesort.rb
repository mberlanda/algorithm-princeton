require 'test/unit'

class MergeSort

  attr_reader :ary

  def initialize(array)
    @ary = array
  end

  def execute
    merge_sort(@ary)
  end

  def merge_sort(lst)
    if lst.size > 1
      lhalf, rhalf = split_list(lst)
      merge_sort(lhalf)
      merge_sort(rhalf)
      merge(lst, lhalf, rhalf)
    
    else
      lst
    end
  end

  def merge(lst, lhalf, rhalf)
    k, l, r = 0, 0, 0

    loop do
      break if l >= lhalf.size and r >= rhalf.size
      
      if r >= rhalf.size or (l < lhalf.size and lhalf[l] < rhalf[r])
        lst[k] = lhalf[l]
        l += 1
        k += 1
      else
        lst[k] = rhalf[r]
        r += 1
        k += 1
      end 
    end

  end

  def split_list(lst)
    lst.each_slice( (lst.size / 2.0).round ).to_a
  end

end


class MergeSortTest < Test::Unit::TestCase

  def setup
    ary = (0..9).to_a.shuffle
    @obj = MergeSort.new(ary)
  end

  def test_initialize
    assert_equal(@obj.ary.size, 10)
  end

  def test_split_list
    ary = [1, 2, 3, 4, 5]
    left, right = @obj.split_list(ary)

    assert_equal(left, [1, 2, 3])
    assert_equal(right, [4, 5])
  end

  def test_merge_sort
    expected = (0..9).to_a
    assert_not_equal(@obj.ary, expected)

    @obj.execute()
    assert_equal(@obj.ary, expected)
  end
end