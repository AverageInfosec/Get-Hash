# Get-Hash
Get the hash of a file and compare against known hash using powershell.

This script can compare the hash of a file against a given hash, or simply result the hash of the file. 

It is entirely built in to windows 7\8\10, no installation of files is necessary. Can run in non-admin powershell provided the system allows script execution already. Tested with a low as powershell version 5.

To run script, open powershell, select appropriate executionpolicy level, run .\get-hash.ps1

When script runs, youll be presented with a popup to browse and select a file to check the hash of.

Next youll need to select what algorithim to use, SHA256 for example.

Then if you have a hash to compare against the given file, youll enter it. If you do not have any hash to compare against, just leave blank and hit enter.

Script will check the hash of the given file with the given algorithim and show the results below. The script will show in green if the given hash and file hash match, it will show in red if they do not match, or if no hash was given to compare against. The script will detect difference in capitilzation. 


Thanks to Adam Bertram's article for the GUI file selection code. https://4sysops.com/archives/how-to-create-an-open-file-folder-dialog-box-with-powershell/
