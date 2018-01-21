<#
.SYNOPSIS
This script will save all files with the specified extension in the specified path with UTF8 encoding
.EXAMPLE
.\Set-FileEncodingUTF8NoBOM.ps1 -Path "C:\SourceCode\MyProject" -Extension "*.cs"
#>

param (
    [Parameter(Mandatory=$true)][String] $Path,
    [Parameter(Mandatory=$true)][String] $Extension
)

Get-ChildItem -Path $Path -Filter $Extension | ForEach-Object {
    Write-Verbose "Fixing $_"
    $saveToPath = Join-Path -Path $Path -ChildPath $_
    Write-Verbose "Saving to $saveToPath"
    $content = Get-Content $saveToPath
    [IO.File]::WriteAllLines($saveToPath, $content)
}
