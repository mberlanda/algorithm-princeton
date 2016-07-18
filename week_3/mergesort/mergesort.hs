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

-- second implementation inspired to https://rosettacode.org/wiki/Sorting_algorithms/Merge_sort#Haskell
mergePairs :: (Ord a) => [[a]] -> [[a]]
mergePairs (x:y:zs) = merge x y : mergePairs zs
mergePairs xs = xs

mergeAll :: (Ord a) => [[a]] -> [a]
mergeAll [x] = x
mergeAll xs = mergeAll(mergePairs xs)

mergeSortBottomUp :: (Ord a) => [a] -> [a]
mergeSortBottomUp lst = mergeAll (map (\x -> [x]) lst)