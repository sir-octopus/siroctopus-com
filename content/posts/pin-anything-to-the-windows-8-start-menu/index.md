+++
date = 2013-09-01T22:28:26Z
description = ""
draft = false
image = "pin-a-folder-to-your-start-screen.png"
slug = "pin-anything-to-the-windows-8-start-menu"
title = "Pin anything to the Windows 8 start menu"

+++

This little hack allows you to pin anything to your Windows 8 (or RT) start menu.

1.  First we need to create a registry file; open Notepad
2.  Copy and paste the following into notepad

		Windows Registry Editor Version 5.00

		[HKEY_CLASSES_ROOT\*\shell\pintostartscreen]
		"MUIVerb"="@shell32.dll,-51201"
		"NeverDefault"=""
		"Description"="@shell32.dll,-51202"
		"MultiSelectModel"="Single"

		[HKEY_CLASSES_ROOT\*\shell\pintostartscreen\command]
		"DelegateExecute"="{470C0EBD-5D73-4d58-9CED-E91E22E23282}"

3.  Go File > Save As …

4.  Save as ```PinToStartGack.reg```

5.  Now, open the location you saved the ```.reg``` file and double click it. When prompted if you wish to continue click Yes

6.  You can now right click any file or folder and select 'Pin to Start'


How to undo the change

-------------------------

1.  Open regedit (```Win + R```)
2.  Go to ```HKEY_CLASSES_ROOT\*\shell\```
3.  Delete the ```pintostartscreen``` key


