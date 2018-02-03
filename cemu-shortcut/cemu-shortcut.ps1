$cemu = $(scoop which cemu-nopath)
$target = Resolve-Path $cemu

if ($target -eq $null) {
	throw "Could not find cemu, is it installed?"
}

$target = New-Object System.IO.FileInfo($target)

$game = Read-Host "What game would you like to use?"
$game = Resolve-Path $game
if ($game -eq $null) {
	throw "Could not find game"
}
$gameInfo = New-Object System.IO.FileInfo($game)

$name = Read-Host "What would you like to name the shortcut? [$($gameInfo.BaseName)]"

if ($name -eq $null) {
	$name = $gameInfo.BaseName
}

$fullscreen = Read-Host "Would you like the shortcut to launch your game in fullscreen? [Y/n]"
if ($fullscreen -eq $null) {
	$fullscreen = $true
} else {
	$fullscreen = $fullscreen.Substring(0,1).ToLower() -ne "n"
}

$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut([Environment]::GetFolderPath("Desktop") + "\$name.lnk")
$Shortcut.TargetPath = $target.FullName
$Shortcut.WorkingDirectory = $target.DirectoryName

$args = "-g `"$game`""

if ($fullscreen) {
	$args = $args + " -f"
}

$Shortcut.Arguments = $args
$Shortcut.Save()

Write-Output "Shortcut saved to Desktop!"