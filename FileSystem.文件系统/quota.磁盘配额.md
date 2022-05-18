# quota.磁盘配额

可以使用quota命令进行磁盘容量配额管理，从而限制用户的硬盘可用容量或所能创建的最大文件个数。quota命令还有软限制和硬限制的功能。
* 软限制：当达到软限制时会提示用户，但仍允许用户在限定的额度内继续使用。
* 硬限制：当达到硬限制时会提示用户，且强制终止用户的操作。

HEL 7系统中已经安装了quota磁盘容量配额服务程序包，但存储设备却默认没有开启对quota的支持，此时需要手动编辑配置文件，让RHEL 7系统中的/boot目录能够支持quota磁盘配额技术。另外，对于学习过早期的Linux系统，或者具有RHEL 6系统使用经验的读者来说，这里需要特别注意。早期的Linux系统要想让硬盘设备支持quota磁盘容量配额服务，使用的是usrquota参数，而RHEL 7系统使用的则是uquota参数。在重启系统后使用mount命令查看，即可发现/boot目录已经支持quota磁盘配额技术了


```sh
[root@RHEL7CCIE ~]# vim /etc/fstab
[root@RHEL7CCIE ~]# cat /etc/fstab

#
# /etc/fstab
# Created by anaconda on Tue Jul  7 08:12:31 2020
#
# Accessible filesystems, by reference, are maintained under '/dev/disk'
# See man pages fstab(5), findfs(8), mount(8) and/or blkid(8) for more info
#
/dev/mapper/rhel-root   /                       xfs     defaults        1 1
UUID=c718c5c1-9c44-48c3-9fb6-8d57ab92899f /boot                   xfs     defaults,uquota        1 2
/dev/mapper/rhel-swap   swap                    swap    defaults        0 0
/dev/sdb1 /media/new_drive xfs defaults 0 0
/dev/sdb5 swap swap defaults 0 0

[root@RHEL7CCIE ~]# init 6
```
```sh
[root@RHEL7CCIE ~]# mount | grep boot
/dev/sda1 on /boot type xfs (rw,relatime,seclabel,attr2,inode64,usrquota)
[root@RHEL7CCIE ~]#
```




## xfs_quota

`xfs_quota` 命令是一个专门针对XFS文件系统来管理quota磁盘容量配额服务而设计的命令，格式为“xfs_quota [参数] 配额 文件系统”。其中，
* -c 参数用于以参数的形式设置要执行的命令；非交互方式
* -x 参数是专家模式，让运维人员能够对quota服务进行更多复杂的配置。

具体的限额控制包括：
* 硬盘使用量的软限制和硬限制分别为3MB和6MB；
* 创建文件数量的软限制和硬限制分别为3个和6个。


i 就是对 inode 的限制，限制文件的个数； 
b 是对 block 的限制，限制文件的大小。
soft 是软限制，达到条件时，系统并不会采取任何的限制动作，但是会在日志文件中生成条警告信息 /var/log/message ；
hard 是达到条件后直接限制行动。

* bsoft: 
* bhard: 
* isoft: 对个数的软限制
* ihard: 

```sh
[root@RHEL7CCIE ~]# chmod -Rf 777 /media/new_drive/
[root@RHEL7CCIE ~]# cd /media/new_drive/
[root@RHEL7CCIE new_drive]#
[root@RHEL7CCIE media]# xfs_quota -x -c "limit  bsoft=3m bhard=5m isoft=3 ihard=6 zhangsan" /media/new_drive/
[root@RHEL7CCIE media]# xfs_quota -x -c report /media/new_drive/
User quota on /media/new_drive (/dev/sdb1)
                               Blocks
User ID          Used       Soft       Hard    Warn/Grace
---------- --------------------------------------------------
root                0          0          0     00 [--------]
zhangsan            0       3072       5120     00 [--------]

[root@RHEL7CCIE media]#
```

