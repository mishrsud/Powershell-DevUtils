<#
.SYNOPSIS Create a web app under an existing website

#requires -version 3.0
#requires -RunAsAdministrator

Resource: https://docs.microsoft.com/en-us/iis/manage/powershell/powershell-snap-in-creating-web-sites-web-applications-virtual-directories-and-application-pools
Stackoverflow: https://stackoverflow.com/a/14885308/190476
#>

Import-Module WebAdministration

New-Item IIS:\AppPools\MyAPI

$physicalPath = "c:\temp"

New-Item IIS:\Sites\apihost\MyAPI -PhysicalPath $physicalPath -Type Application -ApplicationPool MyAPI
