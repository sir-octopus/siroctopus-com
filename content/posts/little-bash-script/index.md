+++
date = 2018-09-24T22:35:03Z
description = ""
draft = false
image = "photo-1629654291663-b91ad427698f.jpg"
slug = "little-bash-script"
title = "Little bash script"
+++

A little bash script to help me remember how they work

```bash
#!/bin/bash

#functions
fruit()
{
        echo "fruit found"
}

#main
if \[ $# != 1 \]
then
        echo "No argument provided"
        exit 1
fi

if \[\[ $1 == 'pear' \]\]; then
        fruit
fi
```