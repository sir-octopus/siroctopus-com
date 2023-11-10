+++
date = 2019-10-04T16:07:14Z
description = ""
draft = false
image = "blog-internet-explorer-is-saying-goodbye.jpg"
slug = "redirect-all-ie-versions-in-apache-2-4"
title = "Redirect all IE versions in Apache 2.4"
+++

The following Apache conf (tested in 2.4.x) will redirect all versions of IE to the specified page. It can be used in .htaccess or in Apache’s conf and requires mod\_rewrite is enabled.

(To notify rather than redirect, see [browser-update.org](http://browser-update.org/). If you don’t want to host or maintain a notification page, try [https://bestvpn.org/outdatedbrowser](https://bestvpn.org/outdatedbrowser) or [http://browser-update.org/update-browser.html](http://browser-update.org/update-browser.html); note that both are ad supported.)

```apache
RewriteEngine On
RewriteCond %{HTTP_USER_AGENT} ^.*Trident.*$ [NC]
RewriteCond %{REQUEST_URI} !^/ie-unsupported.html.*
RewriteRule .* /ie-unsupported.html [L,R=302]
```

What are we doing here? Line 1 turns the rewrite engine on so the subsequent rules will be enforced.

```apache
RewriteCond %{HTTP_USER_AGENT} ^.*Trident.*$ [NC]
```

Line 2 looks for the string ‘Trident’ in the requesting browser’s user agent. Trident is the rendering engine IE has used since version 4, so this rule will catch all versions of ie from 4-11 (the final version).

```apache
RewriteCond %{REQUEST_URI} !^/ie-unsupported.html.*
```

Line 3 looks for a file path that **does not** start with ‘/ie-unsupported.html. This ensures that all URLs are redirected except the page we are redirecting to. Without this rule, IE would be thrown into an infinite loop, redirecting continuously to the advisory page.

If the conditions on line 2 (browser is IE) **and** line 3 (not already on the page we are redirecting to) then line 4 will enact the rule: redirect the browser to ‘/ie-unsupported.html’

```apache
RewriteRule .* /ie-unsupported.html [L,R=302]
```

**Note**: if you name your advisory page something other than ‘ie-unsupported.html’ make sure to replace it on both lines 3 and 4, or this could cause an infinite redirect loop.



