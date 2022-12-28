#not WORKING AT ALL 
$counter = 0
$Xarray = 1..3
$Yarray = 1..6
[System.Collections.ArrayList]$array = @()
$array = $Yarray | foreach {$Y = $_; $Xarray| ForEach { "X" + [string]$_, "Y" + $Y}}
$inputtext = Get-Content C:\Users\travis.anderson\Documents\AdventOfCode\Day5P1TestInput.txt
$Lenght = $inputtext.Length
$line = 1
$inputtext = 1..$Lenght | ForEach-Object {$inputtext[-$line]; $line++}
$inputtext = $inputtext.replace("    ", " ") 
$inputtext.split(" ") | foreach { $array[$counter] = ($array[$counter], $_.trim("[]")); $counter++}

foreach($line in Get-Content C:\Users\travis.anderson\Documents\AdventOfCode\Day5P1Test.txt) {
    $movenum = $line.Split(" ")[1]
    $from = $line.Split(" ")[3]
    $to = $line.Split(" ")[5]
    
} # End Foreach
$counter
