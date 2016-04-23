<#
.Synopsis
   Make a new password
.DESCRIPTION
   Creates a new randomly generated password based off of a provided wordlist
.EXAMPLE
    Create-Passphrase
    Basic command. Will Prompt you for additional input
.EXAMPLE
   Create-Passphrase -Length 4 -List C:\Users\XXXX\Desktop\Words.txt
   This command will run the function and make a passphrase of 4 words from the provided wordlist.

.EXAMPLE
   Create-Passphrase -Length 4 -List C:\Users\XXXX\Desktop\Words.txt -Caps
   This command will run the function and make a passphrase of 4 words from the provided wordlist and will uppercase the first character as long as it is not a number or special character.
#>
function Create-Passphrase
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
         # Length of passphrase in words
          [int]$Length,
        [Parameter(Mandatory=$true)]    
            # Location of your wordlist
            [string]$List,
        [Parameter(Mandatory=$false)]
            [switch]$ErrorLog,
            [string]$Logfile = 'c:\errorlog.txt',
        [Parameter(Mandatory=$false)]
            [Switch]$Upper,
        [Parameter(Mandatory=$false)]
            [Switch]$Lower,
        [Parameter(Mandatory=$false)]
            [Switch]$Caps   
     )

    Begin
    {
        If($errorlog){
            Write-Verbose 'Error logging turned on'
        } Else {
            Write-Verbose 'Error logging turned off'
        }
      $meas = Get-Content $list | Measure-Object -Word | Select-Object -ExpandProperty Words
      $counter = 0  
    }
    Process
    {
        do
        {
            $counter ++
            $pass = Get-Content $list
            $num = Get-Random -Maximum $meas
            $word1 = $pass[$num]
            out-file -Filepath fullpass.txt -encoding ascii -append -force -InputObject "$word1"
        }
        while ($counter -lt $length)

        Get-Content fullpass.txt| foreach {
            $out = $out + $_
        }
        $out| Out-File fullpass2.txt

        $full = Get-Content fullpass2.txt
        }
    End
    {
    If($Caps){
        $e = Get-Content fullpass2.txt
        $f = $e.substring(0,1).ToUpper()
        $g = $e.substring(1).ToLower()
        write-host "your passphrase is $f$g"
        Remove-Item fullpass.txt
        Remove-Item fullpass2.txt
        read-host "Press ENTER when your password has been recorded"
    }elseif($Upper){
        $e = Get-Content fullpass2.txt
        $f = $e.substring(0).ToUpper()
        write-host "your passphrase is $f"
        Remove-Item fullpass.txt
        Remove-Item fullpass2.txt
        read-host "Press ENTER when your password has been recorded"
    }elseif($Lower){
        $e = Get-Content fullpass2.txt
        $g = $e.substring(0).ToLower()
        write-host "your passphrase is $g"
        Remove-Item fullpass.txt
        Remove-Item fullpass2.txt
        read-host "Press ENTER when your password has been recorded"
    }else{
        write-host "your passphrase is $full"
        Remove-Item fullpass.txt
        Remove-Item fullpass2.txt
        read-host "Press ENTER when your password has been recorded"
    }
}
}
