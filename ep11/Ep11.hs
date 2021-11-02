{- Precisazioni sui record -}

-- Ripartiamo da dei tipi definiti la scorsa volta:

data Persona = Persona {
    nome :: String,
    eta :: Int,
    sesso :: Sesso } 
    deriving Show 

data Sesso = Maschio | Femmina
    deriving Show

-- 1) i nomi dei "campi" di un record type sono funzioni top-level.
-- Di conseguenza, non possiamo definire una funzione chiamata "nome", ad es.
--   nome :: Persona -> String
--   nome = undefined
-- né un nuovo record con un campo "nome", ad es.
--   data AnimaleDomestico = AnimaleDomestico {
--    nome :: String,
--    specie :: String
--   }

-- 2) se NON inizializziamo un campo, come qui sotto

d = Persona {
    nome = "Davide",
    eta = 20 }

-- all'importare il file (o al compilarlo) otterremo un warning:

-- ➜  ep11 git:(master) ✗ ghci
-- GHCi, version 9.0.1: https://www.haskell.org/ghc/  :? for help
-- ghci> :l Ep11.hs 
-- [1 of 1] Compiling Main             ( Ep11.hs, interpreted )
-- 
-- Ep11.hs:21:5: warning: [-Wmissing-fields]
--     • Fields of ‘Persona’ not initialised: sesso
--     • In the expression: Persona {nome = "Davide", eta = 20}
--       In an equation for ‘d’: d = Persona {nome = "Davide", eta = 20}
--    |
-- 21 | d = Persona {
--    |     ^^^^^^^^^...
-- Ok, one module loaded.

-- ma se chiamiamo sesso su d causeremo un errore a runtime:

-- ghci> sesso d
-- *** Exception: Ep11.hs:(21,5)-(23,14): Missing field in record construction 
-- sesso



{- Tipi parametrici  -}

-- I tipi parametrici sono tipi i cui costruttori (dei tipi! A sinistra dell'
-- =!) contengono uno o più parametri.
-- In questo caso, possono aiutarci a risolvere il problema del lasciare il
-- campo sesso non specificato (si noti che in Haskell non c'é il riferimento
-- a NULL). Per esempio, possiamo definire:

data Forse a = Proprio a | Niente -- equivalente a Data.Maybe
    deriving Show

-- oppure:

data Forse' a = Pieno a | Vuoto
    deriving Show

-- e ridefinire Persona come segue:

data Persona' = Persona' {
    nome' :: String,
    eta' :: Int,
    sesso' :: Forse Sesso } -- importando Data.Maybe: sesso' :: Maybe Sesso
    deriving Show 

d' = Persona' {
    nome' = "Davide",
    eta' = 20,
    sesso' = Niente -- oppure Proprio Maschio, oppure Proprio Femmina
                    -- in Data.Maybe, Niente = Nothing e Proprio = Just
}

-- Altre informazioni su usi e costumi legati a Data.Maybe:
-- https://hackage.haskell.org/package/base-4.15.0.0/docs/Data-Maybe.html

-- Documentazione di altri tipi parametrici "illustri" (oltre alle liste):
-- - https://hackage.haskell.org/package/base-4.15.0.0/docs/Data-Either.html
-- - https://hackage.haskell.org/package/containers-0.6.5.1/docs/Data-Map.html

{- Le parole chiave Type e Newtype -}

-- type serve a definire type synonym, ossia sinonimi di tipi preesistenti
-- (anche definiti da noi nello stesso modulo). E' spesso utile per 
-- distinguere stringhe (o altro) con usi diversi

type Nome = String
type Cognome = String
type Eta = Int

data Persona''' = Persona''' {
    nome''' :: Nome,
    cognome :: Cognome,
    eta''' :: Eta,
    sesso''' :: Maybe Sesso } 
    deriving Show

-- newtype serve invece per definire nuovi tipi con un solo costruttore e un
-- solo parametro, per es.

newtype Gruppo a = Gruppo [a]

-- questo può sembrare inutile, ma ha senso se vogliamo definire comportamenti
-- particolari per, in questo caso, un certo tipo di liste (ad es. per 
-- istanziarne uno Show personalizzato).

-- Chiaramente, allo stesso scopo potremmo anche scrivere:

data Gruppo a = Gruppo [a]

-- Il comportamento sarà lo stesso dal p.d.v. della logica ma il vostro linter
-- (sempre che ne abbiate installato uno) vi suggerirà di utilizzare type per
-- questioni di ottimizzazione. 
-- Dalla Haskell Wiki (articolo completo disponibile su 
-- wiki.haskell.org/Newtype) in traduzione, per chi sia interessato e abbia
-- chiaro il concetto di type checker:
--   La restrizione a un solo costruttore con un solo campo assicura che il 
--   nuovo tipo e il tipo del suo campo siano in corrispondenza diretta, o in
--   termini matematici che essi [il tipo e il suo campo] siano isomorfi.
--   Ciò significa che, dopo il type checking a tempo di compilazione, a tempo
--   di esecuzione i due tipi possono essere trattati sostanzialmente nello
--   stesso modo [...]. Quindi, se l'obiettivo è dichiarare diverse istanze di
--   una type class per un certo tipo, lo si può "avvolgere" [wrap] in un
--   newtype in modo che sia considerato come un tipo distinto dal 
--   type-checker, ma come identico al suo campo a runtime. 
