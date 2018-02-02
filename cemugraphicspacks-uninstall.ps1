$cemuExists = (New-Object System.IO.DirectoryInfo("$dir\..\..\cemu\current")).Exists
if ($cemuExists) {
	$directories = Get-ChildItem $dir -Recurse -Directory
	$console = $host.UI.RawUI
    $left = $console.CursorPosition.X
	$top = $console.CursorPosition.Y
	$current = 0

	write-host "Unlinking packs... (0 / $($directories.Count))" -nonewline
	[console]::SetCursorPosition($left, $top)

	$directories | ForEach-Object {
		#write-output "Unlinking $($_.Name)"
		rm -r -Force -LiteralPath "$dir\..\..\cemu\current\graphicPacks\$($_.Name)"

		$current = $current + 1
		write-host "Unlinking packs... ($current / $($directories.Count))" -nonewline
		[console]::SetCursorPosition($left, $top)
	}

	write-host "Unlinking packs... done.        "
} else {
	write-output "Cannot find cemu folder. If it has already been uninstalled, this is not a problem."
	$cemuPersistExists = (New-Object System.IO.DirectoryInfo("$dir\..\..\..\persist\cemu")).Exists
	if ($cemuPersistExists) {
		$directories = Get-ChildItem $dir -Recurse -Directory
		$console = $host.UI.RawUI
		$left = $console.CursorPosition.X
		$top = $console.CursorPosition.Y
		$current = 0

		write-host "Unlinking packs... (0 / $($directories.Count))" -nonewline
		[console]::SetCursorPosition($left, $top)
		$directories | ForEach-Object {
			#write-output "Unlinking $($_.Name)"
			rm -r -Force -LiteralPath "$dir\..\..\..\persist\cemu\graphicPacks\$($_.Name)"

			$current = $current + 1
			write-host "Unlinking packs... ($current / $($directories.Count))" -nonewline
			[console]::SetCursorPosition($left, $top)
		}

		write-host "Unlinking packs... done.        "
	} else {
		write-output "Cannot find cemu persistence folder. If it has already been uninstalled, this is not a problem."
	}
}