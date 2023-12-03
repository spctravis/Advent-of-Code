$data = Get-Content C:\Users\travis.anderson\Documents\AdventOfCode\Day7P1.txt
$DirData = [System.Collections.ArrayList]@()
$tracker = @()
$dirlocation = @()
$dirlocation += "root"
$dirList = @{}
$counter = 0
$data | foreach {$var = $_; $counter++
    $tracker += $var
    switch -Regex ($var){
    "\$ cd /" {$dirFullPath = "root"}
    "\$ cd .." {$dirFullPath = $dirlocation[$(for ($i = 0; $i -le $dirlocation.Count; $i++){if($dirlocation[$i] -eq $dirFullPath){$i}})-1]}
    '\$ cd [a-z]' { $dir = $_.split(" ")[2]
                    $dirFullPath = $dirFullPath + "." + $dir
                    $dirList.$dirFullPath += @{$dirFullPath = "name"; size = 0}
                   if($dirlocation -notcontains $dirFullPath){$DirData += [PSCustomObject]@{name = $dirFullPath; size = 0} 
                    }
                    $dirlocation += $dirFullPath
                    }
    '[0-9]* [.]*' {try{$size = [int]($_.split(" ")[0])}catch{}; try{$dirList.$dirFullPath.size = $dirList.$dirFullPath.size + $size}catch{};
    $rec = $DirData | where {$_.name -eq $dirFullPath}
    $rec.size = $size
     }
    }

} #end foreach
$DirData | foreach { $_ | where size -le 100000 | select size, name -First 10
         

}
