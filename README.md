# Passphrase-Maker
Remember this is just a script not a module. You dont need to upload this to the universal powershell modules 
Make sure you have your execution policy to remote-signed because this is not a signed script
run newpass.ps1
newpass.ps1 promts you for an integer 1-10 and a filepath and name to a wordlist
It will generate a file and delete it, but the new passphrase will be created and printed on the terminal and will stay until you press enter.
# update 4/16
now works on powershell 3.0 and 4.0 (not just 5.0)
Do not use in ISE it will work, but it will continue to write to variable creating paragrahps of text for a variable.
newpassmod.psm1 is the module version of this script for if you want to import it as a module instead of runnig the script everytime
# update 4/22
Added a capitalization flag, and uppercase flag, and a lowercase flag
