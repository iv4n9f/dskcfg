#!/bin/bash

wan=$(curl -s https://ipapi.con/ip)
echo -e "%{F#0F0}  %{F-} $wan"