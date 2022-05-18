pstree

这个命令可以以树形的方式列出进程。如下所示：

[hchen@RHELSVR5 ~]$ pstree
init-+-acpid
     |-auditd-+-python
     |        `-{auditd}
     |-automount---4*[{automount}]
     |-backup.sh---sleep
     |-dbus-daemon
     |-events/0
     |-events/1
     |-hald---hald-runner---hald-addon-acpi
     |-httpd---10*[httpd]
     |-irqbalance
     |-khelper
     |-klogd
     |-ksoftirqd/0
     |-ksoftirqd/1
     |-kthread-+-aio/0
     |         |-aio/1
     |         |-ata/0
     |         |-ata/1
     |         |-ata_aux
     |         |-cqueue/0
     |         |-cqueue/1
     |         |-kacpid
     |         |-kauditd
     |         |-kblockd/0
     |         |-kblockd/1
     |         |-kedac
     |         |-khubd
     |         |-6*[kjournald]
     |         |-kmirrord
     |         |-kpsmoused
     |         |-kseriod
     |         |-kswapd0
     |         |-2*[pdflush]
     |         |-scsi_eh_0
     |         |-scsi_eh_1
     |         |-xenbus
     |         `-xenwatch
     |-migration/0
     |-migration/1
     |-6*[mingetty]
     |-3*[multilog]
     |-mysqld_safe---mysqld---9*[{mysqld}]
     |-smartd
     |-sshd---sshd---sshd---bash---pstree
     |-svscanboot---svscan-+-3*[supervise---run]
     |                     |-supervise---qmail-send-+-qmail-clean
     |                     |                        |-qmail-lspawn
     |                     |                        `-qmail-rspawn
     |                     `-2*[supervise---tcpserver]
     |-syslogd
     |-udevd
     |-watchdog/0
     |-watchdog/1
     `-xinetd


