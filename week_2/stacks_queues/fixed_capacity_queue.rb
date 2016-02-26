require 'test/unit'
require_relative 'node'

class FixedCapacityQueue

  attr_reader :q, :head, :tail, :n

  def initialize capacity
    new_queue
    @head = 0
    @tail = 0
  end

  def new_queue
    @q = Array.new
    @n = 0
  end

  def is_empty
    @n == 0
  end

  def enqueue item
    
    if @n == @capacity
      puts 'Queue is already full'
      new_queue
    end
  
    @q[@tail] = item
    @n += 1
    @tail += 1
  end

  def dequeue
    begin
      item = @q[@head]
      @q[@head] = nil
      @head += 1
      return item
    rescue Exception => e
      e.message
    end
  end
end

class FixedCapacityQueueTest < Test::Unit::TestCase
  
  def setup
    @queue = FixedCapacityQueue.new(5)
  end

  def test_is_empty
    assert_equal(true, @queue.is_empty)
  end


  def test_enqueue
    @queue.enqueue('a')
    assert_equal(false, @queue.is_empty)
    assert_equal('a', @queue.q[0])
    assert_equal(0, @queue.head)
    assert_equal(1, @queue.tail)
  end

  def test_dequeue
    @queue.enqueue('a')
    @queue.enqueue('b')
    assert_equal(2, @queue.tail - @queue.head)
    @queue.dequeue
    assert_equal(1, @queue.tail - @queue.head)
  end

end