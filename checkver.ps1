param($app) #optionally pass an app name to just check one app

$bin = split-path (scoop which scoop)
$checkver = "$bin\checkver.ps1"
$dir = "$psscriptroot" # checks the current dir; modify if you need something else

& $checkver -app $app -dir $dir -u
pause