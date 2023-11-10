+++
categories = ["MacOS X"]
date = 2011-04-08T12:17:57Z
description = ""
draft = false
image = "hidden-files.png"
slug = "how-to-show-hidden-files-in-finder"
tags = ["MacOS X"]
title = "How to show hidden files in Finder"

+++

Running MacOS X and want to see every file?

To see hidden files in Finder, follow these steps:

Open _Terminal_ (/Applications/Utilities/Terminal or click the magnifine glass in the top right of the screen and type _Terminal_)

Execute the following command:

```bash
defaults write com.apple.Finder AppleShowAllFiles YES
```

Either restart the computer or log out and back in