#!/bin/bash

cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
cpu_temp=$(sensors | grep "Tdie" | awk '{print $2}' | cut -c 2-)
ram_usage=$(free -m | awk '/Mem/ { printf "%.2f", $3/$2 * 100 }')
swap_usage=$(free -m | awk '/Swap/ { printf "%.2f", $3/$2 * 100 }')

root_usage=$(df -h / | awk '/\// {print $(NF-1)}')
home_usage=$(df -h /home | awk '/home/ {print $(NF-1)}')
external_usage=$(df -h /mnt | awk '/mnt {print $(NF-1)}')

# Output

echo -e "%{F#0F0} 󰻠 %{F-} $cpu %{F#0F0} 󰔄 %{F-} $temp %{F#0F0}  %{F-} $ram  %{F#0F0} 󰯍 %{F-} $swap %{F#0F0}  %{F-} $root_usage %{F#0F0} 󱂵 %{F-} $home_usage %{F#0F0} 󰡰 %{F-} $external_usage"
