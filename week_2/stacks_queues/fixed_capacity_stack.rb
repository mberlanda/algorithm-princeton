require 'test/unit'

class FixedCapacityStack

  attr_reader :s, :n

  def initialize capacity
    new_stack
    @capacity = capacity
  end

  def new_stack
    @s = Array.new
    @n = 0
  end

  def is_empty
    @n == 0
  end

  def push item
    if @n < @capacity
      @s[@n] = item
      @n += 1
    else
      puts 'Stack is already full'
      new_stack
    end
  end

  def pop
    begin
      item = @s[@n-1]
      @s[@n-1] = nil
      return item
    rescue Exception => e
      e.message
    end 
  end

end

class FixedCapacityStackTest < Test::Unit::TestCase
  
  def setup
    @stack = FixedCapacityStack.new(5)
  end


  def test_is_empty
    assert_equal(true, @stack.is_empty)
  end

  def test_empty_pop
    assert_raise(@stack.pop)
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