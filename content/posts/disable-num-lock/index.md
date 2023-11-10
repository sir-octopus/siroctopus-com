+++
categories = ["Windows"]
date = 2011-04-07T19:06:22Z
description = ""
draft = false
image = "aykut-eke-dR4yIGpkEy8-unsplash.jpg"
slug = "disable-num-lock"
tags = ["Windows"]
title = "Disable Num Lock"

+++

This registry edit controls whether Numlock is enabled or disabled when you login to Windows.

1.  Launch Registry Editor
    (Start > Search: _regedit_ > press \[Enter\])
2.  Go to the registry key:

    HKEY_USERS\.Default\Control Panel\Keyboard

3.  Change the value of InitialKeyboardIndicators:
    Set it to _0_ to set NumLock to OFF
    Set it to _2_ to set NumLock to ON

**References**

[_Enable/Disable Numlock at Login or Startup_](http://www.technipages.com/enabledisable-numlock-at-login-or-startup.html)