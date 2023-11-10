+++
categories = ["Windows"]
date = 2011-04-07T18:03:59Z
description = ""
draft = false
image = "photo-1563453392212-326f5e854473.jpg"
slug = "clear-the-offline-files-cache"
tags = ["Windows"]
title = "Clear the Offline Files cache"

+++

Over time small problems tend to creep into any system that depends on synchronising data in multiple sources and Windows' Offline Files is no exception. It may also be that Windows decided, in its infinite wisdom, that it should make a network share available offline or more simply you no longer want any folders available offline and are having difficulty to clear the cache.

Follow these steps to reset Offline Files; this will clear the cache:

**Note** make sure that files are synchronized before you add this registry entry. Otherwise, unsynchronised changes will be lost.

1.  Click _Start_, type _regedit_ in the _Start Search_ box and then press \[Enter\]
    If you are prompted for an administrator password or confirmation, type the password, or click _Continue_
2.  Locate the following registry subkey and then right-click it:

		HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\CSC

3.  Point to New, and then click Key.
4.  Type Parameters in the box.
5.  Right-click Parameters, point to New, and then click DWORD (32-bit) Value.
6.  Type ```FormatDatabase```, and then press ENTER.
7.  Right-click FormatDatabase, and then click Modify.
8.  In the Value data box, type 1, and then click OK.
9.  Exit Registry Editor, and then restart the computer.

**References**

[http://support.microsoft.com/kb/942974/](http://support.microsoft.com/kb/942974/)