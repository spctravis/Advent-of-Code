$Elfcounter = 1
$Elfs = $null
$Elfs = @()
$Score = 0
$raw = foreach($line in Get-Content C:\Users\travis.anderson\Documents\AdventOfCode\Day2P1.txt) {
    $opponent = $line.split(" ")[0]
    $you = $line.split(" ")[1]
    switch ($line)
    {
    #A Rock
    #B Paper
    #C Scissers
    #X lose
    #Y draw
    #Z win
    "A Y"{$Score = $Score + 3 + 1}
    "B Y"{$Score = $Score + 3 + 2}
    "C Y"{$Score = $Score + 3 + 3}
    "A X"{$Score = $Score + 0 + 3}
    "B X"{$Score = $Score + 0 + 1}
    "C X"{$Score = $Score + 0 + 2}
    "A Z"{$Score = $Score + 6 + 2}
    "B Z"{$Score = $Score + 6 + 3}
    "C Z"{$Score = $Score + 6 + 1}
    } # End Switch
} # End Foreach
$Score
