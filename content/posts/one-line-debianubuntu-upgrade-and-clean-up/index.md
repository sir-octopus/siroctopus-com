+++
date = 2016-11-13T13:27:33Z
description = ""
draft = false
image = "photo-1640552435388-a54879e72b28.jpg"
slug = "one-line-debianubuntu-upgrade-and-clean-up"
title = "One line Debian or Ubuntu upgrade and clean up"

+++

This command:

```bash
apt-get update;apt-get upgrade -y;apt-get autoclean;apt-get autoremove;checkrestart
```

Will:

*   Gets the latest update information
*   Upgrades all packages (without prompting for confirmation)
*   Removes any unneeded install files
*   Removes any unnedded packages
*   Checks if any services or daemons need to be restarted

Note: the ```debian-goodies``` package needs to be installed to use the checkrestart command.

Linux allows running applications to be updated however they will not start to use the new files until restarted. The ```checkrestart``` command (from the [Debian package description](https://packages.debian.org/wheezy/debian-goodies)):

> Help to find and restart processes which are using old versions of upgraded files (such as libraries)