# to get sudo: choco install sudo
# Import this script in your starup as detailed here: https://social.technet.microsoft.com/Forums/windowsserver/en-US/7901f9bd-674c-4298-93ed-f997c46541f4/start-powershell-with-modules-loaded?forum=winserverpowershell
# powershell profile is in $Home\Documents\WindowsPowerShell\ 
# E.g.: Import-Module C:\Users\<username>\Documents\WindowsPowerShell\Modules\mine\Start-VisualStudioCli.ps1
# once done, you can simply do vsd . and visual studio will open the solution in current directory (as admin)
# For ConEmu and Cmder users, the profile is located in C:\cmder\config\user-profile.ps1
function vsd { 
    $vs = "c:\program files (x86)\microsoft visual studio\2017\professional\common7\ide\devenv.exe"
    $solution = get-childitem $args -filter "*.sln" | get-childitem
    
    sudo $vs $solution
}
