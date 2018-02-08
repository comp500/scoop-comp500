param (
	[switch]$register = $false,
	[switch]$unregister = $false
)

if ($register) {
	write-output "Registering protocol handler"
} elseif ($unregister) {
	write-output "Unregistering protocol handler"
} else {
	$argsJoined = $args -join ""
	if ($argsJoined.Substring(0,6) -eq "scoop:") {

		[string[]] $argsSplit = $($argsJoined.Substring(6) -split "!")
		$argsSplit

		if ($argsSplit[0] -eq "install") {
			if ($argsSplit.Length -ge 2) {
				$argsPrint = $argsSplit[1..($argsSplit.Length-1)]
				if ($argsPrint.Length -gt 1) {
					write-output "Installing packages:"
					write-output $argsPrint
				} else {
					write-output "Installing package: $($argsPrint[0])"
				}

				$confirm = read-host "Do you want to continue? [Y/n]"

				if (($confirm -eq $null) -or ($confirm.Length -lt 1)) {
					$confirm = $true
				} else {
					$confirm = $confirm.Substring(0,1).ToLower() -ne "n"
				}

				if ($confirm) {
					& scoop install $argsPrint
					pause
				} else {
					write-output "Install cancelled, exiting"
					pause
				}
			} else {
				write-error "Invalid install command, exiting"
				pause
			}
		} else {
			write-error "Invalid command, exiting"
			pause
		}
	} else {
		write-error "Invalid protocol, exiting"
		pause
	}
}