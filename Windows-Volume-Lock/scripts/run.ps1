#################################################################
#Drew Kabala - The University of Iowa - 2023
#Credit to AudioDeviceCmdlets without which this script would not be possible
#https://github.com/frgnca/AudioDeviceCmdlets/blob/master/README.md
#Check the readme for detailed setup instructions
#Quickstart - Change $defaultVolume to whatever you want between 0-100
################################################################
$host.ui.RawUI.WindowTitle = 'Volume Lock'
###########################
[string]$defaultVolume = 60
###########################
. "$PSScriptRoot.\func.ps1"
$junk = $null
$processes = Get-VolumeLockProcesses
if ($processes -eq $PID -and $processes.Length -eq 1)
{
	#For debugging
	Write-Host "PID:"$PID
	#From AudioDeviceCmdlets
	Set-AudioDevice -PlaybackVolume $DefaultVolume
	Write-Host "Default volume set to:"$defaultVolume
	while ($true) 
	{	
		#Write-Host "Begin main loop"
		$currentVolume = Get-AudioDevice -PlaybackVolume
		#From .\func.ps1, this is not perfect for instance 7% returns invalid, haven't parsed that out yet
		$currentVolume = Format-CurrentVolume -CurrentVolume $currentVolume
		#Volume change detected, reset volume to default level
		if ( $currentVolume -ne $DefaultVolume)
		{	
			#From .\func.ps1
			Set-DefaultVolume
			Write-Host "Volume is:" $currentVolume"%. Setting volume to" $defaultVolume"%"
		}
		#Unmute the device if it's muted
		elseif (Get-AudioDevice -PlaybackMute)
		{
			#From AudioDeviceCmdlets
			Set-AudioDevice -PlaybackMute $false
			Write-Host "Mute detected. Unmuting."
		}
		else
		{
			#Assuming that no change has been detected, change this to whatever you want (seconds)
			#$junk variable is for two reasons: (1) if you leave out the '>' then it writes to the screen which I don't want (2) outputting to null creates a file,
			#this way the timeout is essentially silent. If you have this running in an open window you only see when the volume is changed.
			timeout /t 5 > $junk
		}	
	}
}
else
{
	Write-Host "PID:"$PID
	Write-Host "Volume lock is running in another process. Cannot open another instance."
	Write-Host "The script will now exit."
	exit
}
