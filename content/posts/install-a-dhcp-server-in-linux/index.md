+++
categories = ["Linux"]
date = 2011-04-07T18:35:56Z
description = ""
draft = false
image = "photo-1640552435845-d65c23b75934.jpg"
slug = "install-a-dhcp-server-in-linux"
tags = ["Linux"]
title = "Install a DHCP server in Linux"

+++

To set up a DHCP server, start by download the latest version at the [Internet Software Consortium](http://www.isc.org/software/dhcp/); it is important that the latest version is used as it is the most secure and will be running on your server.

1.  Download the DHCP server (the current version can be found [here](http://www.isc.org/software/dhcp/)):

		wget http://ftp.isc.org/isc/dhcp/dhcp-4.2.1-P1.tar.gz

2.  Untar the archive

		tar xzf ./dhcp-4.2.1-P1.tar.gz

3.  Move to the new directory containing the untared files:

		cd dhcp-4.2.1-P1

4.  Execute these commands to configure and make the source into executable binaries:

		./configure
		make

5.  All going well, switch to root and install the server:

		sudo make install

	You will be prompted for the root password and, if you entered it correctly, the new DHCP server will be installed
     
6.  Configure the server; start by copying the default configuration file from the installation directory into /etc:

		sudo cp server/dhcp.conf /etc

7.  Now edit the configuration file (I use nano however any text editor, such as vi, can be used):

		nano /etc/dhcp.conf

8.  My DHCP configuration is very simple, the entire file is:

		subnet 10.0.0.0 netmask 255.0.0.0 {
			next-server 10.0.0.1;
			option domain-name-servers 10.0.0.2; # This is the DNS server, usually your modem's IP
			option domain-name "home";           # DNS name, this line is optional
			option broadcast-address 10.0.0.255; # Useful for multicasting, e.g. VLC
			option subnet-mask 255.0.0.0;        # This is the default for 10.x.x.x networks
			option routers 10.0.0.2;             # This is your gateway, again usually your modem's IP
			range 10.0.0.50 10.0.0.100;          # IP range. The first computer to ask for an IP will
																						# be 10.0.0.50 the last will be 10.0.0.100 after which
																						# all IP addresses will be exausted (i.e. max 50 IPs)
			}

9.  You can perminantly assign an IP address to a computer with the following additions:

		host COMPUTERNAME {
						hardware ethernet 00:00:00:00:00:00;  # Replace with the machine's MAC address
						fixed-address 10.0.0.10;
		}


**References**

[_How do I install DHCP on my Linux Server?_](http://www.askdavetaylor.com/how_do_i_install_dhcp_on_my_linux_server.html)

