$cemuExists = (New-Object System.IO.DirectoryInfo("$dir\..\..\cemu\current")).Exists
if ($cemuExists) {
	write-output "Removing link to dbghelp.dll"
	remove-item "$dir\..\..\cemu\current\dbghelp.dll"

	write-output "Removing link to keystone.dll"
	remove-item "$dir\..\..\cemu\current\keystone.dll"

	write-output "Removing link to sample_patches.zip"
	remove-item "$dir\..\..\cemu\current\graphicPacks\sample_patches.zip"

	write-output "Removing link to BreathOfTheWild_LwzxNullCheck"
	remove-item -r -Force "$dir\..\..\cemu\current\graphicPacks\BreathOfTheWild_LwzxNullCheck"
} else {
	write-output "Cannot find cemu folder. If it has already been uninstalled, this is not a problem."
	$cemuPersistExists = (New-Object System.IO.DirectoryInfo("$dir\..\..\..\persist\cemu")).Exists
	if ($cemuPersistExists) {
		write-output "Removing link to sample_patches.zip"
		remove-item "$dir\..\..\..\persist\cemu\graphicPacks\sample_patches.zip"

		write-output "Removing link to BreathOfTheWild_LwzxNullCheck"
		remove-item -r -Force "$dir\..\..\..\persist\cemu\graphicPacks\BreathOfTheWild_LwzxNullCheck"
	} else {
		write-output "Cannot find cemu persistence folder. If it has already been uninstalled, this is not a problem."
	}
}