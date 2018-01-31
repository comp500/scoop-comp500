# Cemu Installation guide with Scoop
[Guide for Dolphin](https://github.com/comp500/scoop-comp500/blob/master/Dolphin.md)

### Prerequisites
- PowerShell 3 or newer, usually included with Windows 10, Windows 8 and installable for Windows 7

## Guide
1. Follow [Scoop's Quick Start](https://github.com/lukesampson/scoop/wiki/Quick-Start) to install Scoop.
1. With PowerShell open, type `scoop bucket add comp500 https://github.com/comp500/scoop-comp500/` to add this bucket.
1. Type `scoop install cemu` to install Cemu.
1. Cemu is now available as a shortcut in your Start Menu, and at `[Your user directory]\scoop\apps\cemu\current`.

If Cemu does not launch, you need to install Visual C++ Redistributable 2015. This is installable through Scoop as follows:
1. Run `scoop bucket add extras`
1. Run `scoop install vcredist2015`

## Notes
- Run `scoop update cemu` to update Cemu to the latest version. This should work even if this bucket is not updated.
- Persistence should work for most of the folders in cemu, however please check the cemu folder before you run `scoop cleanup`.
- To fully remove all versions of Cemu and settings, type `scoop cache rm cemu` then `scoop uninstall cemu -p`.
- If you have any problems with using Cemu through Scoop, please submit an issue [here](https://github.com/comp500/scoop-comp500/issues/new).

### Custom versions
- Install any version by typing `scoop install cemu@version`.

  e.g `scoop install cemu@1.11.3`
  
- Cemu 1.11.2 doesn't work with this as the extraction directory doesn't have an underscore in it. You can fix this by going to the cache folder in your scoop directory, and renaming the directory within the zip to `cemu_1.11.2`.
- Some (especially older) versions may break or show errors with this, as the folder structure is different.
- To change the installed Cemu version used for shortcuts, run `scoop reset cemu@version`.
