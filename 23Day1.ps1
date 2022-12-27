$Elfcounter = 1
$Elfs = $null
$Elfs = @()
$calories = 0
$raw = foreach($line in Get-Content C:\Users\travis.anderson\Documents\AdventOfCode\Day1P1.txt) {
    if (-not ([string]::IsNullOrEmpty($line))){
    $calories = $calories + [int]$line
    }
    else{
    
    $Elfs +=  [PSCustomObject]@{ElfNumber=$Elfcounter;Calories=$calories}
    #$Elfs| Add-Member -NotePropertyName "Elfs"  -NotePropertyValue $Elf
    $Elfcounter++
    $calories = 0
    }
}

($Elfs | Sort-Object Calories | select -last 3).Calories | Measure-Object -Sum
