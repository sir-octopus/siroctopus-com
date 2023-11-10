+++
date = 2018-02-08T14:55:07Z
description = ""
draft = false
image = "signal-2023-08-16-190843.jpeg"
slug = "permanently-disable-firefox-and-chrome-web-notifications"
title = "Permanently disable Firefox and Chrome web notifications"
+++

Are you horrified that _any_ website would even ask to send notifications to your desktop? Would you like this pop-up to never appear again? Then:

1.  In Firefox, visit the URL [about:config](about:config) and if promted, say you do want to void your warranty
2.  Filter using **webno**
3.  Double click **dom.webnotifications.enabled** (changing the value from the default _true_ to _false_)

_Thanks to [this guy](https://support.mozilla.org/en-US/questions/1140700#answer-921090) for the Firefox info._

1.  In Chrome, in the top-right, click the 3 vertical dots (the More menu) and select Settings
2.  At the top, search **notifications**
3.  Expand Content settings, then Notifications
4.  Toggle _Ask before sending_ to _Blocked_

_Chrome info from the [Google Support article](https://support.google.com/chrome/answer/3220216?co=GENIE.Platform%3DDesktop&hl=en)._