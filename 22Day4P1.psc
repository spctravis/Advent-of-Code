$counter = 0
$groups = @()
foreach($line in Get-Content C:\Users\travis.anderson\Documents\AdventOfCode\Day4P1.txt) {

$first = [int]($line.Split(",")).split("-")[0]..[int]($line.Split(",")).split("-")[1]
$second = [int]($line.Split(",")).split("-")[2]..[int]($line.Split(",")).split("-")[3]
$sideIndicator = (Compare-Object -ReferenceObject $first -DifferenceObject $second -IncludeEqual).SideIndicator | Sort-Object -Unique
if(!(($sideIndicator -contains "<=") -and ($sideIndicator -contains "=>")) ){
    $counter++
    $sideIndicator
    }
    
} # End Foreach
$counter
