class Neighbour

  def initialize n, grid
    @n = n
    @grid
  end

  def north i, j
    @grid[i-1][j] if i > 0
  end

  def east i, j
    @grid[i][j+1] if j < @n
  end

  def south i, j
    @grid[i+1][j] if i < @n
  end

  def west i, j
    @grid[i][j-1] if j > 0
  end
  
end