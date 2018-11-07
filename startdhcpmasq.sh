#!/bin/bash
dnsmasq -d --bind-interfaces --listen-address=10.3.0.1 --dhcp-range=10.3.0.2,10.3.0.200,12h --dhcp-option=option:router,10.3.0.1 --dhcp-option=option:dns-server,10.3.0.1 --log-dhcp
