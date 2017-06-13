<#
.Synopsis Demonstrates how to read a JSON config file and access properties of the parsed PowerShell object
#>

param (
    [Parameter(Mandatory = $true)]
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

$configValues = Read-Config

foreach ($config in $configValues) {
    # Use the dot-notation to get the value of a prperty
    $name = $config.Name

    # Use the dot notation - second variant
    $isTrue = $config."IsTrue"

    # Use the Select-Object cmdlet 
    $count = $config | Select-Object -ExpandProperty "Count"

    Write-Verbose "Name: $name, IsTrue: $isTrue, Count: $count"    
}
