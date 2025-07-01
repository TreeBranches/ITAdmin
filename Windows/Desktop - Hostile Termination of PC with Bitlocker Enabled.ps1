# Used to force restart a computer and flush the TPM key, forcing the PC to display the Bitlocker Recovery Screen.
# Make sure the PC has their recovery code in Active Directory before doing this or you'll need to format!

$MountPoint = "C:"
$KeyProtectors = (Get-BitLockerVolume -MountPoint $MountPoint).KeyProtector
foreach($KeyProtector in $KeyProtectors){
Remove-BitLockerKeyProtector -MountPoint $MountPoint -KeyProtectorId $KeyProtector.KeyProtectorId
}
shutdown -r -t 0 -f
