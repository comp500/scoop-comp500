# Cemu Installation guide with Scoop
[Guide for Dolphin](https://github.com/comp500/scoop-comp500/blob/master/Dolphin.md)

### Quick Start from cmd (if you know what you are doing)
- `powershell`
- `set-executionpolicy remotesigned -scope currentuser`
- `iex (new-object net.webclient).downloadstring('https://get.scoop.sh')`
- `scoop bucket add comp500 https://github.com/comp500/scoop-comp500/`
- `scoop install cemu`
- Optional: `scoop install cemugraphicspacks`

### Prerequisites
- PowerShell 3 or newer, usually included with Windows 10, Windows 8 and installable for Windows 7

## Guide
1. Follow [Scoop's Quick Start](https://github.com/lukesampson/scoop/wiki/Quick-Start) to install Scoop.
1. With PowerShell open, type `scoop bucket add comp500 https://github.com/comp500/scoop-comp500/` to add this bucket.
1. Type `scoop install cemu` to install Cemu.
1. Cemu is now available as a shortcut in your Start Menu, and at `[Your user directory]\scoop\apps\cemu\current`.

If Cemu does not launch, you may need to install Visual C++ Redistributable 2015. This is installable through Scoop as follows:
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
  
- Cemu 1.11.2 doesn't work with this as the extraction directory doesn't have an underscore in it. You can fix this after attempting the download by going to the cache folder in your scoop directory, and renaming the directory within the zip to `cemu_1.11.2`.
- Some (especially older) versions may break or show errors with this, as the folder structure is different.
- To change the installed Cemu version used for shortcuts, run `scoop reset cemu@version`.

# Cemu Addons
Addons available:
- ~~`cemuhook` Cemuhook by rajkosto~~ Doesn't work in current scoop, see [this PR discussion](https://github.com/lukesampson/scoop/pull/1385)
- `cemugraphicspacks` Cemu Graphics Packs by slashiee

These addons will link themselves into your Cemu install, so that Cemu can use them. Make sure you use the correct uninstall method (`scoop uninstall`) to remove them, as that will ensure that they are removed from your Cemu install properly.

## Notes
- When updating Cemu, uninstall and reinstall cemuhook, or run cemuhook-install.ps1 in the cemuhook directory.
- Ideally uninstall all addons before uninstalling Cemu.
- Linking graphics packs can take a while, and could trigger antiviruses. Please wait for the process to complete. If it does not, you should go into `[Your user directory]\scoop\apps\cemu\current\graphicsPacks` to manually remove them.
- Occasionally the error `ERROR Couldn't remove '~\scoop\apps\cemugraphicspacks\671'; it may be in use.` or "Access denied" occurs when uninstalling cemu graphics packs. Restart your computer (or wait a while) to fix this problem.