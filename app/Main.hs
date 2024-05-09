module Main (main) where

import Lib
import Colors
import System.Environment

defaultTheme :: String
defaultTheme = "light"

-- main :: IO ()
main = do
    args <- getArgs
    let ((colorName:res), themeName) = parse (args, defaultTheme)
    putStrLn (getColorValue colorName (getTheme themeName))

getTheme themeName
    | themeName == "light" = light
    | themeName == "dark" = dark
    | otherwise = light

parse :: ([String], String) -> ([String], String)
parse ((val:res), themeName)
    | val == "-l" = parse (res, "light")
    | val == "--light" = parse (res, "light")
    | val == "-d" = parse (res, "dark")
    | val == "--dark" = parse (res, "dark")
    | otherwise = ([val], themeName)
