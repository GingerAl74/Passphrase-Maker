$len = read-host "How many words do you want to use in your passphrase? Select 1-10"
$list = read-host "What is the full path and filename of your wordlist?"
$meas = Get-Content $list | Measure-Object -Word | Select-Object -ExpandProperty Words
$counter = 0
do
{
$counter ++
$pass = Get-Content $list
$num = Get-Random -Maximum $meas
$word1 = $pass[$num]
out-file -Filepath fullpass.txt -encoding ascii -append -force -InputObject "$word1"
}
while ($counter -lt $len)

Get-Content fullpass.txt| foreach {
 $out = $out + $_
}
$out| Out-File fullpass2.txt

$full = Get-Content fullpass2.txt

write-host "your passphrase is $full"
Remove-Item fullpass.txt
Remove-Item fullpass2.txt

read-host "Press ENTER when your password has been recorded"
