# Android-Debloater

First draft, formatting is sloppy. Will sort later :)


Scripts which remove bloatware from various Android OEM devices.

I use these for deploying devices around the office, as I deploy the Microsoft launcher to keep a consistent setup through all devices, but could be applied and updated to make use of any phone.

- Get hold of ADB.EXE on your PC.
- Enable Developer mode on your phone and enable USB debugging.
- Plug your phone into your PC, ensure to enable File Transfer and not just charging.
- Open Powershell and navigate to the location of ADB.EXE
- Type: .\adb.exe /shell
- Your phone will spring up asking for you to authorise your PC. Tick Always Allow then enable.

Note: None of this REMOVES the bloat, but it disables it for the current user. Unfortunately you do NEED root to remove completely, in which case you'd just run the above command but without the "-k --user 0" part. Doing this though is unreversable without a factory reset.

Also Note: When you first get a Samsung, skip through the initial Welcome steps without filling in anything, then factory reset. The next time you go through the steps, you'll be prompted at the end which "extra apps" you want to include on your phone. Note that this will remove some typically stock things like Calculator and such if you untick everything, but you can find them all on the Play Store.

Also Also Note: You can do this to remove other bloat as well, and on other phones. This is a script I keep a hold of as I deploy Android phones regularly. Unfortunately I've only been in charge of doing this for a couple of years so only have Nokias and Samsungs for now (from from the S8 to the S10, Nokia 3 and 3.1).

Use the following command to see what packages are currently installed if you want to disable more stuff:

    pm list packages -f

Use the following command to re-enable something you disabled using the above script:

    pm install-existing $full.package.name
