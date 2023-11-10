+++
categories = ["Windows"]
date = 2011-04-08T12:31:09Z
description = ""
draft = false
image = "https://images.unsplash.com/photo-1605170439002-90845e8c0137?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTc3M3wwfDF8c2VhcmNofDF8fGJvbmpvdXJ8ZW58MHx8fHwxNjQ3MjI5ODQ5&ixlib=rb-1.2.1&q=80&w=2000"
slug = "why-and-how-to-disable-bonjour"
tags = ["Windows"]
title = "Why and how to disable Bonjour"

+++
Bonjour is Apple's auto-network discovery protocol that, among other things, allows iTunes to discover other iTunes libraries on the same network and for devices such as the iPod/Phone/Pad and Apple TV to discover each other and share their libraries or remote control each other. However, if you don't use any of these functions it is yet another service that:

*   Contributes to your bootup time
*   Consumes RAM and CPU resources
*   Increases the attackable surface area of your computer, posing a potential security risk

Below are two methods to disable it:

**Method 1:** Remove Bonjour

1.  Open _Command Prompt_ (Under _Accessories_ in the Start Menu)
2.  Enter and execute the following command:

    "C:\\Program Files\\Bonjour\\mDNSResponder.exe" -remove
    move "C:\\Program Files\\Bonjour\\msdnsNSP.dll" "C:\\Program Files\\Bonjour\\msdnsNSP.old"

    **Note** under 64 bit versions of windows this will be:

    "C:\\Program Files (x86)\\Bonjour\\mDNSResponder.exe" -remove
    move "C:\\Program Files (x86)\\Bonjour\\msdnsNSP.dll" "C:\\Program Files (x86)\\Bonjour\\msdnsNSP.old"

3.  Reboot
4.  Delete the Bonjour folder

**Method 2:** Disable the Bonjour service

1.  Open the _Start Menu_, right-click _Computer_ and select _Manage_
2.  In _Computer Management_ select _Services and Applications_ and then select _Services_
3.  Right-click _Bonjour Service_ and select _Properties_
4.  Change _Startup type_ from _Automatic_ to _Disabled_
5.  If the _Service status_ is _Started_ click the _Stop_ button
6.  Click _OK_