#!/bin/bash
echo 1 > /proc/sys/net/ipv4/ip_forward

iptables --flush
echo Enter Interface to bridge
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A FORWARD -i eth0 -o tap0 -m state --state RELATED,ESTABLISHED -j ACCEPT
#iptables -t nat -A POSTROUTING -o lo -j MASQUERADE
#iptables -A FORWARD -i lo -o tap0 -m state --state RELATED,ESTABLISHED -j ACCEPT

#Drop any packages destined for the host machine or any other docker containers
#NOTE: double check that this matches your docker bridge subnet
#iptables -A FORWARD -i tap0 -o eth0 -d 172.17.0.0/16 -j DROP
iptables -A FORWARD -i tap0 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth0 -o tap0 -j ACCEPT
#iptables -A FORWARD -i tap0 -o lo -j ACCEPT
#iptables -A FORWARD -i lo -o tap0 -j ACCEPT
iptables-save
