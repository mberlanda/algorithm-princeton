class WeightedQuickUnionUF

attr_reader :array

  def initialize n
    @n = n-1
    @array = (0..@n).to_a
    @size = {}
    @array.each do |k|
      @size[k] = 0
    end
  end

  def connected x, y
    root(x) == root(y)
  end

  def union x, y
    i, j = root(x), root(y)
    return if i == j
    if @size[i] < @size[j]
      @array[i] = j
      @size[j] += @size[i]
    else
      @array[j] = i
      @size[i] += @size[j]
    end
  end

  private

  def root (i)
    while i != @array[i] do
      @array[i] = @array[@array[i]]
      i = @array[i]
    end
    return i
  end

end