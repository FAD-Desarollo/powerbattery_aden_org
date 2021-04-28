#!/bin/bash

echo *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
echo *  CLOUDFLARE DEVELOPER-MODE ON   *
echo *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

curl --location --request PATCH 'https://api.cloudflare.com/client/v4/zones/46fa220853a072862e11fe341c053a9c/settings/development_mode' \
--header 'Authorization: Bearer '"$CF_AUTH"'' \
--header 'Content-Type: application/json' \
--data-raw '{
    "value":"on"
}'
