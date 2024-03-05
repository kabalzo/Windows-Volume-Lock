<h1>Windows-Volume-Lock</h1>
<h3>A collection of Powershell files that lock system volume so the user cannot change it</h3>

<h3>Getting started</h3>
<ol>
	<li>Add the directory "Windows-Volume-Lock" to "C:\Program Files"</li>
	<li>Run ".\shortcuts\Setup-Volume-Lock.lnk". Wait for it finish successfully</li>
	<li>Change the $defaultVolume variable in ".\scripts\run.ps1" to anything between 0-100</li>
	<li>Run ".\shortcuts\Start-Volume-Lock.lnk" to run the volume limiter</li>
	<li>Run ".\shortcuts\End-Volume-Lock.lnk" to end the volume limiter</li>
	<li>Bask in your power as your users attempt in futility to change their system volume</li>
</ol>
<br></br>
<h3>To run this automatically as a scheduled task, I've done the following</h3>
<ol>
	<li>Create a basic task in Task Scheduler and name is something like "Volume Limiter"</li>
	<li>Set the trigger to "log on of specific user", or whatver you like. System start or any user could work too</li>
	<li>Set the action to Start a Program, set the program/script to "powershell.exe", set arguments to '-WindowStyle Hidden -ExecutionPolicy Bypass -File "run.ps1"'</li>
	<li>Set start in to "C:\Program Files\Windows-Volume-Lock\scripts\"</li>
	<li>Test by selecting the task</li>
</ol>
