# Windows-Volume-Lock
A collection of Powershell files that lock system volume so the user cannot change it.
Work in progress.

1. Add the directory "Windows-Volume-Lock" to "C:\Program Files"
2. Run ".\shortcuts\Setup-Volume-Lock.lnk". Wait for it finish successfully.
2. Change the $defaultVolume variable in ".\scripts\run.ps1" to anything between 0-100.
4. Run ".\shortcuts\Start-Volume-Lock.lnk" to run the volume limiter.
5. Run ".\shortcuts\End-Volume-Lock.lnk" to end the volume limiter.
6. Bask in your power as your users attempt in futility to change their system volume.
