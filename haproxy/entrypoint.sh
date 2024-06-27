#!/bin/sh

# Check and stop any running instances of Keepalived
pkill keepalived

haproxy -f /usr/local/etc/haproxy/haproxy.cfg &
keepalived --dont-fork --log-console
