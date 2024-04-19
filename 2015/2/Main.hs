import Control.Exception (assert)
import Data.List (sort)
import Data.List.Split (splitOn)

calcP1 :: [Char] -> Int
calcP1 input =
    let [l, w, h] = map (\x -> read x :: Int) $ splitOn "x" input
     in 2 * l * w + 2 * w * h + 2 * h * l + minimum [l * w, w * h, h * l]

calcP2 :: [Char] -> Int
calcP2 input =
    let [l, w, h] = map (\x -> read x :: Int) $ splitOn "x" input
        [s1, s2] = take 2 $ sort [l, w, h]
     in (s1 + s2) * 2 + l * w * h

main :: IO ()
main = do
    let sampleInput = ["2x3x4", "1x1x10"]
        expected = [58, 43]
        got = map calcP1 sampleInput
    putStrLn $ assert (got == expected) "Part 1 (sample): pass"

    let expected = [34, 14]
        got = map calcP2 sampleInput
    putStrLn $ assert (got == expected) "Part 2 (sample): pass"

    contents <- readFile "input.txt"
    let input = lines contents
        part1 = sum $ map calcP1 input
        part2 = sum $ map calcP2 input

    putStrLn $ "Part 1: " ++ show part1
    putStrLn $ "Part 2: " ++ show part2
