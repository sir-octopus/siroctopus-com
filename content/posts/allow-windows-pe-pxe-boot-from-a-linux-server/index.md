+++
categories = ["Linux", "Windows"]
date = 2011-04-07T18:47:16Z
description = ""
draft = false
image = "linux-windows.jpg"
slug = "allow-windows-pe-pxe-boot-from-a-linux-server"
tags = ["Linux", "Windows"]
title = "Allow Windows PE PXE boot from a Linux server"

+++
There is a major problem in booting Windows via PXE from a Linux server: Linux's is case sensitive but Window's isn't. So text.txt, Text.txt, test.TXT and tExt.txt are four different files in Linux whereas under Windows there can only be one file or folder in a location with the characters T-E-X-T-.-T-X-T. Additionally windows uses '\\' whereas Linux uses '/'. To compensate for this, TFTPD can be configured to translate between the two.

To allow windows to boot from a Linux TFTP server:

1.  Create a file called _tftp.map_ in the folder you have specified as the TFTP root (the default is /tftpboot)
2.  Add the following lines to tftp.map using your favorite text editor:

		rg      \\      /
		r       bootmgr.exe     /Boot/bootmgr.exe
		r       /boot/          /Boot/

**References**

[http://www.msfn.org/board/topic/142879-need-help-troubleshooting-booting-winpe-30-with-pxe
](http://www.msfn.org/board/topic/142879-need-help-troubleshooting-booting-winpe-30-with-pxe)
