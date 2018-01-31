# Dolphin Installation guide with Scoop

### Prerequisites
- PowerShell 3 or newer, usually included with Windows 10, Windows 8 and installable for Windows 7

## Guide
1. Follow [Scoop's Quick Start](https://github.com/lukesampson/scoop/wiki/Quick-Start) to install Scoop.
1. With PowerShell open, type `scoop bucket add comp500 https://github.com/comp500/scoop-comp500/` to add this bucket.
1. Type `scoop install dolphin-dev` to install the latest development version of Dolphin.
   -  To get Dolphin 5 (stable), the equivalent command is `scoop install dolphin5`, however you will not get the latest features.
   -  If you install Dolphin 5, use `dolphin5` instead of `dolphin-dev` in the commands below
1. Dolphin is now available as a shortcut in your Start Menu, and at `[Your user directory]\scoop\apps\dolphin-dev\current`.

If Dolphin does not launch, you need to install Visual C++ Redistributable 2017. This is installable through Scoop as follows:
1. Run `scoop bucket add extras`
1. Run `scoop install vcredist2017`

## Notes
- Run `scoop update dolphin-dev` to update Dolphin to the latest version. This should work even if this bucket is not updated.
- Run `scoop cleanup dolphin-dev` to remove old versions of Dolphin after updating.
- To fully remove all versions of Dolphin, type `scoop cache rm dolphin-dev` then `scoop uninstall dolphin-dev -p`.
- If you have any problems with using Dolphin through Scoop, please submit an issue [here](https://github.com/comp500/scoop-comp500/issues/new).

### Custom versions
- Install any version by typing `scoop install dolphin-dev@version`.

  e.g `scoop install dolphin-dev@5.0-6255`
  
- Very old versions of Dolphin may not work with this.
- To change the installed Dolphin version used for shortcuts after installing a different version, run `scoop reset dolphin-dev@version`.
