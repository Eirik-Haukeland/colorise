module Lib
    ( someFunc
    , getColorValue
    ) where

someFunc :: IO ()
someFunc = putStrLn "someFunc"

getColorValue :: String -> [([Char], [Char])] -> [Char]
getColorValue key colorList
    | null colorList = error "key not found"
    | fst (head colorList) == key = snd (head colorList)
    | otherwise = getColorValue key (tail colorList)
