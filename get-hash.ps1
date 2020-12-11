#below is needed to have pop up GUI to select file.
Add-Type -AssemblyName System.Windows.Forms
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ InitialDirectory = [Environment]::GetFolderPath('desktop') } 
$null = $FileBrowser.ShowDialog()

#selected location of file to be checked. Select-object needed to remove excess info for just file path.
$Filelocation = $FileBrowser | Select-Object -ExpandProperty Filename

#Algorithim to hash with.
$selectalg = read-host -prompt "`nEnter Hash Algorithim to check. Examples; MD5, SHA1, SHA256,SHA384, SHA512:`n"

#asks user for hash to compare against the selected file's hash.
$hashshould = read-host -Prompt "`nEnter Hash to compare against. Leave blank and hit enter to only check the files hash`n"

#Check hash with selected parameters. Filter and show only the hash. Assign to Hashis variable.
$hashis = Get-Filehash -path $Filelocation -algorithm $selectalg | Select-Object -ExpandProperty Hash 

    #show on screen what was the source file, the compared hash and the file checked.
    Write-Host -NoNewline "`nfile checked: " $Filelocation
    Write-host -NoNewline "`n`nFile Hash   : " $hashis
    Write-host -NoNewline "`ncompare Hash: " $hashshould

#-ceq required for case sensitive checking. output on screen whether hash's matched or not. Checks if hash of source file and given hash are the same.
IF ($hashis -ceq $hashshould)
    { 
        Write-host -ForegroundColor Green "`n`nHash's Match"
    }
    Else
    {
        write-host -ForegroundColor Red "`n`nHash's dont match"
    }