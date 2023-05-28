try 
{ 	Write-Host "Attempting to install AudioDeviceCmdlets Module"
	Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
	Install-Module -Name AudioDeviceCmdlets -Force
	Write-Host "Setup successful."
	timeout /t -1
	#$wshell = New-Object -ComObject Wscript.Shell
	#$wshell.Popup("Volume Lock Setup Successful.",0,"Success!",0)
}
catch
{
	Write-Host "Setup failed."
	timeout /t -1
	#$wshell = New-Object -ComObject Wscript.Shell
	#$wshell.Popup("Volume Lock Setup Failed.",0,"Failure!",0)
}