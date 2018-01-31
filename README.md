# scoop-comp500
Scoop bucket for my packages (code not made by me, only the packages). If you want to use these files, feel free to take them for any purpose - they are in the public domain. They are provided without warranty, so don't sue me if it breaks stuff (it shouldn't).

## How to use?
1. Install [Scoop](https://github.com/lukesampson/scoop/wiki/Quick-Start)
1. Type `scoop bucket add comp500 https://github.com/comp500/scoop-comp500/`
1. Install the packages you want

## Notes about Cemu
- Install any version by typing `scoop install cemu@version`

  e.g `scoop install cemu@1.11.3`
  
- Cemu 1.11.2 doesn't work with this as the extraction directory doesn't have an underscore in it. You can fix this by going to the cache folder in your scoop directory, and renaming the directory within the zip to `cemu_1.11.2`.
- Run `scoop update cemu` to update Cemu.
- Persistence should work for most of the folders in cemu, however please check the cemu folder before you run `scoop cleanup`.
- To fully remove all versions of Cemu and settings, type `scoop cache rm cemu` then `scoop uninstall cemu -p`.
