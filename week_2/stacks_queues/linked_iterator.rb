require 'test/unit'
require_relative 'linked_queue'
require_relative 'node'

class LinkedIterator

  attr_reader :current

  def initialize linked_list
    @l = linked_list
    @current = @l.first
  end

  def has_next
    @current.next != nil
  end

  def has_previous
    @current.previous != nil
  end

  def next
    begin
      item = @current.item
      @current = @current.next
      return item
    rescue Exception => e
      e.message
    end
  end

  def remove
    begin
      item = @current.item
      @current.previous.set_next(@current.next)
      @current.next.set_previous(@current.previous)
      @current = @current.next
      return item
    rescue Exception => e
      e.message
    end
  end

end

class LinkedIteratorTest < Test::Unit::TestCase
  
  def setup
    @queue = LinkedQueue.new
    @queue.enqueue('a')
    @queue.enqueue('b')
    @queue.enqueue('c')
    @iterator = LinkedIterator.new(@queue)
  end

  def test_first
    assert_equal('a', @iterator.current.item)
  end

  def test_next
    @iterator.next
    assert_equal('b', @iterator.current.item)
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

  def test_remove
    @iterator.next
    deleted = @iterator.current
    @iterator.remove
    current = @iterator.current
    assert_equal(deleted.previous.item, current.previous.item)
    assert_equal(deleted.next.item, current.item)

  end
end