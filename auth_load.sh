#!/bin/ksh

cat blacklist | pfctl -t blacklist -T add -f -

echo -n "Number of rules ="
pfctl -t blacklist -T show | wc -l
