$counter = 0
$raw = Get-Content C:\Users\travis.anderson\Documents\AdventOfCode\Day6P1.txt
$data = $raw.ToCharArray()
$data | foreach { $var = $data[$counter..$($counter+13)] ; 
    if (($var | Sort-Object -Unique | Measure-Object ).count -le 13){
    $counter++
    }
    if (($var | Sort-Object -Unique | Measure-Object ).count -eq 14){$counter + 14; break}
    }
