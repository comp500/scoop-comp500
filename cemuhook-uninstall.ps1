write-output "Removing link to dbghelp.dll..."
rm "$dir\..\..\cemu\current\dbghelp.dll"

write-output "Removing link to keystone.dll..."
rm "$dir\..\..\cemu\current\keystone.dll"

write-output "Removing link to sample_patches.zip..."
rm "$dir\..\..\cemu\current\graphicPacks\sample_patches.zip"

write-output "Removing link to BreathOfTheWild_LwzxNullCheck..."
rm -r "$dir\..\..\cemu\current\graphicPacks\BreathOfTheWild_LwzxNullCheck"