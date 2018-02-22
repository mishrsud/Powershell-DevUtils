<#
.SYNOPSIS
This script reads the Windows Registry to determine the versions of .NET Frameworks installed
.EXAMPLE
.\Get-DotNetVersion.ps1

For .NET Core, see dotnet sdk list here: https://www.hanselman.com/blog/dotnetSdkListAndDotnetSdkLatest.aspx
Github:      https://github.com/faniereynders/dotnet-sdk-helpers
My own fork: https://github.com/mishrsud/dotnet-sdk-helpers
#>

Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP' -recurse |
Get-ItemProperty -name Version,Release -EA 0 |
Where-Object { $_.PSChildName -match '^(?!S)\p{L}'} |
Select-Object PSChildName, Version, Release, @{
  name="Product"
  expression={
      switch -regex ($_.Release) {
        "378389" { [Version]"4.5" }
        "378675|378758" { [Version]"4.5.1" }
        "379893" { [Version]"4.5.2" }
        "393295|393297" { [Version]"4.6" }
        "394254|394271" { [Version]"4.6.1" }
        "394802|394806" { [Version]"4.6.2" }
        "460798" { [Version]"4.7" }
        {$_ -gt 460798} { [Version]"Undocumented 4.7 or higher, please update script" }
      }
    }
}