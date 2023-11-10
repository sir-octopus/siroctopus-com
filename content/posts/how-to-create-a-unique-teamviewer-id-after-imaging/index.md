+++
date = 2013-08-25T21:08:45Z
description = ""
draft = false
image = "teamviewer-icon200x200.jpg"
slug = "how-to-create-a-unique-teamviewer-id-after-imaging"
title = "How to create a unique TeamViewer ID after imaging"

+++

If you include TeamViewer as part of your system image or clone an existing computer with TeamViewer installed, the newly set-up computer will have the same TeamViewer ID as the source computer however each computer needs its own unique ID to work.

To fix, open regedit (Start > Run OR ```<Win>+<R>```, enter 'regedit' and hit ```<ENTER>``` or press 'ok') and delete two registry keys: ClientIC and ClientID which can be found at:

**64 bit Windows**

	HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\TeamViewer\VersionX

**32 bit Windows**

	HKEY_LOCAL_MACHINE\SOFTWARE\TeamViewer\VersionX

where 'X' is the version of TeamViewer

Note that this **will not** work on the source computer as the ID is calculated based on the hardware of the computer, therefore if this procedure is carried out on the source machine, it will just recreate the same ID.

**Source**

[http://eatrocks.com/?p=166](http://eatrocks.com/?p=166)



