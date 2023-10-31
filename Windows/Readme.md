File names are named as `OS Edition - Application - Function`. Below contains readmes for the each file.

# Windows Server

## MDT - Rules
Microsoft Deployment Workbench Rules I initially used to tie drivers to specific form factors (desktop/laptop/tablets) and models, but evolved into setting defaults during WinPE.
Unfortunately tablets are seen by MDT as laptops. So far the hardware in tablets has been different enough to not been a problem, but am open to ideas on how to separate that.
Initially created to avoid driver conflicts for devices with similar hardware (mostly experienced with WiFi or Sound drivers), but you can tailor whatever to specific models.
Values for you to fill in have been replaced with ########. You can CTRL+F to replace accordingly.

Some notes are put in place for ease of reference. You'll need to remove them once filled in.

The `[Settings]` section has two values. `Priority` and `Properties`.
`Priority` is what is used to tell MDT which sections to process in what order.
`Properties` references some custom entries in the Task Sequence and can be named whatever you want them to be.

For my setup, the two properties I set/added to Task Sequence are as follows;

DriverGroupName = Used to direct the install to exclusively look in a specific driver folder. In the Preinstall section of the task sequence, navigate to the "Inject Drivers" step and set the selection profile to "Nothing" + "Install all drivers from the selection profile". Create a new Task Sequence Variable just before the "Inject Drivers" step with the value of `Windows 11\%DriverGroupName%`, where `Windows 11` is the name of any subfolder you created in the "Out-of-Box Drivers" group.
WSUSTargetGroup = Used to place the new machine into a WSUS Target Group. A new variable with the value "WSUSTargetGroup" in the Initialization step of the task sequence must be created.

(Side note, it is also possible to update the BIOS on many laptops (and all business range laptops) through a task sequence, though that's outside the scope of this section ;). Will add links to this later.

The model name to use in Rules is what appears when entering `gwmi win32_baseboard | FL Product` into a command prompt.
The DriverGroupName is the name of the folder I placed in Out-of-Box Drivers.

The value list and full documentation can be referenced here. It's too massive for me to duplicate and make notes on everything:
https://learn.microsoft.com/en-us/mem/configmgr/mdt/toolkit-reference

Another blog on this for less confusing/elaborate explanations, though incomplete:
https://www.hayesjupe.com/sccm-and-mdt-list-of-variables/

For general MDT shenanigans for Windows 11, this blog proved invaluable to me as I experienced most of these issues;
https://metisit.com/blog/microsoft-deployment-toolkit-mdt-configuration-with-unforeseen-challenges/

NOTE: These lines need to be both in rules (CustomSettings.ini) and BootStrap.ini to work;
```
SkipBDDWelcome=YES
UserDomain=INT.CONTOSO.NET
KeyboardLocale=en-GB
```

## WSUS - SSL Cert Generation for IIS
I believe WSUS SSL is a requirement on Windows 11 and / or Server 2022. It's good practice to have it enabled/configured anyway.
This script creates a new Cert with the server as the CA for you to roll that cert out to everyone for WSUS. It can also be used for WSUS cert renewals.
Make sure to run it on your WSUS server directly as it will make that the CA.

View the comments in the script for a rough breakdown on what each step does if you wish to do each step manually.

### To-Do: Find a way to add a step to change IIS Timeout from 120 seconds to 3600 seconds
