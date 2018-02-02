Get-ChildItem $dir -Recurse -Directory |
ForEach-Object {
	write-output "Linking $($_.Name)"
	& "$env:COMSPEC" /c mklink /j "$dir\..\..\cemu\current\graphicPacks\$($_.Name)" $_.FullName | out-null
}