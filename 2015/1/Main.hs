import Control.Exception (assert)

parseDirectionsP1 :: [Char] -> Int
parseDirectionsP1 input =
    sum $ map (\c -> if c == '(' then 1 else -1) input

parseDirectionsP2 :: Int -> Int -> [Char] -> Int
parseDirectionsP2 floor pos (c : input) =
    let parsed = if c == '(' then 1 else -1
        floor' = floor + parsed
     in if floor' == -1 then pos else parseDirectionsP2 floor' (pos + 1) input

main :: IO ()
main = do
    let sampleInput = ["(())", "()()", "(((", "(()(()(", "))(((((", "())", "))(", ")))", ")())())"]
        expected = [0, 0, 3, 3, 3, -1, -1, -3, -3]
        got = map parseDirectionsP1 sampleInput
    putStrLn $ assert (got == expected) "Part 1 (sample): pass"

    let sampleInput = [")", "()())"]
        expected = [1, 5]
        got = map (parseDirectionsP2 0 1) sampleInput
    putStrLn $ assert (got == expected) "Part 2 (sample): pass"

    contents <- readFile "input.txt"
    let part1 = parseDirectionsP1 contents
        part2 = parseDirectionsP2 0 1 contents

    putStrLn $ "Part 1: " ++ show part1
    putStrLn $ "Part 2: " ++ show part2
