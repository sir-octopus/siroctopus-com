+++
date = 2016-10-29T14:55:57Z
description = ""
draft = false
image = "https://images.unsplash.com/flagged/photo-1562599838-8cc871c241a5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTc3M3wwfDF8c2VhcmNofDQ5fHxsaW51eHxlbnwwfHx8fDE2NDcyMjg0Nzc&ixlib=rb-1.2.1&q=80&w=2000"
slug = "debian-and-ubuntu-webmin-one-line-install"
title = "Debian and Ubuntu Webmin one line install"

+++

```bash
sudo su; echo "deb http://download.webmin.com/download/repository sarge contrib" >> /etc/apt/sources.list && cd /root && wget http://www.webmin.com/jcameron-key.asc && apt-key add jcameron-key.asc && apt update && apt install webmin -y
```