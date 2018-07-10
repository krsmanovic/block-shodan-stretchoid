# Reactive facility for collecting Shodan and Stretchoid IP addresses

In case you have VPN server or any kind of publicly open service, I would recommend to filter as much bogus traffic as possible. I would argue that documented and undocumented service scanners fit to that category.

This is the example of reactive firewall policy that analyzes PTR records of IP addresses that end up on your stage 1 firewall address list. You can expand this to protect services behind your MikroTik router by adjusting firewall rules.

## Linux box

- Create ssh key pair (Linux <=> MikroTik)
- Save bash file and edit connection parameters and list variables to your liking
- Add cron job to run daily (or any interval that fits your firewall settings)

## MikroTik box

- Create new script user and check if ssh keys work
- Check if your firewall facility matches the bash address list parameters

Other lists are optional, but I've left them in the `mikrotik-fw-example.rsc` file just to illustrate desired positioning of the firewall rules.

## mikrotik-blacklist-result-example.rsc

This is real example extracted from one of my MikroTik boxes.

