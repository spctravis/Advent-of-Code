$Alpha=@()
$PointsUpper=27
$PointsLower=1
97..122 |foreach-object{$Alpha+=[PSCustomObject]@{Alpha=[char]$_;Points=$PointsLower}; $PointsLower++}
65..90|foreach-object{$Alpha+=[PSCustomObject]@{Alpha=[char]$_;Points=$PointsUpper}; $PointsUpper++}

$sum = 0
$counter = 0
$groups = @()
foreach($line in Get-Content C:\Users\travis.anderson\Documents\AdventOfCode\Day3P1.txt) {
 switch ($counter) {
    0 {$first = $line.ToCharArray();$counter++ }
    1 {$second = ((Compare-Object -ReferenceObject $first -DifferenceObject $line.ToCharArray() -IncludeEqual -ExcludeDifferent).InputObject); $counter++}
    2 {
 $item = ((Compare-Object -ReferenceObject $second -DifferenceObject $line.ToCharArray() -IncludeEqual -ExcludeDifferent).InputObject)[0]

 $alpha | foreach {$var = $_; if ($var.alpha -ceq $item) {$sum += $var.Points; $var.Points}
        $groups = @()
        $counter = 0
        }
    }}

} # End Foreach
$sum
