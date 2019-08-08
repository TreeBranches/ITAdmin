# Android-Debloater

First draft, formatting is sloppy. Will sort later :)


Scripts which remove bloatware from various Android OEM devices.

This list of applications were mostly for the Galaxy S10, but could be applied and updated to make use of any phone - to help keep things clear, please add a comment header to group together what things are in case we need to re-enable something.

Simply paste this script into ADB to run (instructions below)

If you want to try cleaning up a device, you can view the list of applications installed by running the following command in an ADB shell:

pm list packages -f

If you need to reinstall anything for whatever reason, use the following command:

pm install-existing $full.package.name

I recommend doing these in batches of OEM as there is a hard limit to how many characters you can paste at once, but I do recommend running all of them, even if the OEM doesn't match the device you're running this on. 


Enable development mode on the phone by going into Settings -> About phone and tapping the Build Number 10 times (it will come up saying you are 8...7...6... steps away from becoming a developer).

Enter Developer Options. Scroll to USB Debugging and enable it.

After doing this, at some point when you plug the phone into your PC, the phone will ask you to authorise the PC that's trying to access it. Tick the "Always Trust this computer", then hit OK. If you don't do this, adb.exe will throw up a "device unauthorised" error.

Get hold of adb.exe (cannot be attached to this page) - It will let you plug any Android device into your PC and use a terminal to manage various aspects of it - including listing and disabling/deleting any installed packages. If you have WugFresh's Nexus Root Toolkit or the Android SDK installed, you already have this program on your PC and just need to locate it in the program's installation directory.

Plug the phone into your PC and when prompted, set the storage to "Transfer Files" mode.

Open a Powershell terminal on your PC, navigate to ADB.exe and type ".\adb.exe shell". 

Visit the pages in this repository and paste the commands to it. This will hard disable the listed applications from the user account on the phone (so making a new user will restore them). Since most people won't do this, it's as effective as uninstalling, and if the member of staff ends up wanting to use it (ie Facebook), they can just install it manually from the Play Store. Since we're using the Microsoft launcher as well, some things are completely unused.

Full uninstallation from the device requires root, which is a whole extreme process that is largely unnecessary unless you're picky, so this is good enough. Simply remove the -k --user 0 line from each script if you want to do this.
