import Data.Maybe

data Persona = Persona {
    nome :: String,
    eta :: Int,
    sesso :: Sesso } 
    deriving Show 

data Sesso = Maschio | Femmina
    deriving Show

c = Persona {
    sesso = Femmina,
    nome = "Caterina",
    eta = 15 }

-- d = Persona {
--     nome = "Davide",
--     eta = 20
-- }

-- nome :: Persona -> String
-- nome = undefined

--data AnimaleDomestico = AnimaleDomestico {
--    nome :: String,
--    specie :: String
--}

data Forse a = Proprio a | Niente
    deriving Show

--data Forse' a = Pieno a | Vuoto

data Persona' = Persona' {
    nome' :: String,
    eta' :: Int,
    sesso' :: Forse Sesso } 
    deriving Show 

d = Persona' {
    nome' = "Davide",
    eta' = 20,
    sesso' = Niente --Proprio Maschio
}

data Persona'' = Persona'' {
    nome'' :: String,
    eta'' :: Int,
    sesso'' :: Maybe Sesso } 
    deriving Show

d' = Persona'' {
    nome'' = "Davide",
    eta'' = 20,
    sesso'' = Nothing -- Just Maschio
}

-- type newtype

type Nome = String
type Cognome = String
type Eta = Int

data Persona''' = Persona''' {
    nome''' :: Nome,
    cognome :: Cognome,
    eta''' :: Eta,
    sesso''' :: Maybe Sesso } 
    deriving Show

newtype Gruppo a = Gruppo [a]