# yobta
Yet One Banning Tool Available

## Tune PF

Add lines to pf.conf(5)
```
table <blacklist> persist
block in quick from <blacklist>
```
and run
```
pfctl -f pf.conf
```

## Use
* auth_ban.sh - grep authlog for intrusion attempts and ban source IPs
* auth_save.sh - keep state
* auth_load.sh - load state
* "excludes" - list your IPs to not ban
