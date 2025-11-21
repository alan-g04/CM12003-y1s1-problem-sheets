#CM12003 #Y1S1 #haskell 

[[1-Haskell_Basics.pdf|Problem Sheet]]

Exercise 1:

a)

undefined :: GHC.Stack.Types.HasCallStack => a
error :: GHC.Stack.Types.HasCallStack => [Char] -> a

b)
```
square :: Int -> Int
square x = x * x
```

c)
```
pythagoras :: Int -> Int -> Int -> Bool
pythagoras a b c = square a + square b == square c
```

Exercise 2:

a)
```
factorial :: Integer -> Integer
factorial x
    | x <= 1    = 1
    | otherwise = x * factorial (x-1)
```

b) Everything works if it is in one line, or if some guards are on one line and others are indented below. If the guards below are not indented then a parse error is thrown upon reloading.

c)
```
power :: Int -> Int -> Int
power x y
    | y == 0 = 1
    | otherwise = x * power x (y-1)
```

d)
```
power :: Int -> Int -> Int
power x y
    | y == 0 = 1
    | y < 0 = error "y must be positive"
    | otherwise = x * power x (y-1)
```

e)
```
power :: Int -> Int -> Int
power x y
    | y == 0 = 1
    | y < 0 = error "y must be positive"
    | even y = (square x) ^ (div 2 y)
    | otherwise = (square x) ^ (div 2 (y-1))
```

f)
```
euclid :: Int -> Int -> Int
euclid x y
	| x == y = x
	| euclid (min x y) (abs (x-y))
```

Exercise 3:

a)

First implementation (no error handling for negative y)
```
pow :: Int -> Int -> Int
pow x y = if y == 0 then 1 else x * power * (y-1)
```

Second implementation (includes error handling for negative y)
```
pow :: Int -> Int -> Int
pow x y = if y == 0 then 1 else x * power * (y-1)
```

Third implementation (exponentiation by squaring)
```
pow :: Int -> Int -> Int
pow x y =
	if y == 0
		then 1
	else if y < 0
		then error "y must be positive"
	else if even y 
		then (square x) ^ (div y 2)
	else
		(square x) ^ (div (y-1) 2)
```

Exercise 4:

a)
```
collatz :: Int -> Int
collatz x
    | x == 1 = 1
    | even x = collatz (div x 2)
    | odd x = collatz (3 * x + 1)
```

b)
```
collatzCount :: Int -> Int -> Int
collatzCount x c
    | x == 1 = c
    | even x = collatzCount (div x 2) (c + 1)
    | odd x = collatzCount (3 * x + 1) (c + 1)
```

c)
```
collatzMax :: Int -> (Int,Int) -> (Int,Int)
collatzMax x (m,s)
    | x == 1 = (m,s)
    | max s (collatzCount x 0) == collatzCount x 0 = collatzMax (x-1) (x, collatzCount x 0)
    | otherwise = collatzMax (x-1) (m, s)
```

Exercise 5:

a)

```
ackermann :: Int -> Int -> Int
ackermann m n
    | m == 0 = n + 1
    | n == 0 = ackermann (m-1) 1
    | otherwise = ackermann (m - 1) (ackermann m (n - 1))
```