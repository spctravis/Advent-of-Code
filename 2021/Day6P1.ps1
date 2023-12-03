$counter = 0
$raw = Get-Content C:\Users\travis.anderson\Documents\AdventOfCode\Day6P1.txt
$data = $raw.ToCharArray()
$data | foreach { $var = $data[$counter..$($counter+3)] ; 
    if (($var | Sort-Object -Unique | Measure-Object ).count -le 3){
    $counter++
    }
    if (($var | Sort-Object -Unique | Measure-Object ).count -eq 4){$counter + 4; break}
    }
