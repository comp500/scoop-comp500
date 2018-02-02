Get-ChildItem $dir -Recurse -Directory |
ForEach-Object {
	write-output "Unlinking $($_.Name)"
	rm -r -Force "$dir\..\..\cemu\current\graphicPacks\$($_.Name)"
}