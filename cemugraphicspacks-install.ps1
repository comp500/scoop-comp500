$cemuExists = (New-Object System.IO.FileInfo("$dir\..\..\cemu\current")).Exists
if ($cemuExists) {
	Get-ChildItem $dir -Recurse -Directory |
	ForEach-Object {
		write-output "Linking $($_.Name)"
		& "$env:COMSPEC" /c mklink /j "$dir\..\..\cemu\current\graphicPacks\$($_.Name)" $_.FullName | out-null
	}
} else {
	throw "Cannot find cemu folder. Has it been installed?"
}