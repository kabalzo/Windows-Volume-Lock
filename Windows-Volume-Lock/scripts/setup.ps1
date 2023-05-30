try 
{ 	Write-Host "Attempting to install AudioDeviceCmdlets Module"
	Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
	Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
	Install-Module -Name AudioDeviceCmdlets -Force
	Write-Host "Setup successful."
	timeout /t -1
}
catch
{
	Write-Host "Setup failed."
	timeout /t -1
}