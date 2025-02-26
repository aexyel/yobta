#!/bin/ksh

## pf.conf(5) add:
#table <blacklist> persist
#block in quick from <blacklist>
## pfctl -f pf.conf

##_date=$(date "+%b %d %H:")
_date=$(date "+%b %d ")
##_date=$(date "+%b 25 ")

fgrep "$_date" /var/log/authlog | fgrep -hvif excludes > _current

( \
cat _current | fgrep " Failed " | sed -n "s/^.* from \(.*\) port .*/\1/p" ; \
cat _current | fgrep " Unable " | sed -n "s/^.* with \(.*\) port .*/\1/p" ; \
) | sort | uniq -c | awk '{if($1>3) print $2}' | pfctl -t blacklist -T add -f -

pfctl -t blacklist -T expire 86400
pfctl -t blacklist -T delete -f excludes
pfctl -t blacklist -T show > blacklist

echo -n "Number of rules ="
cat blacklist | wc -l
