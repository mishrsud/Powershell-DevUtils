<#
.Synopsis Demonstrates how to use PowerShell infrastructure to provide for a WhatIf (dry run)
#>

[CmdletBinding(SupportsShouldProcess=$true)]
param (
    [Parameter(Mandatory=$true)]
    [string] $Path
)

$dontRun = $WhatIfPreference

function Create-Directory () {
   if ($WhatIfPreference) {
    Write-Host "returning"
    return
   }
    mkdir $Path
    Write-Verbose "Creating Path"
}

Write-Host "Dont run = $dontRun"

Create-Directory -Path $Path