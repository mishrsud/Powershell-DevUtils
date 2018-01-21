$app = Get-WmiObject -Class Win32_Product | Where-Object {     $_.Name -match "Microsoft Visual Studio 2015" }
$app.Uninstall();