import Text.XHtml (multiple)
import Data.Text.Lazy.Read (double)

------------------------- Exercise 1

-- a

-- doubles :: [Int] -> [Int]
-- doubles [] = []
-- doubles (x:xs) = 2*x : doubles xs

-- doubles :: [Int] -> [Int]
-- doubles = map (*2)

-- doubles :: [Int] -> [Int]
-- doubles xs = [2 * x | x <- xs]

-- b

-- multiplesOfThree :: [Int] -> [Int]
-- multiplesOfThree [] = []
-- multiplesOfThree (x:xs)
--     | divByThree x = x : multiplesOfThree xs
--     | otherwise = multiplesOfThree xs
--     where
--         divByThree x = x `mod` 3 == 0

-- multiplesOfThree :: [Int] -> [Int]
-- multiplesOfThree = filter divByThree
--     where
--         divByThree x = x `mod` 3 == 0

-- multiplesOfThree :: [Int] -> [Int]
-- multiplesOfThree xs = [x | x <- xs, x `mod` 3 == 0]

-- c

-- doubleMultiplesOfThree :: [Int] -> [Int]
-- doubleMultiplesOfThree [] = []
-- doubleMultiplesOfThree (x:xs)
--     | divByThree x = 2*x : doubleMultiplesOfThree xs
--     | otherwise = doubleMultiplesOfThree xs
--     where
--         divByThree x = x `mod` 3 == 0

-- doubleMultiplesOfThree :: [Int] -> [Int]
-- doubleMultiplesOfThree xs = map (2*) (filter divByThree xs)
--     where
--         divByThree x = x `mod` 3 == 0

-- doubleMultiplesOfThree :: [Int] -> [Int]
-- doubleMultiplesOfThree xs = [2 * x | x <- xs, x `mod` 3 == 0]

------------------------- Exercise 2

-- b

-- shorts :: [String] -> [String]
-- shorts = filter short
--     where
--         short x = length x < 4

-- shorts :: [String] -> [String]
-- shorts xs = [x | x <- xs, length x < 4]

-- c

-- incrementPositives :: [Int] -> [Int]
-- incrementPositives = map (\x -> if x > 0 then x + 1 else x)

-- incrementPositives :: [Int] -> [Int]
-- incrementPositives xs = [if x > 0 then x + 1 else x | x <- xs]

-- d

-- difference :: (Eq a) => [a] -> [a] -> [a]
-- difference xs ys = filter (`notElem` ys) xs

-- difference :: (Eq a) => [a] -> [a] -> [a]
-- difference xs ys = [x | x <- xs, x `notElem` ys]

-- e

-- oddLengthSums :: [[Int]] -> [Int]
-- oddLengthSums xs = map sum (filter (odd . length) xs)

-- oddLengthSums :: [[Int]] -> [Int]
-- oddLengthSums xs = [ sum x | x <- xs , (odd . length) x]

------------------------- Exercise 3

-- a

numbered :: [a] -> [(Int,a)]
numbered = zip [1..]

-- b

-- everyother :: [a] -> [a]
-- everyother = map snd . filter (odd . fst) . numbered

-- everyother :: [a] -> [a]
-- everyother xs = [x | (y, x) <- numbered xs, odd y]

-- c

-- same :: Eq a => [a] -> [a] -> [Int]
-- same s1 s2 = map fst $ filter (\(_, y, z) -> y == z) (zip3 [1..] s1 s2)
-- to be fixed

-- same :: Eq a => [a] -> [a] -> [Int]
-- same s1 s2 = map fst filtTrip
--     where
--         triples = zip3 [1..] s1 s2
--         p (_, y, z) = y == z
--         filtTrip = filter p triples
-- to be fixed

-- same :: Eq a => [a] -> [a] -> [Int]
-- same s1 s2 = [x | (x, y, z) <- zip3 [1..] s1 s2, y == z]


------------------------- Exercise 5

combinations :: [a] -> [b] -> [(a,b)]
combinations = undefined

selfcombinations :: [a] -> [(a,a)]
selfcombinations = undefined

pyts :: Int -> [(Int,Int,Int)]
pyts = undefined


------------------------- Exercise 6

choice :: [[a]] -> [[a]]
choice = undefined

splits :: [a] -> [([a],[a])]
splits = undefined

permutations :: [a] -> [[a]]
permutations = undefined