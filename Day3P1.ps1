$data = Get-Content "C:\Users\Anderson\Documents\Travis\Advent of code\2023\Day3.txt"
$linecouter = 0
$lineend = ($data | Measure-Object).Count
$symbols = "+", "/","-","*","$","%","#"
$points = @()

for($linecounter = 0; $linecounter -lt $data.Count; $linecounter++)
    {
    $line = $data[$linecounter].ToCharArray()
    $points += [pscustomobject]@{Line=$linecounter; point=(0..($line.Count-1)) | where {$line[$_] -match "\*|`#|`\$|`&|`%|`@|`\+|`-|`\\|`="}}
    
     } # end data foreach
   