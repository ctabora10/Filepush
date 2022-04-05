$Uninstall32 = gci "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" | foreach { gp $_.PSPath } | ? { $_ -match "TeamViewer Host" } | select UninstallString
$uninstall32 = $uninstall32.UninstallString -Replace "msiexec.exe","" -Replace "/I","" -Replace "/X",""
$uninstall32 = $uninstall32.Trim()
#write-host $Uninstall32
Start-Process "Msiexec.exe" -arg "/X $Uninstall32 /qn" -Wait