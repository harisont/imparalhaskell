-- liste
length' [] = 0
length' (_:xs) = 1 + length' xs

head' [] = error "empty list"
head' (x:xs) = x

tail' [] = error "empty list"
tail' (x:xs) = xs

last' [] = error "empty list"
last' xs = head' (reverse' xs) 

init' [] = error "empty list"
init' [x] = []
init' (x:xs) = x:init' xs

take' 0 _ = []
take' _ [] = []
take' n (x:xs) = x:take' (n - 1) xs 

drop' 0 xs = xs
drop' _ [] = []
drop' n (x:xs) = drop' (n - 1) xs

null' [] = True
null' _ = False

reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

elem' _ [] = False
elem' y (x:xs) = x == y || elem' y xs

replicate' n x = [x | _ <- [1..n]]

maximum' [] = error "empty list"
maximum' [x] = x
maximum' (x:xs) = max x (maximum' xs)

mininum' [] = error "empty list"
maximum' [x] = x
minimum' (x:xs) = min x (minimum' xs)

sum' [] = 0
sum' (x:xs) = x + sum' xs

product' [] = 1
product' (x:xs) = x * product' xs

-- tuple
fst' (a,_) = a
snd' (_,b) = b

-- liste & tuple
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x,y):zip' xs ys

unzip' [] = ([],[])
unzip' ((a,b):xs) = (a:fst' (unzip' xs),b:snd' (unzip' xs)) 