+++
date = 2023-04-15T04:42:10Z
description = ""
draft = false
image = "tumblr_osq56w017O1rgxuloo1_1280.jpg"
slug = "auto-update-pi-hole"
title = "Auto-update Pi-Hole"

+++

**Note: Pi-Hole _do not_ recommend auto updating, as new versions may break existing installations.**

```bash
crontab -e

# Add this line to update at 6 AM daily
* 6 * * * /usr/local/bin/pihole -up

# Save and quit
```