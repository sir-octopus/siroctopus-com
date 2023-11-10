+++
date = 2018-01-11T15:10:54Z
description = ""
draft = false
image = "photo-1622737133809-d95047b9e673.jpg"
slug = "remove-3d-objects-folder-from-windows-10"
title = "Remove 3D Objects folder from Windows 10"
+++

Run the following commands:

    reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f

    reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f

Alternatively in Regedit, open the following locations (only the first is needed for 32-bit systems) and delete the key

    {0DB7E03F-FC29-4DC6-9020-FF41B59E513A}

    HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace

    HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace

References:

[Remove 3D Objects folder under This PC in Windows 10, The Windows Club](https://www.thewindowsclub.com/remove-3d-objects-folder-winows-10)

[Delete Registry key from command line](https://www.windows-commandline.com/delete-registry-key-command-line/?ref=siroctopus.com)