+++
categories = ["Firefox"]
date = 2011-04-06T20:32:39Z
description = ""
draft = true
slug = "how-to-disable-firefoxs-built-in-antivirus-scanning"
tags = ["Firefox"]
title = "How to disable FireFox's built in antivirus scanning"

+++

In Windows Firefox automatically uses the local virus scanner, if installed, to scan any file it downloads. While this may provide extra safety, the real-time scanning functions of modern antivirus programs render this additional scanning unnecessary and causes delays, false positives and even freezes when downloading files &ndash; especially large ones.

To disable Firefox&#39;s automatic virus scanning perform the following steps:

* In the address bar type ```about:config```
* In the filter bar (CTRL+F) type ```browser.download.manager.scanWhenDone```
* Double click this entry to toggle it from the default ```true``` to ```false```
* Close all open Firefox windows and restart to apply the change