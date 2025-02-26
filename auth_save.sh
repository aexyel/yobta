#!/bin/ksh

pfctl -t blacklist -T expire 86400
pfctl -t blacklist -T show > blacklist
