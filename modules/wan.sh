#!/bin/bash

interface=$1

if [[ -n $interface ]]; then
  ip=$(ip -4 addr show dev $interface | awk '/inet /{print $2}')
  if [[ -n $ip ]]; then
    echo -e "%{F#0F0} 󰲝 %{F-}${interface^^} $ip"
  else
    echo -e "%{F#F00} 󰲝 %{F-}${interface^^} $ip"
  fi
  echo -e "%{F#F00} 󰲝 %{F-}${interface^^} $ip"
fi


