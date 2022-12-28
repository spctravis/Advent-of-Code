$Elfcounter = 1
$Elfs = $null
$Elfs = @()
$Score = 0
$raw = foreach($line in Get-Content C:\Users\travis.anderson\Documents\AdventOfCode\Day2P1.txt) {
    $opponent = $line.split(" ")[0]
    $you = $line.split(" ")[1]
    switch ($line)
    {
    #A X are Rock
    #B Y are Paper
    #C Z are Scissers
    "A Y"{$Score = $Score + 6}
    "B Y"{$Score = $Score + 3}
    "C Y"{$Score = $Score + 0}
    "A X"{$Score = $Score + 3}
    "B X"{$Score = $Score + 0}
    "C X"{$Score = $Score + 6}
    "A Z"{$Score = $Score + 0}
    "B Z"{$Score = $Score + 6}
    "C Z"{$Score = $Score + 3}
    } # End Switch
    Switch ($you)
    {
    "X" {$Score = $Score + 1}
    "Y" {$Score = $Score + 2}
    "Z" {$Score = $Score + 3}
    } #end Switch
} # End Foreach
$Score
