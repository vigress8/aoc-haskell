import Control.Exception (assert)

main :: IO ()
main = do
    let sampleInput = ""
        expected = ""
        got = ""
    putStrLn $ assert (got == expected) "Part 1 (sample): pass"

    let sampleInput = ""
        expected = ""
        got = ""
    putStrLn $ assert (got == expected) "Part 2 (sample): pass"

    contents <- readFile "input.txt"
    let part1 = ""
        part2 = ""

    putStrLn $ "Part 1: " ++ show part1
    putStrLn $ "Part 2: " ++ show part2
