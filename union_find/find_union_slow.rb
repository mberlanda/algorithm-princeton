class FindUnion

 def initialize n
   @array = [0..n]
 end

 def  find x, y
   @array[x] == y
 end

 def union x, y
   @array.each do |i|
     i = y if i == x
   end
 end

end