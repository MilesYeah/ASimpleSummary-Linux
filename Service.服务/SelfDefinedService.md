
# Service




```bash
cat << RESET_SHUTDOWN_EOF > /root/shutdown.sh
#!/bin/sh
/usr/bin/sleep 15
/usr/bin/ipmitool chassis power reset
RESET_SHUTDOWN_EOF

chmod +x /root/shutdown.sh

cat << RESET_EOF > /etc/systemd/system/powercycle.service
[Unit]
Description=Power cycle at shutdown
Requires=network.target
DefaultDependencies=no
Before=shutdown.target halt.target

[Service]
Type=oneshot
RemainAfterExit=true
ExecStart=/bin/true
ExecStop=/root/shutdown.sh

[Install]
WantedBy=multi-user.target
RESET_EOF

systemctl daemon-reload
systemctl enable powercycle.service
systemctl start powercycle.service
```


