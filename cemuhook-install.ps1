write-output "Linking dbghelp.dll"
$dbghelpExists = (New-Object System.IO.FileInfo("$dir\..\..\cemu\current\dbghelp.dll")).Exists
if (!$dbghelpExists) {
	& "$env:COMSPEC" /c mklink /h "$dir\..\..\cemu\current\dbghelp.dll" "$dir\dbghelp.dll" | out-null
}

write-output "Linking keystone.dll"
$keystoneExists = (New-Object System.IO.FileInfo("$dir\..\..\cemu\current\keystone.dll")).Exists
if (!$keystoneExists) {
	& "$env:COMSPEC" /c mklink /h "$dir\..\..\cemu\current\keystone.dll" "$dir\keystone.dll" | out-null
}

write-output "Linking sample_patches.zip"
$samplePatchesExists = (New-Object System.IO.FileInfo("$dir\..\..\cemu\current\graphicPacks\sample_patches.zip")).Exists
if (!$samplePatchesExists) {
	& "$env:COMSPEC" /c mklink /h "$dir\..\..\cemu\current\graphicPacks\sample_patches.zip" "$dir\graphicPacks\sample_patches.zip" | out-null
}

write-output "Linking BreathOfTheWild_LwzxNullCheck"
$botwExists = (New-Object System.IO.DirectoryInfo("$dir\..\..\cemu\current\graphicPacks\BreathOfTheWild_LwzxNullCheck")).Exists
if (!$botwExists) {
	& "$env:COMSPEC" /c mklink /j "$dir\..\..\cemu\current\graphicPacks\BreathOfTheWild_LwzxNullCheck" "$dir\graphicPacks\BreathOfTheWild_LwzxNullCheck" | out-null
}

write-output "Copying gameProfiles"
Copy-Item -Path "$dir\gameProfiles" -Destination "$dir\..\..\cemu\current" -Recurse -Force