+++
categories = ["Windows"]
date = 2020-07-25T19:33:53Z
description = ""
draft = false
image = "edgerouter-x-6861.jpg"
slug = "edgerouter-x-vpn-windows-10-fix"
tags = ["Windows"]
title = "EdgeRouter X VPN Windows 10 Fix"

+++
I had issues connecting to my EdgeRouter X L2TP/IPSec VPN. My Android and iOS devices could connect fine but my Windows 10 laptop wouldn't. Thanks to chewychewbacca for these instructions:

1.  Log on to the Windows client computer as a user who is a member of the Administrators group.
2.  Click **Start**, point to **All Programs**, click **Accessories**, click **Run**, type regedit, and then click **OK**. If the **User Account Control** dialog box is displayed on the screen and prompts you to elevate your administrator token, click **Continue**.
3.  Locate and then click the following registry subkey:**HKEY\_LOCAL\_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\PolicyAgent**
4.  On the **Edit** menu, point to **New**, and then click **DWORD (32-bit) Value**.
5.  Type **AssumeUDPEncapsulationContextOnSendRule**, and then press ENTER.
6.  Right-click **AssumeUDPEncapsulationContextOnSendRule**, and then click **Modify**.
7.  In the **Value Data** box, type ‘2’
8.  Click **OK**, and then exit Registry Editor.
9.  Restart the computer.

Reference [UniFi Forum post](https://community.ui.com/questions/Edge-Router-L2TP-IPsec-VPN-server-Windows-10-cannot-connect-Android-can-/23c0fc48-b505-4a2a-a2b3-21a2c1e6c811#answer/e91774e1-5835-4f17-91f6-8c7bca2cdea2)