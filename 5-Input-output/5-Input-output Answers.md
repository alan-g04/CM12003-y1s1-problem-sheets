#CM12003 #Y1S1 #haskell 

[[5-Input-output.pdf|Problem Sheet]]

Exercise 1:

```haskell
repeatMe :: IO ()
repeatMe = do
	x <- getLine
	putStr "You just told me: "
	putStrLn x
```

Exercise 2:

a)
```haskell
lizzy :: IO ()
lizzy = do
	putStrLn welcome
```

b)
```haskell
lizzyLoop :: IO ()
lizzyLoop = do
	str <- getLine
	putStrLn (response str)
```

c)
```haskell
lizzyLoop :: IO ()
lizzyLoop = do
	str <- getLine
	r <- randomIO :: IO Int
	putStrLn (randomresponse str r)
```

d)
```haskell
lizzy :: IO ()
	lizzy = do
	putStrLn welcome
	lizzyLoop

lizzyLoop :: IO ()
lizzyLoop = do
	str <- getLine
	r <- randomIO :: IO Int
	putStrLn (randomresponse str r)
	lizzyLoop
```

Exercise 3:
```haskell
lizzyLoop :: IO ()
lizzyLoop = do
	str <- getLine
	if str == "Exit" then do
		putStrLn exit
	else do
		r <- randomIO :: IO Int
		putStrLn (randomresponse str r)
		lizzyLoop
```
