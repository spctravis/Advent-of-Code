#$data = Get-Content "C:\Users\travis.anderson\Github\Advent-of-Code\2023\Day3.txt"
$data = Get-Content "C:\Users\Anderson\Documents\Travis\Advent of code\2023\Day3.txt"
$points = @()
$countoflines = $data.Count
$total = 0
$num = 0
for($linecounter = 0; $linecounter -lt $countoflines; $linecounter++)
    {
    $line = $data[$linecounter].ToCharArray()
    $points += [pscustomobject]@{Line=$linecounter; point=(0..($line.Count-1)) | where {$line[$_] -match "\*|`#|`\$|`&|`%|`@|`\+|`-|`=|`/"}};$Matches
    } # end data foreach
foreach($subpoints in $points){
    foreach($point in $subpoints.point){
        if($point -ne $null){
            #above line
            if($point.line -ne 0){
                $aboveline = $data[$subpoints.line - 1].ToCharArray()
                if($aboveline[($point-1)..($point+1)] -match '\d'){
                    $aboveline[($point-3)..($point+3)] | foreach { if($_ -match '\d'){$num = "$num" + "$_"}}
                    $total += [int]$num
                    $num = 0
                }
            }#end if
            #same line
            #left
            $sameline = $data[$subpoints.line].ToCharArray()
            if($sameline[($point-1)] -match '\d'){
                $sameline[($point-3)..($point-1)] | foreach { if($_ -match '\d'){$num = "$num" + "$_"}}
                $total += [int]$num
                $num = 0
            }
            #same line
            #right
            if($sameline[($point+1)] -match '\d'){
                $sameline[($point+1)..($point+3)] | foreach { if($_ -match '\d'){$num = "$num" + "$_"}}
                $total += [int]$num
                $num = 0
            }
            #below line
            if($point.line -ne $countoflines){
                $belowline = $data[$subpoints.line + 1].ToCharArray()
                if($belowline[($point-1)..($point+1)] -match '\d'){
                    $belowline[($point-3)..($point+3)] | foreach { if($_ -match '\d'){$num = "$num" + "$_"}}
                    $total += [int]$num
                    $num = 0
                }#end if
            } #end if
        } #end if null
    }#end foreach
}#end foreach
$total

   