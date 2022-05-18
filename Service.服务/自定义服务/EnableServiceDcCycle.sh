#!/bin/bash

power_cycle_enable () {

    cat << SHUTDOWN_EOF > /root/shutdown.sh
#!/bin/sh
/usr/bin/sleep 15
/usr/bin/ipmitool chassis power cycle
SHUTDOWN_EOF

    chmod +x /root/shutdown.sh

    cat << DC_EOF > /etc/systemd/system/powercycle.service
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
DC_EOF

    systemctl daemon-reload
    systemctl enable powercycle.service
    systemctl start powercycle.service
}



# disable power cycle service
power_cycle_stop () {
	if [ -f /etc/systemd/system/powercycle.service ]; then
		systemctl disable powercycle
		sed -i 's|ExecStop=.*|ExecStop=/bin/true|' /etc/systemd/system/powercycle.service
		systemctl daemon-reload
		systemctl reload powercycle
	fi
}

