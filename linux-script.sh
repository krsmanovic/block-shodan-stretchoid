#!/bin/bash

# Created for MikroTik routers with existing firewall facility.
# Aim is to form permanent block list for scanning farms that
# have known PTR records.
#                                               Che, July 2018

# Create ssh key pair for your router and use
# those credentials for logging in
router_ssh="ssh script_user@192.168.0.1 -p 22"

# Stage 1 dynamic address list on the remote MikroTik
router_stage1="fw_stage1"

# Blacklist address list on the remote MikroTik
router_blacklist="fw_blacklist"

# Temporary file we are using to store stage 1 access list
file="stage1"

> "$file"

$router_ssh "/ip firewall address-list print where list=$router_stage1" | awk 'NR > 2 {print $4}' >> "$file"

while read -r line || [[ "$line" ]]
do

  ip=$(echo $line | tr -d '\r')
  domain=$(dig -x "$ip" +short 2>&- | sed 's/.$//')

  if [ ! -z "$domain" ]
  then
    if echo "$domain" | egrep -i "(^|[^a-zA-Z])(shodan|stretchoid)($|[^a-zA-Z])" > /dev/null
    then
        $router_ssh -n "do { /ip firewall address-list add list=$router_blacklist comment=$domain address=$ip } on-error={}"
        echo "Host $ip with PTR $domain was added to the blacklist on the remote device."
    fi
  fi
done < "$file"
