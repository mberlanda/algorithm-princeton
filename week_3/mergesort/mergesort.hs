module MergeSort where

-- first implementation inspired to https://rosettacode.org/wiki/Sorting_algorithms/Merge_sort#Haskell
merge :: (Ord a) => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge xs@(x:xt) ys@(y:yt) | x <= y    = x : merge xt ys
                          | otherwise = y : merge xs yt

split :: [a] -> ([a], [a])
split [] = ([],[])
split [x] = ([x],[])
split (x:y:zs) = let (xs, ys) = split zs in (x:xs, y:ys)

mergeSort :: (Ord a) => [a] -> [a]
mergeSort [] = []
mergeSort [x] = [x]
mergeSort xs = merge (mergeSort lhalf) (mergeSort rhalf)
               where (lhalf, rhalf) = split xs