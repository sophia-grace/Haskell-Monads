{- Author: Sophia Trump
   File: Do.hs

   Practice exercises with do-notation.
-}

module Main where

import Text.Read

main :: IO ()
main = do
  putStrLn "Hello, world!"
  name <- prompt "What is your name?"
  putStrLn $ "Hello, " ++ name
  what_they_wrote <- prompt2 "Enter two lines of text:"
  putStrLn what_they_wrote

prompt :: String -> IO String
prompt query = do
  putStrLn query
  answer <- getLine
  pure answer

prompt2 :: String -> IO String
prompt2 query = do
  putStrLn query
  answer1 <- getLine
  answer2 <- getLine
  let concat = answer1 ++ answer2
  pure concat
