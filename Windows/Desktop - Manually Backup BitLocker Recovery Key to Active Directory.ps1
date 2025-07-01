# Used to manually backup a BitLocker recovery key to AD if the laptop was encrypted BEFORE joining the computer to the domain, or encrypted after MDT deployment.
$volume = Get-BitLockerVolume -MountPoint "C:"

if ($null -ne $volume) {
    if ($volume.KeyProtector.Count -gt 1) {
        Backup-BitLockerKeyProtector -MountPoint "C:" -KeyProtectorId $volume.KeyProtector[1].KeyProtectorId
    } else {
        Write-Error "The BitLocker volume does not have a second KeyProtector."
    }
} else {
    Write-Error "Failed to retrieve BitLocker volume for C: drive."
}

# Commands you can run in case you have physical access to the machine;
# manage-bde -protectors -get c:
# manage-bde -protectors -adbackup c: -id {DFB478E6-8B3F-4DCA-9576-C1905B49C71E}
