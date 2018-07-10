# Facility for collecting Shodan and Stretchoid IP addresses

In case you have VPN server or any form of publicly open service, I would recommend to filter as much bogus traffic as possible.

This is the example of reactive firewall policy that analyzes PTR records of IP addresses that end up on your stage 1 firewall address list.

## Linux box

Just save bash file to location of your liking and edit connection parameters and list variables to your liking. Add cron job to run daily (or any interval that fits your firewall settings).

## MikroTik box

You need to have firewall facility that matches the bash address list parameters. Other lists are optional, but I've left them in the `mikrotik-fw-example.rsc` file just to illustrate desired positioning of the firewall rules.

## mikrotik-blacklist-result-example.rsc

This is expected format of the address list. It is real example extracted from one of my MikroTik boxes.
