-- first implementation
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort(x:xs) = smSorted ++ [x] ++ bgSorted
  where smSorted  = quicksort [y | y <- xs, y < x]
        bgSorted = quicksort [y | y <- xs, y >= x]