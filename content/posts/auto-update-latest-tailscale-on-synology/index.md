+++
date = 2023-04-15T04:22:51Z
description = ""
draft = false
image = "tumblr_njbqroPTle1r48hglo1_500.jpg"
slug = "auto-update-latest-tailscale-on-synology"
title = "Auto-update latest Tailscale on Synology"

+++


While Tailscale is now in Synology's package centre, it has been a far older version than Tailscale provide in their on package repository. This script automatically installs and updates to the latest version for a ARMv8-based Synology with an ARMv8 CPU (I recommend Synologys capable of running Docker should use that instead).

```bash
#!/bin/bash
set -e

# Update Synology Tailscale package if new for DSM7 ARMv8
# (modify $URL below if your DSM or CPU architecture is different)

# Get INput FILE NAME
INFILENAME=$(curl -s https://pkgs.tailscale.com/stable/?mode=json | jq .Tarballs.arm64)

# Extract version
IFS="_" read -a COMPONENTS <<< $INFILENAME
VERSION="${COMPONENTS[1]}"

# Make temp dir
[ -d ~/.tailscale_tmp ] || mkdir -p ~/.tailscale_tmp
cd ~/.tailscale_tmp

# Continue if the current version different
LASTVERSION="no-previous-record"

[ -f ~/.tailscale_tmp/last-version.txt ] && LASTVERSION=$(cat ~/.tailscale_tmp/last-version.txt)
if [[ "${LASTVERSION}" = "${VERSION}" ]]; then
        exit
fi

# We have a new version, update last-version.txt
echo "${VERSION}" > ~/.tailscale_tmp/last-version.txt

# Construct URL
# URLS are in the form (replaceing A, B and C, excluding "{}"):
#   tailscale-armv8-{A}.{B}.{C}-{B}00{C}7-dsm7.spk
# Extract B and C from $VERSION
IFS="." read -a ABC <<< $VERSION
B="${ABC[1]}"
C="${ABC[2]}"
URL="https://pkgs.tailscale.com/stable/tailscale-armv8-${VERSION}-${B}00${C}7-dsm7.spk"

# Get package
wget --quiet --output-document new.pkg "${URL}"

# Install
synopkg install new.pkg

# Clean up
rm new.pkg
```

## Installation

- Copy the above script into a file on your Synology
- Log into the web console and, open Control Panel and under Services choose Task Scheduler
- Choose Create > Scheduled task > User-defined script
- Give your task a meaningful name under Task and set User to root
- Under the Schedule tab, choose how often you want updates to occur
- Under the Task Settings tab
    - If your Synology has email sending set up (see Control Panel > under System, Notifications), I recommend setting a notification for abnormal terminations (i.e., errors)
    - Under Run command in User-defined script enter a command like

```bash
bash /volume1/homes/USERNAME/update-tailscale.synology.sh
```

- Choose OK, then accept the warning with OK



