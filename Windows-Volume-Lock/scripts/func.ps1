function Set-DefaultVolume
{
	Set-AudioDevice -PlaybackVolume $defaultVolume
	Set-AudioDevice -PlaybackMute $false
}
function Format-CurrentVolume
{
	param ([string]$CurrentVolume)
	if ($CurrentVolume.Length -eq 3)
	{
		#Write-Host "Format envoked on doube-digit volume"
		return $CurrentVolume.SubString(0,2)
	}
	elseif ($CurrentVolume.Length -eq 2)
	{
		#Write-Host "Format envoked on single-digit volume"
		return $CurrentVolume.SubString(0,1)
	}
	else 
	{
		return "Invalid volume."
	}
}
function End-VolumeLock
{
	$processToEnd = (gcim Win32_Process -f "Name='powershell.exe' AND CommandLine LIKE '%run.ps1%'").ProcessID
	return $processToEnd
}

