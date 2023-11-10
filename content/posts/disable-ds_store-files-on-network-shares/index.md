+++
categories = ["MacOS X"]
date = 2011-04-06T18:56:12Z
description = ""
draft = false
image = "photo-1493020258366-be3ead1b3027.jpg"
slug = "disable-ds_store-files-on-network-shares"
tags = ["MacOS X"]
title = "Disable .DS_Store files on network shares"

+++

Apple macOS automatically creates a hidden file called ```_.DS_store``` on any file system it encounters, including SMB (Windows) networks, similar to Windows' ```desktop.ini``` file.

To prevent its creation on network shares, follow these steps on the Apple computer:

1.  Open _Terminal_ (/Applications/Utilities/Terminal or click the magnifying glass in the top right of the screen and type _Terminal_)
2.  Execute the following command

		defaults write com.apple.desktopservices DSDontWriteNetworkStores true

3.  Either restart the computer or log out and back in.

To disable ```_.DS_store``` creation on network drives for all users see [Apple's article](http://support.apple.com/kb/HT1629).

**References**

[Apple | _Mac OS X v10.4 and later: How to prevent .DS\_Store file creation over network connections_](http://support.apple.com/kb/HT1629)

[Wikipedia | _.DS\_Store_](http://en.wikipedia.org/wiki/.DS_Store)