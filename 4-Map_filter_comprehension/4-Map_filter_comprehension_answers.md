#CM12003 #Y1S1 #haskell 

[[4-Map_filter_comprehension.pdf|Problem Sheet]]

Exercise 1:

a)
```haskell
doubles :: [Int] -> [Int]
doubles [] = []
doubles (x:xs) = 2*x : doubles xs
  
doubles :: [Int] -> [Int]
doubles = map (*2)
  
doubles :: [Int] -> [Int]
doubles xs = [2 * x | x <- xs]
```

b)
```haskell
multiplesOfThree :: [Int] -> [Int]
multiplesOfThree [] = []
multiplesOfThree (x:xs)
	| divByThree x = x : multiplesOfThree xs
	| otherwise = multiplesOfThree xs
	where
		divByThree x = x `mod` 3 == 0

multiplesOfThree :: [Int] -> [Int]
multiplesOfThree = filter divByThree
	where
		divByThree x = x `mod` 3 == 0

multiplesOfThree :: [Int] -> [Int]
multiplesOfThree xs = [x | x <- xs, x `mod` 3 == 0]
```

c)
```haskell
doubleMultiplesOfThree :: [Int] -> [Int]
doubleMultiplesOfThree [] = []
doubleMultiplesOfThree (x:xs)
	| divByThree x = 2*x : doubleMultiplesOfThree xs
	| otherwise = doubleMultiplesOfThree xs
	where
divByThree x = x `mod` 3 == 0
  
doubleMultiplesOfThree :: [Int] -> [Int]
doubleMultiplesOfThree xs = map (2*) (filter divByThree xs)
	where
divByThree x = x `mod` 3 == 0

doubleMultiplesOfThree :: [Int] -> [Int]
doubleMultiplesOfThree xs = [2 * x | x <- xs, x `mod` 3 == 0]
```

Exercise 2:

b)

```haskell
shorts :: [String] -> [String]
shorts = filter short
	where
	short x = length x < 4

shorts :: [String] -> [String]
shorts xs = [x | x <- xs, length x < 4]
```

c)

```haskell
incrementPositives :: [Int] -> [Int]
incrementPositives = map (\x -> if x > 0 then x + 1 else x)

incrementPositives :: [Int] -> [Int]
incrementPositives xs = [if x > 0 then x + 1 else x | x <- xs]
```

d)

```haskell
difference :: (Eq a) => [a] -> [a] -> [a]
difference xs ys = filter (`notElem` ys) xs

difference :: (Eq a) => [a] -> [a] -> [a]
difference xs ys = [x | x <- xs, x `notElem` ys]
```

e)

```haskell
oddLengthSums :: [[Int]] -> [Int]
oddLengthSums xs = map sum (filter (odd . length) xs)

oddLengthSums :: [[Int]] -> [Int]
oddLengthSums xs = [ sum x | x <- xs , (odd . length) x]
```

Exercise 3:

a)

```haskell
numbered :: [a] -> [(Int,a)]
numbered = zip [1..]
```

b)

```haskell
everyother :: [a] -> [a]
everyother = map snd . filter (odd . fst) . numbered

everyother :: [a] -> [a]
everyother xs = [x | (y, x) <- numbered xs, odd y]
```

c)

email lecturer