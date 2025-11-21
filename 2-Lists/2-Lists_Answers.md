#CM12003 #Y1S1 #haskell 

[[2-Lists.pdf|Problem Sheet]]

Exercise 1:

a)

```
times :: [Int] -> Int
times [] = []
times (x:xs) = x * times xs
```

b)

```
range :: Int -> Int -> [Int]
range m n
	| m > n = []
	| otherwise = m : range (m+1) n
```

c)

```
factorial :: Int -> Int
factorial x
	| x == 0 || x == 1 = 1
	| otherwise = times (range 2 x)
```


Exercise 2:

a)

```
count :: [a] -> Int
count [] = 0
count (_:xs) = 1 + count xs
```

b)

```
append :: [a] -> [a] -> [a]
append [] ys = ys
append (x:xs) ys = x : append xs ys
```

c)

```
concatenate :: [[a]] -> [a]
concatenate [] = []
concatenate (x:xs) = x ++ concatenate xs
```

Exercise 3:

a)

```
member :: Int -> [Int] -> Bool
member _ [] = False
member n (x:xs) = n == x || member n xs
```

b)

```
remove :: Int -> [Int] -> [Int]
remove _ [] = []
remove n (x:xs)
	| x == n = remove n xs
	| otherwise = x : remove n xs
```

c)

```
at :: [a] -> Int -> a
at [] _ = error "index too large"
at (_:_) n | n < 0 = error "negative index"
at (x:xs) 0 = x
at (x:xs) n = at xs (n-1)
```

Exercise 4:

a)

```
final :: [a] -> a
final [] = error "empty list"
final [x] = x                     -- or final (x:[]) = x
final (x:xs) = final xs
```

b)

```
ordered :: [Int] -> Bool
ordered [] = error "empty list"
ordered [x] = True
ordered (x:y:zs) = x < y && ordered (y:zs)
```

c)

```
pair :: [a] -> [b] -> [(a,b)]
pair [] [] = []
pair [x] [] = []
pair [] [a] = []
pair (x:ys) (a:bs) = (x,a) : pair ys bs
```

d)

```
find :: Int -> [(Int,String)] -> String
find _ [] = ""
find n ((x,y):xys)
	| n == x = y
	| otherwise = find n xys
```

Exercise 5:

b)

```
times :: Num a => [a] -> a

member :: Eq a => a -> a -> Bool

remove :: Eq a => a -> [a] -> [a]

ordered :: Ord a => [a] -> Bool

find :: Eq a => a -> [(a, String)] -> String
```
