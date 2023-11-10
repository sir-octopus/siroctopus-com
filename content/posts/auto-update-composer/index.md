+++
date = 2023-04-15T05:16:09Z
description = ""
draft = false
image = "vintage-computer-ads-16.webp"
slug = "auto-update-composer"
title = "Auto-update Composer"

+++


Super simple:

```bash
crontab -e

# Update Composer at 2 AM daily
* 2 * * * /usr/bin/composer self-update
```



