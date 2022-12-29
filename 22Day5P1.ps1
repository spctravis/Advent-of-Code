#not WORKING AT ALL 
$counter = 0
Remove-Variable -Name column* -ErrorAction SilentlyContinue
1..3 | foreach {New-Variable -name column$_ -value (New-Object -TypeName 'System.Collections.ArrayList') } 

$inputtext = Get-Content C:\Users\travis.anderson\Documents\AdventOfCode\Day5P1TestInput.txt
$Lenght = $inputtext.Length
$line = 1
$inputtext = 1..$Lenght | ForEach-Object {$inputtext[-$line]; $line++}
$inputtext = $inputtext.replace("    ", " ") 
$inputtext | foreach {
    $counter++; $_.split(" ") | foreach { $var = $_;$var;
        switch ($counter) {
        1 {$column1.add($var.trim("[]"))}
        2 {$column2.add($var.trim("[]"))}        
        3 {$column3.add($var.trim("[]"))}
        }}}

foreach($line in Get-Content C:\Users\travis.anderson\Documents\AdventOfCode\Day5P1Test.txt) {
    $movenum = $line.Split(" ")[1]
    $from = $line.Split(" ")[3]
    $to = $line.Split(" ")[5]
    switch ($from) {
    1 { $column1.Insert(

    
} # End Foreach
$counter