```sh
[zhangsan@RHEL7CCIE new_drive]$ touch a b c d e f
[zhangsan@RHEL7CCIE new_drive]$ touch aa
touch: cannot touch ‘aa’: Disk quota exceeded
[zhangsan@RHEL7CCIE new_drive]$
```

```sh
[zhangsan@RHEL7CCIE new_drive]$ dd if=/dev/zero of=new2m bs=1M count=1
1+0 records in
1+0 records out
1048576 bytes (1.0 MB) copied, 0.00587711 s, 178 MB/s
[zhangsan@RHEL7CCIE new_drive]$ ll
total 1024
-rw-rw-r--. 1 zhangsan zhangsan 1048576 Sep 23 17:18 new2m
[zhangsan@RHEL7CCIE new_drive]$
[zhangsan@RHEL7CCIE new_drive]$ du
1024    .
[zhangsan@RHEL7CCIE new_drive]$ 
```

```sh
[root@RHEL7CCIE ~]# xfs_quota -x -c report /media/new_drive/
User quota on /media/new_drive (/dev/sdb1)
                               Blocks
User ID          Used       Soft       Hard    Warn/Grace
---------- --------------------------------------------------
root                0          0          0     00 [--------]
zhangsan         1024       3072       5120     00 [--------]

[root@RHEL7CCIE ~]#
```


```sh
[zhangsan@RHEL7CCIE new_drive]$ dd if=/dev/zero of=new2m bs=5M count=1
1+0 records in
1+0 records out
5242880 bytes (5.2 MB) copied, 0.0272344 s, 193 MB/s
[zhangsan@RHEL7CCIE new_drive]$ dd if=/dev/zero of=new2m bs=6M count=1
dd: error writing ‘new2m’: Disk quota exceeded
1+0 records in
0+0 records out
5242880 bytes (5.2 MB) copied, 0.0338247 s, 155 MB/s
[zhangsan@RHEL7CCIE new_drive]$
```

```sh
[root@RHEL7CCIE ~]# xfs_quota -x -c report /media/new_drive/
User quota on /media/new_drive (/dev/sdb1)
                               Blocks
User ID          Used       Soft       Hard    Warn/Grace
---------- --------------------------------------------------
root                0          0          0     00 [--------]
zhangsan         5120       3072       5120     00  [6 days]

[root@RHEL7CCIE ~]#
```




## edquota

`edquota -u user` 就可以修改配额。
输入命令之后，会出现一个vi 编辑器，内容是对 user 的配额修改。
注意的是，blocks 和 inodes 这两列分别是当前的配额使用情况。
我们修改的内容应该是两个 soft 和 hard 列。

```sh
[root@RHEL7CCIE ~]# edquota -u zhangsan
# 输入命令之后就会出现 vi 编辑器。修改完成之后保存退出即可。
Disk quotas for user zhangsan (uid 1001):
  Filesystem                   blocks       soft       hard     inodes     soft     hard
  /dev/sdb1                      5120       3072       51200          1        3        5
  /dev/sda1                         0          0          0          0        0        0

[root@RHEL7CCIE ~]# xfs_quota -x -c report /media/new_drive/
User quota on /media/new_drive (/dev/sdb1)
                               Blocks
User ID          Used       Soft       Hard    Warn/Grace
---------- --------------------------------------------------
root                0          0          0     00 [--------]
zhangsan        30720       3072      51200     00  [6 days]

[root@RHEL7CCIE ~]#
```

```sh
[zhangsan@RHEL7CCIE new_drive]$ dd if=/dev/zero of=new2m bs=6M count=10
dd: error writing ‘new2m’: Disk quota exceeded
9+0 records in
8+0 records out
52428800 bytes (52 MB) copied, 0.249998 s, 210 MB/s
[zhangsan@RHEL7CCIE new_drive]$ dd if=/dev/zero of=new2m bs=6M count=5
5+0 records in
5+0 records out
31457280 bytes (31 MB) copied, 0.148451 s, 212 MB/s
[zhangsan@RHEL7CCIE new_drive]$
```

