#!/bin/sh

## Reconfigure firewall(ufw).

## Initialize.
ufw reset
## http, https
#ufw allow from 192.168.2.1/24 to any port 80
#ufw allow from 192.168.2.1/24 to any port 443
ufw allow to any port 80
ufw allow to any port 443
## SSH
ufw allow from 192.168.2.1/24 to any port 22
## VNC
ufw allow from 192.168.2.1/24 to any port 5900
## Samba
ufw allow from 192.168.2.1/24 to any port 137
ufw allow from 192.168.2.1/24 to any port 138
ufw allow from 192.168.2.1/24 to any port 39
ufw allow from 192.168.2.1/24 to any port 445
## Homebridge
# ufw allow from 192.168.2.1/24 to any port 51826
## Read new config.
ufw enable
ufw reload
ufw status

