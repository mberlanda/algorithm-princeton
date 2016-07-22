require 'test/unit'

class Array

  def quick_sort
    h, *t = self
    h ? t.partition { |e| e < h }.inject { |l, r| l.quick_sort + [h] + r.quick_sort } : []
  end

end


class QuickSort < Test::Unit::TestCase

  def setup
    @ary = (0..9).to_a.shuffle
    
  end

  def test_initialize
    assert_equal(@ary.size, 10)
    assert_not_equal(@ary.size, (0..9).to_a)
  end

  def test_quick_sort
    assert_equal(@ary.quick_sort, (0..9).to_a)
  end

end