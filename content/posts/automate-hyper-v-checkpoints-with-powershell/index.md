+++
date = 2023-04-14T06:04:45Z
description = ""
draft = false
image = "tobias-fischer-PkbZahEG2Ng-unsplash.jpg"
slug = "automate-hyper-v-checkpoints-with-powershell"
title = "Automate Hyper-V checkpoints with PowerShell and Task Scheduler"

+++


This script will keep _n_ many checkpoints (or snapshots) of a Hyper-V virtual machines for a given VM's name.

Usage:

```powershell
powershell.exe scriptname.ps1 7 RedHatDockerHost
```

Where you want to keep 7 checkpoints for a VM named *RedHatDockerHost*

## The script

Note: the term 'days' is used in the script, assuming that this script is run daily, however 'runs' would have been more accurate

```powershell
# Keep X days of Hyper-V checkpoints for VM Y
param(
    [Parameter(Mandatory=$True, Position=0, ValueFromPipeline=$false)]
    [int]
    $days,

    [Parameter(Mandatory=$True, Position=1, ValueFromPipeline=$false)]
    [System.String]
    $name
)


# Check VM exists

$vmExists = get-vm "$($name)"

if ($vmExists.ExitCode -eq "False") {
	"VM $name does not exist! Exiting."
	exit
}

# Rename any existing checkpoints

for ($dayCount = $days ; $dayCount -gt 0 ; $dayCount--) {
	$toDay = $dayCount + 1

	try {
		# Check a checkpoint for this day exists
		get-vmcheckpoint -vmname $name -name "$($name)_$($dayCount)_auto"

		# Rename
		rename-vmcheckpoint -name "$($name)_$($dayCount)_auto" -vmname $name -newname "$($name)_$($toDay)_auto"
	} catch [ObjectNotFound,Microsoft.HyperV.PowerShell.Commands.GetVMSnapshot] {
		# Do nothing
	}
}

# Create new checkpoint

$checkpointingSuccess = checkpoint-vm -name $name -snapshotname "$($name)_1_auto"

if ($checkpointingSuccess.ExitCode -eq "False") {
	"Failed to create new checkpoint. Exiting."
	exit
}

# Delete old checkpoint

$delDay = $days + 1;
#"Deleting $delDay"
Remove-vmcheckpoint -vmname $name -name "$($name)_$($delDay)_auto"
```

## Set it up

- Create the script
    - Copy and paste the above script into notepad and save as *createcheckpoint.ps1*

{{< figure src="Screenshot-2023-04-14-152717.png" >}}

- Create the task
    - Open Task Scheduler
    - On the left-hand side, right-click Task Scheduler Library and click Create Basic Task
    - Enter a Name e.g., *Checkpoint RedHatDockerHost*
    - Choose a schedule e.g., Daily
    - For Action choose Start a program
        - For Program/script enter *powershell.exe*
        - In Add arguments, enter the full path to the script created in the first step, the number of checkpoints to keep, and the name of the VM to checkpoint e.g., *"C:\FILES\createcheckpoint.ps1" 7 "RedHatDockerHost"*
    - Click Finish
- Modify the task
    - Open the task you just created
    - Choose Run whether user is logged on or not
    - (If not on a domain joined PC) tick Do not store password
    - Tick Run with highest privileges
    - Tick Hidden
    - Click OK
- **Follow up!**
    - Set a reminder to check for the next few days/occurances that your task is working! Backups (this isn't a proper backup but it provides more safety than not having it) are only useful if they are tested *to work*.



