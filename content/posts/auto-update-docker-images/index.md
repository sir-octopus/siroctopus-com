+++
date = 2023-04-15T05:30:38Z
description = ""
draft = false
image = "computers-at-work-1969-whitecroft-designs.png"
slug = "auto-update-docker-images"
title = "Auto-update Docker images"

+++


A little script for updating a Docker image, using [Uptime Kuma](https://github.com/louislam/uptime-kuma) as an example.

```bash
#!/bin/bash
set -e

docker pull louislam/uptime-kuma:1
docker stop kuma
docker rm kuma
docker run -d --restart=always -p 8088:3001 -v /home/docker/kuma:/app/data --name kuma louislam/uptime-kuma:1
```



