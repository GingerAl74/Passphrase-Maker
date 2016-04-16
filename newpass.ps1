$len = read-host "How many words do you want to use in your passphrase? Select 1-10"
$list = read-host "What is the full path and filename of your wordlist?"
$counter = 0
do
{
$counter ++
$pass = Get-Content $list
$num = Get-Random -Maximum 101
$word1 = $pass[$num]
out-file -filepath fullpass.txt -encoding ascii -append -force -InputObject "$word1"  
}
while ($counter -lt $len)
$full = Get-Content fullpass.txt

write-host
write-host
Write-Host "Your new passwords is $full"
Remove-Item fullpass.txt
write-host
write-host
Read-Host "Press ENTER when your password has been recorded"
