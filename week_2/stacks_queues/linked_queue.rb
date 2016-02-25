require 'test/unit'
require_relative 'node'

class LinkedQueue

  attr_reader :first, :last

  def initialize
    @first = nil
    @last = nil
  end

  def is_empty
    @first == nil
  end

  def enqueue item
    oldlast = @last
    @last = Node.new
    @last.set_item(item)
    @last.set_next(nil)
    if is_empty
      @first = @last
    else
      oldlast.set_next(@last)
    end
  end

  def dequeue
    begin
      item = @first.item
      @first = @first.next
      @last = nil if is_empty
      return item
    rescue Exception => e
      e.message
    end
  end
end

class LinkedQueueTest < Test::Unit::TestCase
  
  def setup
    @queue = LinkedQueue.new
  end

  def test_is_empty
    assert_equal(true, @queue.is_empty)
  end

  def test_empty_dequeue
    assert_raise(@queue.dequeue)
  end

  def test_enqueue
    @queue.enqueue('a')
    assert_equal(false, @queue.is_empty)
    assert_equal('a', @queue.first.item)
  end

  def test_dequeue
    @queue.enqueue('b')
    assert_equal('b', @queue.dequeue)
  end

end