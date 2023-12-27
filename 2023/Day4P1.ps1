$data = Get-Content .\2023\Day4.txt

# foreach through each line, split on |, and add to array. 
# create a newpsobject with the object called ticket with the value being $cardnumber
# add members to the object called winningnumbers and ticketnumbers and winners

    # $cardnumbers should contain the numbers on the left side of the ":"

    # $winningnumbers should contain the groups of numbers separated by spaces, saved as numbers

    # the right side of the pipe needs to split into an array numbers saved as $ticketnumbers

    # $winners should be the $winningnumbers values found in $ticketnumbers
$tickets = @()
$mastertotal = 0
foreach($line in $data){
    $total = 0
    $winningnumbers = ($line.Split("|")[0].Split(":")[1].trim().Split(" ") | foreach {if([int]$_ -ne 0){ [int]$_}})
    $ticketnumbers = ($line.Split("|")[1].trim().Split(" ")| foreach {if([int]$_ -ne 0){ [int]$_}})
    $winners = foreach($ticketnumber in $ticketnumbers){
        if($ticketnumber -in $winningnumbers){
            if($total -eq 0){
                $total = 1
                continue
                }
            else{
                $total = $total * 2
                }
            }
        }

    #create a new pscustomobject named ticket with the value being the card number
    $tickets += [pscustomobject]@{
        cardnumbers = ($line.Split("|")[0].Split(":")[0]) -replace '\D', '' 
        winningnumbers = $winningnumbers
        ticketnumbers = $ticketnumbers
        winners = $winners
        total = $total
        }
  
    }
foreach($ticket in $tickets){
    $mastertotal += $ticket.total
    }
$mastertotal