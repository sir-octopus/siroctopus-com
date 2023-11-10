+++
date = 2013-08-25T21:46:34Z
description = ""
draft = false
image = "photo-1573162915884-74c45ba4cfe6.jpg"
slug = "how-to-install-net-3-5-on-windows-8"
title = "How to install .Net 3.5 on Windows 8"

+++

When installing applications on Windows 8 you may be prompted to install the .Net framework. Windows will helpfully offer to download and install it for you, how nice…until it fails. You may be asked to reboot your machine or check it is connected to the Internet but nothing helps.

If you have access to your orginal installation media (which you may not if it was preinstalled on your machine), you can install .Net 3.5 directly.

1.  Open a Command Prompt with administrative previlages (right-click Command Prompt and choose 'Run as administrator')
2.  Where 'D:\\' is the location of your mounted Windows 8 installation media run the command

```cmd
DISM /Online /Enable-Feature /FeatureName:NetFx3 /All /LimitAccess /Source:d:\sources\sxs
```

Notes: ```/All``` (enable all parent features of .Net Framework 3.5), ```/LimitAccess``` (prevent DISM from using Windows Update) and ```/Sources``` (location of the installation files)

**Source and further reading**

[http://msdn.microsoft.com/en-us/library/hh506443.aspx](http://msdn.microsoft.com/en-us/library/hh506443.aspx)

