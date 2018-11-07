#!/bin/bash
iptables --flush
./killall.sh 
./startwsproxytls.sh & 
sleep 2; 
./startdhcpmasq.sh &  
sleep 2
tcpdump -i tap0 -vvv & 
./bridge.sh
./iptables.sh
