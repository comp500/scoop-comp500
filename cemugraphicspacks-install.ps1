$cemuExists = (New-Object System.IO.DirectoryInfo("$dir\..\..\cemu\current")).Exists
if ($cemuExists) {
	Get-ChildItem $dir -Recurse -Directory |
	ForEach-Object {
		$folderExists = (New-Object System.IO.DirectoryInfo("$dir\..\..\cemu\current\graphicPacks\$($_.Name)")).Exists
		if (!$folderExists) {
			write-output "Linking $($_.Name)"
			& "$env:COMSPEC" /c mklink /j "$dir\..\..\cemu\current\graphicPacks\$($_.Name)" $_.FullName | out-null
		}
	}
} else {
	throw "Cannot find cemu folder. Has it been installed?"
}