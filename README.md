# Windows-Volume-Lock
A collection of Powershell files that lock system volume so the user cannot change it.

Getting started:
	1. Add the directory "Windows-Volume-Lock" to "C:\Program Files".
	2. Run ".\shortcuts\Setup-Volume-Lock.lnk". Wait for it finish successfully.
	2. Change the $defaultVolume variable in ".\scripts\run.ps1" to anything between 0-100.
	4. Run ".\shortcuts\Start-Volume-Lock.lnk" to run the volume limiter.
	5. Run ".\shortcuts\End-Volume-Lock.lnk" to end the volume limiter.
	6. Bask in your power as your users attempt in futility to change their system volume.

To run this automatically as a scheduled task, I've done the following:
	1. Create a basic task in Task Scheduler and name is something like "Volume Limiter".
	2. Set the trigger to "log on of specific user", or whatver you like. System start or any user could work too.
	3. Set the action to Start a Program, set the program/script to "powershell.exe", set arguments to '-WindowStyle Hidden -ExecutionPolicy Bypass -File "run.ps1"',
		set start in to "C:\Program Files\Windows-Volume-Lock\scripts\".
	4. Test by selecting the task.

