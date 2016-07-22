import Data.List(partition)

-- first implementation
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort(x:xs) = smSorted ++ [x] ++ bgSorted
  where smSorted  = quicksort [y | y <- xs, y < x]
        bgSorted = quicksort [y | y <- xs, y >= x]

-- second implementation using Data.List(partion)
qsort :: (Ord a) => [a] -> [a]
qsort [] = []
qsort (x:xs) = let (ys, zs) = partition (< x) xs
               in qsort ys ++ x : qsort zs