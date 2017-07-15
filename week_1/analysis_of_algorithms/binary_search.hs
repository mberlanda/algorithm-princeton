import Test.HUnit

binary_search :: (Ord a) => a -> [a] -> Maybe Int
binary_search _ [] = Nothing
binary_search n arr
  | elem == n = Just mid
  | elem < n  = (+mid) . (+1) <$> binary_search n hi
  | otherwise = binary_search n lo
  where mid = length arr `quot` 2
        (lo, elem:hi) = splitAt mid arr

test_list = [1, 5, 7, 11, 12, 18, 19, 20, 33, 42, 77, 93, 101]
test1 = TestCase (assertEqual "binary_search for 12" (Just 4) (binary_search 12 test_list))
test2 = TestCase (assertEqual "binary_search for 101" (Just 12) (binary_search 101 test_list))
test3 = TestCase (assertEqual "binary_search for 121" (Nothing) (binary_search 121 test_list))
tests = TestList [TestLabel "test1" test1, TestLabel "test2" test2, TestLabel "test3" test3]

main = do
  runTestTT tests
