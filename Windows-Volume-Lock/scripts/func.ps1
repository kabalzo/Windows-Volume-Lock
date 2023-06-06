###########################################################################################
#Set the system volume to whatever is specified in run.ps1 (0-100 are valid)
###########################################################################################
function Set-DefaultVolume
{
	Set-AudioDevice -PlaybackVolume $defaultVolume
	Set-AudioDevice -PlaybackMute $false
}
###########################################################################################
#Format the current volume so it will be displayed currectly with Write-Output
#Get-AudioDevice -PlaybackVolume actually returns a string with '%' at the end, 
#even though the documentation says it is supposed to be a float and this is my workaround
###########################################################################################
function Format-CurrentVolume
{
	param ([string]$CurrentVolume)
	#Doube-digit volume
	if ($CurrentVolume.Length -eq 3)
	{
		#Write-Host "Format envoked on doube-digit volume"
		return $CurrentVolume.SubString(0,2)
	}
	#Single-digit volume
	elseif ($CurrentVolume.Length -eq 2)
	{
		#Write-Host "Format envoked on single-digit volume"
		return $CurrentVolume.SubString(0,1)
	}
	#Something else. This returns for 100 and 7. Not important enough to fix right now for 100, not sure about the 7.
	else 
	{
		return "Invalid volume."
	}
}
###########################################################################################
#Here I go killing again
###########################################################################################
function Stop-VolumeLockProcess
{
	Param ([int]$VolumeLockProcess)
	Write-Output $VolumeLockProcess
	timeout /t 3
	taskkill /fi "IMAGENAME eq powershell.exe" /fi "PID eq $VolumeLockProcess" /f
	timeout /t 3
	$wshell = New-Object -ComObject Wscript.Shell
	$wshell.Popup("Script run.ps1 with PID $VolumeLockProcess ended successfully.",0,"Volume Lock Termination Successful",0)
}
###########################################################################################
#Trying to use this method for turning off the volume control instead of hard-coding it in run.ps1
###########################################################################################
function Stop-VolumeLockGlobal
{
	#There is exactly one volume lock process
	$processToEnd = Get-VolumeLockProcesses
	$processToEnd
	if ($processToEnd.Length -eq 1)
	{
		Write-Host "Debug: Should only be one running process"
		Stop-VolumeLockProcess -VolumeLockProcess $processToEnd
	}
	#There are no running volume-lock processes.
	elseif ($null -eq $processToEnd)
	{
		Write-Host "There are no running volume-lock processes."
		$wshell = New-Object -ComObject Wscript.Shell
		$wshell.Popup("There are no running volume-lock processes.",0,"Volume Lock Termination Failed",0)
		return $null
	}
	#There is more than one volume lock process, ideally I figure out how to prevent another one from getting started in the first place
	else
	{
		$len = $processToEnd.Length
		for (($i=0), ($i -eq $len), $i++)
		{
			Write-Host $i
			Write-Host "Debug: Multiple running processes"
			#End-VolumeLockProcess -VolumeLockProcess $processToEnd[i]
		}
	}
}
###########################################################################################
#Get all the run.ps1 processes by their PIDs in an array
###########################################################################################
function Get-VolumeLockProcesses
{
	$runningProcesses = (gcim Win32_Process -f "Name='powershell.exe' AND CommandLine LIKE '%run.ps1%'").ProcessID
	return $runningProcesses
}

