#!/bin/sh

for i in " $(hostname -f)" " $(hostname -d)" " $(hostname -s)";do  ping -c1 $i;done
host $(hostname -f)
ping cdn.redhat.com
traceroute cdn.redhat.com
curl -Sv cdn.redhat.com
ss -ltn  | egrep  ":80 |:8080 |:5671 |:443 |:8140 |:9090 "
df -k /var/lib | awk '/[[:digit:]]+%/ { if ($3 > 20971520) { print "Space OK:", $3, "Kilobytes" } else { print $3, "Kilobytes is insufficient for a channel download"; } }'
df -k /var/lib | awk '/[[:digit:]]+%/ { if ($4 > 20971520) { print "Space OK:", $4, "Kilobytes" } else { print $4, "Kilobytes is insufficient for a channel download"; } }'
hammer ping
foreman-maintain service status
katello-service status
puppet agent -t
curl -k https://localhost:8443/candlepin/status
rpm -qa | grep candlepin
openssl s_client -connect $(hostname -f):443 -state | grep -i "handshake"
openssl s_client -connect $(hostname -f):443 -tls1 | egrep -i "handshake|verify"
openssl s_client -connect $(hostname -f):443  -ssl3 | egrep -i "handshake|verify"
hammer task list --search "state=paused"
hammer task resume --search "state=paused"
foreman-maintain health check
