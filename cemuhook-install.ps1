write-output "Linking dbghelp.dll..."
$dbghelpExists = (New-Object System.IO.FileInfo("$dir\..\..\cemu\current\dbghelp.dll")).Exists
if (!$dbghelpExists) {
	& "$env:COMSPEC" /c mklink /h "$dir\..\..\cemu\current\dbghelp.dll" "$dir\dbghelp.dll" | out-null
}
#& \"$env:COMSPEC\" /c mklink /j \"$dir\\..\\..\\cemu\\current\\graphicPacks\\cemuhook\" \"$dir\\graphicPacks\" | out-null