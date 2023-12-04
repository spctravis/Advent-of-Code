$data = Get-Content "C:\Users\Anderson\Documents\Travis\Advent of code\2023\Day2.txt"
$total = 0
$power = 0
$data | foreach {
    $line = $_.split(":")
    $GameID = [int]::Parse(($line[0].Split(" "))[1])
    $Red = 0
    $Green = 0
    $Blue = 0
    $line[1].Split(";") | foreach {
        $game = $_.split(",")
        $game | foreach { 
            $grab = $_.split(" ")
            Switch($grab[2])
                {
                "green"{if([int]::Parse($grab[1]) -gt $Green){$Green = [int]::Parse($grab[1])}}
                "red"{if([int]::Parse($grab[1]) -gt $red){$red = [int]::Parse($grab[1])}}
                "blue"{if([int]::Parse($grab[1]) -gt $Blue){$Blue = [int]::Parse($grab[1])}}
                } # end switch

            } # end game foreach
        
        } # end line foreach
        $power = $power + ($Red * $Blue * $Green)
    } # end data foreach
$power