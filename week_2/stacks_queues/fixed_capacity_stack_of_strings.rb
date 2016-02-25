require 'test/unit'

class FixedCapacityStackOfStrings

  attr_reader :s, :n

  def initialize capacity
    @s = Array.new
    @n = 0
    @capacity = capacity
  end

  def is_empty
    @n == 0
  end

  def push item
    if @n < @capacity
      @s[@n] = item
      @n += 1
    else
      begin
        raise 'Stack is already full'
      rescue Exception => e
        puts e.message
      end
    end
  end

  def pop
    if !is_empty
      item = @s[@n-1]
      @s[@n-1] = nil
      return item
    else
      begin
        raise 'Stack is still empty'
      rescue Exception => e
        puts e.message
        puts e.backtrace.inspect
      end 
    end
  end

end

class FixedCapacityStackOfStringsTest < Test::Unit::TestCase
  
  def setup
    @stack = FixedCapacityStackOfStrings.new(5)
  end


  def test_is_empty
    assert_equal(true, @stack.is_empty)
  end

  def test_push
    @stack.push('a')
    assert_equal(false, @stack.is_empty)
    assert_equal('a', @stack.s[@stack.n-1])
  end

  def test_pop
    @stack.push('b')
    assert_equal('b', @stack.pop)
  end

end