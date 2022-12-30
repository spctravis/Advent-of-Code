$data = Get-Content C:\Users\travis.anderson\Documents\AdventOfCode\Day7P1TEST.txt
$data | foreach {$var = $_;
    switch -Regex ($var){
    "\$ cd /" {"hi"}
    "\$ cd .." {"changedir"}
    '\$ cd [a-z]' {"dir"}
    '[0-9]* [.]*' {"size"}
    }

} #end foreach
