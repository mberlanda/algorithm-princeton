class Node

  attr_reader :item, :next

  def initialize
  end

  def set_item string
    @item = string
  end

  def set_next obj
    @next = obj
  end

end