class Selection

  def initialize array
    @a = array
  end

  def sort
    n = @a.length
    i = 0
    while i < n do |i|
      min = i
      j = i+1
      while j < n do |j|
        min = j if less(a[j], a[min])
      end
      exch(i, min)
      i += 1
    end
  end

  def less v, w
    return (v < w)
  end

  def exch i, j
    swap = @a[i]
    @a[i] = @a[j]
    @a[j] = swap
  end

end