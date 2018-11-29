{- Author: Sophia Trump
   File: Guess.hs

   Practice with IO. A guessing game where the user guesses a number randomly
   selected by the program.
-}

module Main where

import System.Random
import Text.Read

main :: IO ()
main = do
  number_to_guess <- randomNumber
  loop number_to_guess

loop :: Integer -> IO ()
loop matchMe = do
  guess <- promptGuess "Guess a number between 1 and 10:"
  case readMaybe guess of
    Nothing          -> putStrLn $ "\nQuitting... \nThe answer was: " ++ show matchMe
    Just n           -> checkCorrect matchMe n

checkCorrect :: Integer -> Integer -> IO ()
checkCorrect n1 n2
  | n1 == n2 = putStrLn "\nCorrect!"
  | otherwise = do
      putStrLn "\nIncorrect. Please try again."
      loop n1

promptGuess :: String -> IO String
promptGuess query = do
  putStrLn query
  answer <- getLine
  pure answer

randomNumber :: IO Integer
randomNumber = randomRIO (1, 10)
