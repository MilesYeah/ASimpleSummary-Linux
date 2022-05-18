# at.单次计划任务

```sh
[root@RHEL7CCIE ~]# ls
anaconda-ks.cfg  Desktop  Documents  Downloads  initial-setup-ks.cfg  Music  Pictures  Public  Templates  Videos
[root@RHEL7CCIE ~]# date
Tue Sep 22 18:26:53 CST 2020
[root@RHEL7CCIE ~]# at 18:28
at> touch haha
at> <EOT>
job 4 at Tue Sep 22 18:28:00 2020
[root@RHEL7CCIE ~]# at -l
4       Tue Sep 22 18:28:00 2020 a root
[root@RHEL7CCIE ~]# ls
anaconda-ks.cfg  Desktop  Documents  Downloads  haha  initial-setup-ks.cfg  Music  Pictures  Public  Templates  Videos
[root@RHEL7CCIE ~]# at -l
[root@RHEL7CCIE ~]#
```

```sh
[root@RHEL7CCIE ~]# at -l
[root@RHEL7CCIE ~]#
[root@RHEL7CCIE ~]# at 20:00
at> rm -f haha
at> <EOT>
job 5 at Tue Sep 22 20:00:00 2020
[root@RHEL7CCIE ~]# at -l
5       Tue Sep 22 20:00:00 2020 a root
[root@RHEL7CCIE ~]# atrm 5
[root@RHEL7CCIE ~]# at -l
[root@RHEL7CCIE ~]#
```

