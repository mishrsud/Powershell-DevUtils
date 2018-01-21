<#

.INPUTS
-ConfigPath         : The absolute or relative path to the config path. See example for the structure of the config file
-Verbose            : Print verbose messages

.EXAMPLE 

Config Looks like this:

{
    "Containers": [ "eventstore-node", "rabbitmq", "mongodb", "elk" ]
}

.\Start-DevEnvironment.ps1 -ConfigPath .\dev-env-config.json

#requires -version 3.0
#>

param
(
    [Parameter(Mandatory = $true)]
    [string]$ConfigPath
)

function Read-Config () {
    if ((Test-Path -Path $ConfigPath) -ne $true) {
        Write-Error -Message "Provided config path does not exist" -Verbose -Category InvalidArgument
        exit
    }
    else {
        return Get-Content $ConfigPath | ConvertFrom-Json
    }
}

function Test-IsContainerStarted () {
    param (
        [Parameter(Mandatory = $true)]
        [string]$ContainerName
    )

    $Status = docker ps --format '{{.Names}}' --filter "name=$ContainerName" --filter "status=running"    

    if ([string]::IsNullOrWhiteSpace($Status)) {
        return $false
    }

    return $true
}

function Start-Container () {
    param (
        [Parameter(Mandatory = $true)]
        [string]$ContainerName
    )

    docker start $ContainerName
}

$config = Read-Config 

foreach ($container in $config.Containers) {
    $containerStarted = Test-IsContainerStarted -ContainerName $container

    if ($containerStarted -eq $false) {
        Write-Output "Starting $container"
        Start-Container -ContainerName $container
    }
    else {
        Write-Output "$container is running"
    }
}
