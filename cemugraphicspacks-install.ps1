$cemuExists = (New-Object System.IO.DirectoryInfo("$dir\..\..\cemu\current")).Exists
if ($cemuExists) {
	$directories = Get-ChildItem $dir -Recurse -Directory
	$console = $host.UI.RawUI
    $left = $console.CursorPosition.X
	$top = $console.CursorPosition.Y
	$current = 0

	write-host "Linking packs... (0 / $($directories.Count))" -nonewline
	[console]::SetCursorPosition($left, $top)

	$directories | ForEach-Object {
		$folderExists = (New-Object System.IO.DirectoryInfo("$dir\..\..\cemu\current\graphicPacks\$($_.Name)")).Exists
		if (!$folderExists) {
			& "$env:COMSPEC" /c mklink /j "$dir\..\..\cemu\current\graphicPacks\$($_.Name)" $_.FullName | out-null
		}

		$current = $current + 1
		write-host "Linking packs... ($current / $($directories.Count))" -nonewline
		[console]::SetCursorPosition($left, $top)
	}

	write-host "Linking packs... done.        "
} else {
	throw "Cannot find cemu folder. Has it been installed?"
}