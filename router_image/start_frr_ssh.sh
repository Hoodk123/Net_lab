#!/bin/sh

# Ensure FRR configuration directory and main config file exist
mkdir -p /etc/frr
touch /etc/frr/frr.conf
chown frr:frr /etc/frr/frr.conf # Set ownership for FRR user/group
chmod 640 /etc/frr/frr.conf   # Set permissions

# Start OpenSSH server in the background
/usr/sbin/sshd -D &

# Start FRR's core daemon (zebra) directly
# -f specifies the config file
# -d runs in daemon mode (background)
# -u and -g specify the user and group FRR daemons should run as
/usr/lib/frr/zebra -f /etc/frr/frr.conf -d -u frr -g frr

# Add other FRR daemons you might need to start explicitly here
# For example, if you plan to use BGP:
# /usr/lib/frr/bgpd -f /etc/frr/frr.conf -d -u frr -g frr

# Keep the container running indefinitely by tailing /dev/null
tail -f /dev/null