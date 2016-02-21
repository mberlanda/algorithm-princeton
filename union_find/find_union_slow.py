class FindUnion:
    
    def __init__(self, n):
      self.n = n
      self.array = list(range(n))

    def find(x, y):
      return self.array[x] == y

    def union(x, y):
      for i in range(self.n):
        if self.array[i] == x:
          self.array[i] = y