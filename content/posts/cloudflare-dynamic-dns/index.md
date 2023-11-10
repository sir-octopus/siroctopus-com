+++
date = 2022-08-20T09:31:03Z
description = ""
draft = false
image = "tumblr_oq2qxoqLNh1qiufwso1_1280-1.jpg"
slug = "cloudflare-dynamic-dns"
title = "CloudFlare dynamic DNS"

+++


Here's my little bash script for updating a CloudFlare subdomain with my current IP. Make sure to create ```/var/tmp/current_ip.txt``` first with ```echo "1.1.1.1" > /var/tmp/current_ip.txt```

```bash
NEW_IP=`curl -sf ident.me`
CURRENT_IP=`cat /var/tmp/current_ip.txt`

zone_id=<ENTER ZONE ID>
rec_id=<ENTER RECORD ID>
email=<ENTER ACCOUNT EMAIL>
key=<ENTER API KEY>
type=A
hostname=<ENTER FQDN e.g. sub.domain.co>
content="$NEW_IP"
ttl=60
proxied=false

if [ "$NEW_IP" = "$CURRENT_IP" ]
then
  echo "No Change in IP Adddress" > /dev/null
else
  curl -X PUT "https://api.cloudflare.com/client/v4/zones/$zone_id/dns_records/$rec_id" \
  -H "X-Auth-Email: $email" \
  -H "Authorization: Bearer $key" \
  -H "Content-Type: application/json" \
  --data "{\"id\":\"$rec_id\",\"type\":\"$type\",\"name\":\"$hostname\",\"content\":\"$content\",\"ttl\":$ttl,\"proxied\":$proxied}" \
  > /dev/null
  echo $NEW_IP > /var/tmp/current_ip.txt
fi
```



