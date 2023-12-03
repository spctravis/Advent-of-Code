$data = Get-Content "C:\Users\Anderson\Documents\Travis\Advent of code\2023\Day1.txt"
$total = 0
$data | foreach {
    $line = $_
    $test = $line
    $line = $line -replace "twone", "21"
    $line = $line -replace "eightwo", "82"
    $line = $line -replace "eighthree", "83"
    $line = $line -replace "sevenine", "79"
    $line = $line -replace "nineight", "89"
    $line = $line -replace "threeight", "38"
    $line = $line -replace "fiveight", "58"
    $line = $line -replace "oneight", "18"
    $line = $line -replace "one", "1"
    $line = $line -replace "two", "2"
    $line = $line -replace "three", "3"
    $line = $line -replace "four", "4"
    $line = $line -replace "five", "5"
    $line = $line -replace "six", "6"
    $line = $line -replace "seven", "7"
    $line = $line -replace "eight", "8"
    $line = $line -replace "nine", "9"
    $tempnumbers = @()
    $line.ToCharArray() | foreach{$var = $_;if($var -match "^[\d\.]+$"){$tempnumbers += $var}}
    $total += [int]::Parse($tempnumbers[0] + $tempnumbers[-1])
    }
$total
