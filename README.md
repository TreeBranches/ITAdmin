# Android-Debloater

# Welcome
This repository contains scripts which remove most of what I would consider bloatware from various Android OEM devices.

I use these when deploying devices around our office, but could be applied and updated to make use of any phone.

Note that as I deploy the Microsoft launcher to keep a consistent layout and configuration for all staff on all devices, I **strongly** recommend reviewing the script *before* appyling it, as it may remove applications or functionality that you would prefer to keep.

### For example:
 - For Nokia devices, launcher relies on a number of background services to function fully, (even though it's supposedly vanilla...), and so you may start suddenly getting "com.android.xxx.xxx has stopped" randomly whilst using your phone.
 - For Samsung devices, I remove the launcher entirely. Pressing the home button without having the launcher will just give you a screen saying "Starting up..." that never goes away, and you'll have to go through some acrobatics to deploy a launcher, or revert the script. 

If you are happy with your launcher, then at the very least, be sure to review the script before deploying it. I'm not responsible for you pasting random scripts from the internet without you knowing ***exactly*** what they do, and I'm not going to help you fix it. I've deployed this across more than 200 devices and coutning over these years, and *absolutely none* of our devices have experienced any issues that relate to these scripts.

In short, if something goes horribly wrong for you, it's your fault.

# Instructions

These instructions are for Windows. I don't use anything else for personal use so feel free to contribute other OS instructions here. 

1. Get hold of ADB.EXE on your PC. It's included in the [Google SDK](https://developer.android.com/studio/command-line/adb) if you want a more official source, but you can also download it on its own from [ADB Shell](http://adbshell.com/downloads). You will need both the ADB Driver and the ADB Shell.
2. Enable Developer mode on your phone and enable USB debugging - if you don't know how to do this, or do not know how to find out how to do this, forget the rest of these instructions.
3. Plug your phone into your PC, ensure to enable File Transfer and not just charging.
4. Navigate to where you placed ADB.EXE, hold Shift, then Right Click, and click "Open Powershell Window Here"
5. Type: .\adb.exe /shell
6. Your phone will spring up asking for you to authorise your PC. Tick Always Allow then enable. If you took too long, don't have USB Debugging enabled or if you don't have the ADB Driver installed properly (Check Device Manager!), ADB will complain that it couldn't find a device.
7. Once you're in the shell, you can paste the entire contents of my (or your altered) script. If ADB found the application, it will just say "Success" when it's removed and move on to the next line. If the script couldn't find the applicaiton, it will just say "Failed" and move on to the next line.

# Notes and Tips
- None of this REMOVES the bloat completely, but it hard disables it for the current user (since no one shares or even has Android tablets or phones, this works fine). If you're special enough to need to do it for other users, then change the user number from 0 to 1, 2 etc in the script.
- If you want to remove the bloat completely, you absolutely 100% NEED root - there's no workarounds or ways around this. If your phone is rooted or you want to just temporarily root your phone in order to do this, just run the scripts without the "-k --user 0" part. Doing this though is unreversable without a factory reset or maybe even a stock ROM image - I haven't tested this since I don't root office phones, and I'm not giving instructions on how to resolve this. Go to XDA Forums.
- When you first get a device, or at least with Samsungs, skip through the initial Welcome steps without filling in anything or connecting to WiFi, then factory reset. The next time you go through these steps, you'll be prompted at the end what "extra apps" you want to include on your phone in a checklist form, and can include basic things like Samsung Calculator and such.
- You can do this to remove other bloat as well, and on other phones. This is a script I keep a hold of as I deploy Android phones regularly when deploying phones in our office. Unfortunately I've only been in charge of doing this for a couple of years so I only have lists for Nokias and Samsungs for now (from from the S8 to the S10, Nokia 3 and 3.1).
- If you want to disable more stuff, use the following command from ADB Shell to see what packages are currently installed on your phone
    
        pm list packages -f
- Use the following command to re-enable something you disabled using the above script:
    
        pm install-existing $full.package.name
