$cemuExists = (New-Object System.IO.FileInfo("$dir\..\..\cemu\current")).Exists
if ($cemuExists) {
	write-output "Removing link to dbghelp.dll"
	rm "$dir\..\..\cemu\current\dbghelp.dll"

	write-output "Removing link to keystone.dll"
	rm "$dir\..\..\cemu\current\keystone.dll"

	write-output "Removing link to sample_patches.zip"
	rm "$dir\..\..\cemu\current\graphicPacks\sample_patches.zip"

	write-output "Removing link to BreathOfTheWild_LwzxNullCheck"
	rm -r -Force "$dir\..\..\cemu\current\graphicPacks\BreathOfTheWild_LwzxNullCheck"
} else {
	write-output "Cannot find cemu folder. If it has already been uninstalled, this is not a problem."
}