<#
.Synopsis Demonstrates how to read a JSON config file and access properties of the parsed PowerShell object
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$ConfigPath
)

$ErrorActionPreference = 1 # Stop execution

function Read-Config () {
    if ((Test-Path -Path $ConfigPath) -ne $true) {
        Write-Error -Message "Provided config path does not exist" -Verbose -Category InvalidArgument
        exit
    }
    else {
        return Get-Content $ConfigPath | ConvertFrom-Json
    }
}

$config = Read-Config

# Use the dot-notation to get the value of a prperty
$name = $config."Name"

# Use the Select-Object cmdlet 
$isTrue = $config | Select-Object -ExpandProperty "IsTrue"
$count = $config | Select-Object -ExpandProperty "Count"

Write-Verbose "Name: $name, IsTrue: $isTrue, Count: $count"