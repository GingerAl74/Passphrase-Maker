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
            [string]$Logfile = 'c:\errorlog.txt'
           
     )

    Begin
    {
        If($errorlog){
            Write-Verbose 'Error logging turned on'
        } Else {
            Write-Verbose 'Error logging turned off'
        }crea
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
    write-host "your passphrase is $full"
    Remove-Item fullpass.txt
    Remove-Item fullpass2.txt
    read-host "Press ENTER when your password has been recorded"
    }
}