. "$PSScriptRoot.\func.ps1"
$toKill = End-VolumeLock
if ($toKill -eq $null)
{
	Write-Host "There are no running volume-lock processes."
	$wshell = New-Object -ComObject Wscript.Shell
	$wshell.Popup("There are no running volume-lock processes.",0,"Volume Lock Termination Failed",0)
	exit
}
else
{
	taskkill /fi "IMAGENAME eq powershell.exe" /fi "PID eq $toKill" /f
	timeout /t 3
	$wshell = New-Object -ComObject Wscript.Shell
	$wshell.Popup("Script run.ps1 with PID $toKill ended successfully.",0,"Volume Lock Termination Successful",0)
}


