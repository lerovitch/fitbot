#!/bin/bash

target_hour=0
target_minute=00
target_second=0
current_hour=$(TZ="Europe/Madrid" date +%-H)
current_minute=$(date +%-M)
current_second=$(date +%-S)
target_time_in_seconds=$((target_hour * 3600 + target_minute * 60 + target_second))
current_time_in_seconds=$((current_hour * 3600 + current_minute * 60 + current_second))
echo "current_hour: $current_hour $current_minute $current_second"
echo "target_time_in_seconds: $target_time_in_seconds"
echo "current_time_in_seconds: $current_time_in_seconds"

if [ $current_time_in_seconds -ge $target_time_in_seconds ]; then
sleep_duration=$((86400 + target_time_in_seconds - current_time_in_seconds))
else
sleep_duration=$((target_time_in_seconds - current_time_in_seconds))
fi
echo "Sleeping for $sleep_duration seconds until the target time"
sleep $sleep_duration