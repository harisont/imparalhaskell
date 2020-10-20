-- liste
length' :: [a] -> Int
length' [] = 0
length' (_:xs) = 1 + length' xs

head' :: [a] -> a
head' [] = error "empty list"
head' (x:xs) = x

tail' :: [a] -> [a]
tail' [] = error "empty list"
tail' (x:xs) = xs

last' :: [a] -> a
last' [] = error "empty list"
last' xs = head' (reverse' xs) 

init' :: [a] -> [a]
init' [] = error "empty list"
init' [x] = []
init' (x:xs) = x:init' xs

take' :: Int -> [a] -> [a]
take' 0 _ = []
take' _ [] = []
take' n (x:xs) = x:take' (n - 1) xs 

drop' :: Int -> [a] -> [a]
drop' 0 xs = xs
drop' _ [] = []
drop' n (x:xs) = drop' (n - 1) xs

null' :: [a] -> Bool
null' [] = True
null' _ = False

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

-- elem' :: a -> [a] -> Bool 
-- (quella qui sopra é una buona idea, ma  non funziona. La prossima volta vi
-- spiego perché e qual é la soluzione. Per ora usiamo Int così a caso)
elem' :: Int -> [Int] -> Bool 
elem' _ [] = False
elem' y (x:xs) = x == y || elem' y xs

replicate' :: Int -> a -> [a]
replicate' n x = [x | _ <- [1..n]]

{- Negli esempi seguenti, utilizzo Int solo perché non ho ancora spiegato 
   come generalizzare in questi casi. Andrebbero ugualmente Float, Double, 
   Integer etc. Nella prossima lezione miglioreremo queste type signatures -}

maximum' :: [Int] -> Int
maximum' [] = error "empty list"
maximum' [x] = x
maximum' (x:xs) = max x (maximum' xs)

minimum' :: [Int] -> Int
mininum' [] = error "empty list"
minimum' [x] = x
minimum' (x:xs) = min x (minimum' xs)

sum' :: [Int] -> Int
sum' [] = 0
sum' (x:xs) = x + sum' xs

product' :: [Int] -> Int
product' [] = 1
product' (x:xs) = x * product' xs

{- Da qui in poi, tutto normale -}

-- tuple
fst' :: (a, b) -> a
fst' (a,_) = a

snd' :: (a, b) -> b
snd' (_,b) = b

-- liste & tuple
zip' :: [a] -> [b] -> [(a,b)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x,y):zip' xs ys

unzip' :: [(a,b)] -> ([a],[b])
unzip' [] = ([],[])
unzip' ((a,b):xs) = (a:fst' (unzip' xs),b:snd' (unzip' xs)) 