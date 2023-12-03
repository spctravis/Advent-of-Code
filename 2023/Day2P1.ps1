$data = Get-Content "C:\Users\Anderson\Documents\Travis\Advent of code\2023\Day2.txt"
$total = 0
$limitRed = 12
$limitgreen = 13
$limitblue = 14
$data | foreach {
    $line = $_.split(":")
    $GameID = [int]::Parse(($line[0].Split(" "))[1])
    $line[1].Split(";") | foreach {
        $GamelimitRed = $limitRed
        $GamelimitGreen = $limitgreen
        $GamelimitBlue = $limitblue
        $good = $true
        $game = $_.split(",")
        $game | foreach { 
            $grab = $_.split(" ")
            Switch($grab[2])
                {
                "green"{$GamelimitGreen = $GamelimitGreen - [int]::Parse($grab[1])}
                "red"{$GamelimitRed = $GamelimitRed - [int]::Parse($grab[1])}
                "blue"{$GamelimitBlue = $GamelimitBlue - [int]::Parse($grab[1])}
                } # end switch
            if($GamelimitGreen -lt 0 -or $GamelimitRed -lt 0 -or $GamelimitBlue -lt 0) {
            $good = $false
                } # end if
            } # end game foreach
        if($good){$total = $total + $GameID}
        } # end line foreach
    } # end data foreach
$total