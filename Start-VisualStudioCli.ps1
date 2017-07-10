# to get sudo: choco install sudo
# Import this script in your starup as detailed here: https://social.technet.microsoft.com/Forums/windowsserver/en-US/7901f9bd-674c-4298-93ed-f997c46541f4/start-powershell-with-modules-loaded?forum=winserverpowershell
# powershell profile is in $Home\Documents\WindowsPowerShell\ 
# once done, you can simply do vsd . and visual studio will open the solution in current directory (as admin)
function vsd { 
    $vs = "c:\program files (x86)\microsoft visual studio\2017\professional\common7\ide\devenv.exe"
    $solution = get-childitem $args -filter "*.sln" | get-childitem
    
    sudo $vs $solution
}