require 'test/unit'
require_relative 'node'

class LinkedStackOfStrings

  attr_reader :first

  def initialize
    @first = nil
  end

  def is_empty
    @first == nil
  end

  def push item
    oldfirst = @first
    @first = Node.new
    @first.set_item(item)
    @first.set_next(oldfirst)
  end

  def pop
    item = @first.item
    @first = @first.next
    return item
  end
end

class LinkedStackOfStringsTest < Test::Unit::TestCase
  
  def setup
    @stack = LinkedStackOfStrings.new
  end


  def test_is_empty
    assert_equal(true, @stack.is_empty)
  end

  def test_push
    @stack.push('a')
    assert_equal(false, @stack.is_empty)
    assert_equal('a', @stack.first.item)
  end

  def test_pop
    @stack.push('b')
    assert_equal('b', @stack.pop)
  end

end