#!/bin/bash

# Get all environment variables
env_vars=`printenv`

# Iterate over each line of env_vars
while read line; do
    # Split the line into a key and value
    key=`echo $line | awk -F= '{print $1}'`
    value=`echo $line | awk -F= '{print $2}'`

    # Check if the value is present in the file
    if grep -q "$key" /etc/pypicloud/config.ini; then
        # Replace the value in the file
        sed -i "s/$key/$value/g" /etc/pypicloud/config.ini
    fi
done <<< "$env_vars"
uwsgi --die-on-term /etc/pypicloud/config.ini