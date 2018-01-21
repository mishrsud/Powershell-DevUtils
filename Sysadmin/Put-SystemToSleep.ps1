<#
.SYNOPSIS
This script puts the system to sleep.
One of the use cases is to schedule the system to go to sleep once updates finish installing.
NOTE: Windows Task Scheduler can be used to schedule this script to run

.EXAMPLE
.\Set-FileEncodingUTF8NoBOM.ps1 -Path "C:\SourceCode\MyProject" -Extension "*.cs"
#>
#Requires -RunAsAdministrator

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::SetSuspendState("Suspend", $false, $true)