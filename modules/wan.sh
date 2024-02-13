#!/bin/bash

wan=$(curl -s https://api.myip.com | jq -r '.ip')
echo -e "%{F#0F0}  %{F-} $wan"