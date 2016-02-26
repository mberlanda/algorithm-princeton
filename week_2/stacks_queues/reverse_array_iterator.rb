require 'test/unit'
require_relative 'fixed_capacity_queue'

class ReverseArrayIterator

  attr_reader :a, :i

  def initialize fixed_capacity_array
    @a = fixed_capacity_array
    @n = @a.size - 1
    @i = @n
  end

  def has_next
    @i > 0
  end

  def has_previous
    @i < @n
  end

  def next
    begin
      item = @a[@i].item
      raise if !has_next
      @i -= 1
      return item
    rescue Exception => e
      e.message
    end
  end

  def previous
    begin
      item = @a[@i+1].item
      raise if !has_previous
      @i += 1
      return item
    rescue Exception => e
      e.message
    end
    
  end

end

class FixedCapacityIteratorTest < Test::Unit::TestCase
  
  def setup
    @queue = FixedCapacityQueue.new(7)
    n1 = Node.new
    n2 = Node.new
    n3 = Node.new
    
    n1.set_item('a')
    n1.set_next(n2)
    n2.set_previous(n1)
    n2.set_item('b')
    n2.set_next(n3)
    n3.set_previous(n2)
    n3.set_item('c')
    
    @queue.enqueue(n1)
    @queue.enqueue(n2)
    @queue.enqueue(n3)

    @iterator = ReverseArrayIterator.new(@queue.q)
  end

  def test_first
    assert_equal('c', @iterator.a[@iterator.i].item)
  end

  def test_next
    @iterator.next
    assert_equal('b', @iterator.a[@iterator.i].item)
  end

  def test_has_next
    @iterator.next
    assert_equal( true, @iterator.has_next)
  end

  def test_raise_next
    @iterator.next
    @iterator.next
    assert_raise(@iterator.next)
  end

  def test_has_previous
    assert_equal( false, @iterator.has_previous)
    @iterator.next
    assert_equal( true, @iterator.has_previous)
  end

  def test_raise_previous
    assert_raise(@iterator.previous)
  end

end