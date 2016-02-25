class Node

  attr_reader :item, :next, :previous

  def initialize
    @previous = nil
    @next = nil
  end

  def set_item string
    @item = string
  end

  def set_previous obj
    @previous = obj
  end

  def set_next obj
    @next = obj
  end
end