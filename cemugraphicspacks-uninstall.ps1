$cemuExists = (New-Object System.IO.DirectoryInfo("$dir\..\..\cemu\current")).Exists
if ($cemuExists) {
	Get-ChildItem $dir -Recurse -Directory |
	ForEach-Object {
		write-output "Unlinking $($_.Name)"
		rm -r -Force "$dir\..\..\cemu\current\graphicPacks\$($_.Name)"
	}
} else {
	write-output "Cannot find cemu folder. If it has already been uninstalled, this is not a problem."
	$cemuPersistExists = (New-Object System.IO.DirectoryInfo("$dir\..\..\..\persist\cemu")).Exists
	if ($cemuPersistExists) {
		Get-ChildItem $dir -Recurse -Directory |
		ForEach-Object {
			write-output "Unlinking $($_.Name)"
			rm -r -Force "$dir\..\..\..\persist\cemu\graphicPacks\$($_.Name)"
		}
	} else {
		write-output "Cannot find cemu persistence folder. If it has already been uninstalled, this is not a problem."
	}
}