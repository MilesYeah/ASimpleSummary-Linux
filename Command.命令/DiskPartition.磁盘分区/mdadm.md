# mdadm


mdadm命令用于管理Linux系统中的软件RAID硬盘阵列，格式为 `mdadm [模式] <RAID设备名称> [选项] [成员设备名称]`。

当前，生产环境中用到的服务器一般都配备RAID阵列卡，尽管服务器的价格越来越便宜，但是我们没有必要为了做一个实验而去单独购买一台服务器，而是可以学会用mdadm命令在Linux系统中创建和管理软件RAID磁盘阵列，而且它涉及的理论知识的操作过程与生产环境中的完全一致。mdadm命令的常用参数以及作用如表所示。


| 参数 | 作用             |
| ---- | ---------------- |
| -a   | 检测设备名称     |
| -n   | 指定设备数量     |
| -l   | 指定RAID级别     |
| -C   | 创建             |
| -v   | 显示过程         |
| -f   | 模拟设备损坏     |
| -r   | 移除设备         |
| -Q   | 查看摘要信息     |
| -D   | 查看详细信息     |
| -S   | 停止RAID磁盘阵列 |





## RAID 10

接下来，使用mdadm命令创建RAID 10，名称为“/dev/md0”。

```sh
[root@RHEL7CCIE ~]# lsblk
NAME          MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda             8:0    0   32G  0 disk
├─sda1          8:1    0  500M  0 part /boot
└─sda2          8:2    0 31.5G  0 part
  ├─rhel-root 253:0    0 29.5G  0 lvm  /
  └─rhel-swap 253:1    0    2G  0 lvm  [SWAP]
sdb             8:16   0   20G  0 disk
├─sdb1          8:17   0    5G  0 part /media/new_drive
├─sdb2          8:18   0    1K  0 part
└─sdb5          8:21   0    3G  0 part [SWAP]
sdc             8:32   0    8G  0 disk
sdd             8:48   0    8G  0 disk
sde             8:64   0    8G  0 disk
sdf             8:80   0    8G  0 disk
sr0            11:0    1 1024M  0 rom
sr1            11:1    1 1024M  0 rom
[root@RHEL7CCIE ~]#
```
```sh
[root@RHEL7CCIE ~]# mdadm -Cv /dev/md0 -n 4 -l 10 /dev/sd[c-f]
mdadm: layout defaults to n2
mdadm: layout defaults to n2
mdadm: chunk size defaults to 512K
mdadm: size set to 8384000K
mdadm: Defaulting to version 1.2 metadata
mdadm: array /dev/md0 started.
[root@RHEL7CCIE ~]#
```
```sh
[root@RHEL7CCIE ~]# mdadm -Q /dev/md0
/dev/md0: 15.99GiB raid10 4 devices, 0 spares. Use mdadm --detail for more detail.
[root@RHEL7CCIE ~]#
```
```sh
[root@RHEL7CCIE ~]# mdadm -D /dev/md0
/dev/md0:
        Version : 1.2
  Creation Time : Mon Sep 28 09:04:14 2020
     Raid Level : raid10
     Array Size : 16768000 (15.99 GiB 17.17 GB)
  Used Dev Size : 8384000 (8.00 GiB 8.59 GB)
   Raid Devices : 4
  Total Devices : 4
    Persistence : Superblock is persistent

    Update Time : Mon Sep 28 09:05:57 2020
          State : clean, resyncing
 Active Devices : 4
Working Devices : 4
 Failed Devices : 0
  Spare Devices : 0

         Layout : near=2
     Chunk Size : 512K

  Resync Status : 41% complete

           Name : RHEL7CCIE:0  (local to host RHEL7CCIE)
           UUID : f8d15b88:c053dd6d:78c5b6aa:28166b1f
         Events : 6

    Number   Major   Minor   RaidDevice State
       0       8       32        0      active sync   /dev/sdc
       1       8       48        1      active sync   /dev/sdd
       2       8       64        2      active sync   /dev/sde
       3       8       80        3      active sync   /dev/sdf
[root@RHEL7CCIE ~]# mdadm --detail /dev/md0
/dev/md0:
        Version : 1.2
  Creation Time : Mon Sep 28 09:04:14 2020
     Raid Level : raid10
     Array Size : 16768000 (15.99 GiB 17.17 GB)
  Used Dev Size : 8384000 (8.00 GiB 8.59 GB)
   Raid Devices : 4
  Total Devices : 4
    Persistence : Superblock is persistent

    Update Time : Mon Sep 28 09:08:39 2020
          State : active
 Active Devices : 4
Working Devices : 4
 Failed Devices : 0
  Spare Devices : 0

         Layout : near=2
     Chunk Size : 512K

           Name : RHEL7CCIE:0  (local to host RHEL7CCIE)
           UUID : f8d15b88:c053dd6d:78c5b6aa:28166b1f
         Events : 18

    Number   Major   Minor   RaidDevice State
       0       8       32        0      active sync   /dev/sdc
       1       8       48        1      active sync   /dev/sdd
       2       8       64        2      active sync   /dev/sde
       3       8       80        3      active sync   /dev/sdf
[root@RHEL7CCIE ~]#

```

```sh
[root@RHEL7CCIE ~]# mkfs.xfs /dev/md0
log stripe unit (524288 bytes) is too large (maximum is 256KiB)
log stripe unit adjusted to 32KiB
meta-data=/dev/md0               isize=256    agcount=16, agsize=262016 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=0
data     =                       bsize=4096   blocks=4192000, imaxpct=25
         =                       sunit=128    swidth=256 blks
naming   =version 2              bsize=4096   ascii-ci=0 ftype=0
log      =internal log           bsize=4096   blocks=2560, version=2
         =                       sectsz=512   sunit=8 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
[root@RHEL7CCIE ~]#
```

```sh
[root@RHEL7CCIE ~]# mkdir /media/raid10
[root@RHEL7CCIE ~]# mount /dev/md0 /media/raid10/
[root@RHEL7CCIE ~]# df -h
Filesystem             Size  Used Avail Use% Mounted on
/dev/mapper/rhel-root   30G  3.0G   27G  11% /
devtmpfs               912M     0  912M   0% /dev
tmpfs                  921M   80K  921M   1% /dev/shm
tmpfs                  921M  8.8M  912M   1% /run
tmpfs                  921M     0  921M   0% /sys/fs/cgroup
/dev/sdb1              5.0G   63M  5.0G   2% /media/new_drive
/dev/sda1              497M  119M  379M  24% /boot
/dev/md0                16G   33M   16G   1% /media/raid10
[root@RHEL7CCIE ~]#
```

```sh
[root@RHEL7CCIE ~]# lsblk
NAME          MAJ:MIN RM  SIZE RO TYPE   MOUNTPOINT
sda             8:0    0   32G  0 disk
├─sda1          8:1    0  500M  0 part   /boot
└─sda2          8:2    0 31.5G  0 part
  ├─rhel-root 253:0    0 29.5G  0 lvm    /
  └─rhel-swap 253:1    0    2G  0 lvm    [SWAP]
sdb             8:16   0   20G  0 disk
├─sdb1          8:17   0    5G  0 part   /media/new_drive
├─sdb2          8:18   0    1K  0 part
└─sdb5          8:21   0    3G  0 part   [SWAP]
sdc             8:32   0    8G  0 disk
└─md0           9:0    0   16G  0 raid10 /media/raid10
sdd             8:48   0    8G  0 disk
└─md0           9:0    0   16G  0 raid10 /media/raid10
sde             8:64   0    8G  0 disk
└─md0           9:0    0   16G  0 raid10 /media/raid10
sdf             8:80   0    8G  0 disk
└─md0           9:0    0   16G  0 raid10 /media/raid10
sr0            11:0    1 1024M  0 rom
sr1            11:1    1 1024M  0 rom
[root@RHEL7CCIE ~]#
```

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
/dev/sdb1               /media/new_drive        xfs     defaults,uquota 0 0
/dev/sdb5               swap                    swap    defaults 0 0
/dev/md0                /media/raid10           xfs     defaults 0 0

[root@RHEL7CCIE ~]# init 6
```

```sh
[root@RHEL7CCIE ~]# df -h
Filesystem             Size  Used Avail Use% Mounted on
/dev/mapper/rhel-root   30G  3.0G   27G  11% /
devtmpfs               912M     0  912M   0% /dev
tmpfs                  921M   80K  921M   1% /dev/shm
tmpfs                  921M  8.8M  912M   1% /run
tmpfs                  921M     0  921M   0% /sys/fs/cgroup
/dev/sdb1              5.0G   63M  5.0G   2% /media/new_drive
/dev/md0                16G   33M   16G   1% /media/raid10
/dev/sda1              497M  119M  379M  24% /boot
[root@RHEL7CCIE ~]#
```

#### 损坏 RAID 10

现在，我们将机器关机，将其中一个硬盘删除，那么开机后 RAID 10 中会因为一个盘被损坏，而导致开机时不能挂载成功而启动失败。
进入救援模式，在 fstab 中将 RAID 10 挂载取消掉，然后重新开机，机器正常运转。

再次关机，将移除的硬盘插入机器，此时 RAID 状态正常。




```sh
[root@RHEL7CCIE ~]# lsscsi
[0:0:0:0]    cd/dvd  VBOX     CD-ROM           1.0   /dev/sr0
[1:0:0:0]    cd/dvd  VBOX     CD-ROM           1.0   /dev/sr1
[2:0:0:0]    disk    ATA      VBOX HARDDISK    1.0   /dev/sda
[3:0:0:0]    disk    ATA      VBOX HARDDISK    1.0   /dev/sdb
[4:0:0:0]    disk    ATA      VBOX HARDDISK    1.0   /dev/sdc
[5:0:0:0]    disk    ATA      VBOX HARDDISK    1.0   /dev/sdd
[6:0:0:0]    disk    ATA      VBOX HARDDISK    1.0   /dev/sde
[7:0:0:0]    disk    ATA      VBOX HARDDISK    1.0   /dev/sdf
[root@RHEL7CCIE ~]#
[root@RHEL7CCIE ~]# echo 1 > /sys/class/scsi_device/6\:0\:0\:0/device/delete
[root@RHEL7CCIE ~]# lsscsi
[0:0:0:0]    cd/dvd  VBOX     CD-ROM           1.0   /dev/sr0
[1:0:0:0]    cd/dvd  VBOX     CD-ROM           1.0   /dev/sr1
[2:0:0:0]    disk    ATA      VBOX HARDDISK    1.0   /dev/sda
[3:0:0:0]    disk    ATA      VBOX HARDDISK    1.0   /dev/sdb
[4:0:0:0]    disk    ATA      VBOX HARDDISK    1.0   /dev/sdc
[5:0:0:0]    disk    ATA      VBOX HARDDISK    1.0   /dev/sdd
[7:0:0:0]    disk    ATA      VBOX HARDDISK    1.0   /dev/sdf
[root@RHEL7CCIE ~]# lsblk
NAME          MAJ:MIN RM  SIZE RO TYPE   MOUNTPOINT
sda             8:0    0   32G  0 disk
├─sda1          8:1    0  500M  0 part   /boot
└─sda2          8:2    0 31.5G  0 part
  ├─rhel-root 253:0    0 29.5G  0 lvm    /
  └─rhel-swap 253:1    0    2G  0 lvm    [SWAP]
sdb             8:16   0   20G  0 disk
├─sdb1          8:17   0    5G  0 part   /media/new_drive
├─sdb2          8:18   0    1K  0 part
└─sdb5          8:21   0    3G  0 part   [SWAP]
sdc             8:32   0    8G  0 disk
└─md0           9:0    0   16G  0 raid10
sdd             8:48   0    8G  0 disk
└─md0           9:0    0   16G  0 raid10
sdf             8:80   0    8G  0 disk
└─md0           9:0    0   16G  0 raid10
sr0            11:0    1 1024M  0 rom
sr1            11:1    1 1024M  0 rom
[root@RHEL7CCIE ~]#
```


```sh
[root@RHEL7CCIE ~]# mdadm -D /dev/md0
/dev/md0:
        Version : 1.2
  Creation Time : Mon Sep 28 09:04:14 2020
     Raid Level : raid10
     Array Size : 16768000 (15.99 GiB 17.17 GB)
  Used Dev Size : 8384000 (8.00 GiB 8.59 GB)
   Raid Devices : 4
  Total Devices : 3
    Persistence : Superblock is persistent

    Update Time : Mon Sep 28 09:44:50 2020
          State : clean, degraded
 Active Devices : 3
Working Devices : 3
 Failed Devices : 0
  Spare Devices : 0

         Layout : near=2
     Chunk Size : 512K

           Name : RHEL7CCIE:0  (local to host RHEL7CCIE)
           UUID : f8d15b88:c053dd6d:78c5b6aa:28166b1f
         Events : 22

    Number   Major   Minor   RaidDevice State
       0       8       32        0      active sync   /dev/sdc
       1       8       48        1      active sync   /dev/sdd
       2       0        0        2      removed
       3       8       80        3      active sync   /dev/sdf
[root@RHEL7CCIE ~]#
```

然后 重启机器，查看 RAID 状态， sde 的状态依旧是 removed。

```sh
[root@RHEL7CCIE ~]# mdadm -D /dev/md0
/dev/md0:
        Version : 1.2
  Creation Time : Mon Sep 28 09:04:14 2020
     Raid Level : raid10
     Array Size : 16768000 (15.99 GiB 17.17 GB)
  Used Dev Size : 8384000 (8.00 GiB 8.59 GB)
   Raid Devices : 4
  Total Devices : 3
    Persistence : Superblock is persistent

    Update Time : Mon Sep 28 09:52:06 2020
          State : clean, degraded
 Active Devices : 3
Working Devices : 3
 Failed Devices : 0
  Spare Devices : 0

         Layout : near=2
     Chunk Size : 512K

           Name : RHEL7CCIE:0  (local to host RHEL7CCIE)
           UUID : f8d15b88:c053dd6d:78c5b6aa:28166b1f
         Events : 26

    Number   Major   Minor   RaidDevice State
       0       8       32        0      active sync   /dev/sdc
       1       8       48        1      active sync   /dev/sdd
       2       0        0        2      removed
       3       8       80        3      active sync   /dev/sdf
[root@RHEL7CCIE ~]# lsblk
NAME          MAJ:MIN RM  SIZE RO TYPE   MOUNTPOINT
sda             8:0    0   32G  0 disk
├─sda1          8:1    0  500M  0 part   /boot
└─sda2          8:2    0 31.5G  0 part
  ├─rhel-root 253:0    0 29.5G  0 lvm    /
  └─rhel-swap 253:1    0    2G  0 lvm    [SWAP]
sdb             8:16   0   20G  0 disk
├─sdb1          8:17   0    5G  0 part   /media/new_drive
├─sdb2          8:18   0    1K  0 part
└─sdb5          8:21   0    3G  0 part   [SWAP]
sdc             8:32   0    8G  0 disk
└─md0           9:0    0   16G  0 raid10 /media/raid10
sdd             8:48   0    8G  0 disk
└─md0           9:0    0   16G  0 raid10 /media/raid10
sde             8:64   0    8G  0 disk
sdf             8:80   0    8G  0 disk
└─md0           9:0    0   16G  0 raid10 /media/raid10
sr0            11:0    1 1024M  0 rom
sr1            11:1    1 1024M  0 rom
[root@RHEL7CCIE ~]#
```

```sh
[root@RHEL7CCIE ~]# mdadm /dev/md0 -a /dev/sde
mdadm: added /dev/sde
[root@RHEL7CCIE ~]# mdadm -D /dev/md0
/dev/md0:
        Version : 1.2
  Creation Time : Mon Sep 28 09:04:14 2020
     Raid Level : raid10
     Array Size : 16768000 (15.99 GiB 17.17 GB)
  Used Dev Size : 8384000 (8.00 GiB 8.59 GB)
   Raid Devices : 4
  Total Devices : 4
    Persistence : Superblock is persistent

    Update Time : Mon Sep 28 09:54:50 2020
          State : clean, degraded, recovering
 Active Devices : 3
Working Devices : 4
 Failed Devices : 0
  Spare Devices : 1

         Layout : near=2
     Chunk Size : 512K

 Rebuild Status : 1% complete

           Name : RHEL7CCIE:0  (local to host RHEL7CCIE)
           UUID : f8d15b88:c053dd6d:78c5b6aa:28166b1f
         Events : 30

    Number   Major   Minor   RaidDevice State
       0       8       32        0      active sync   /dev/sdc
       1       8       48        1      active sync   /dev/sdd
       4       8       64        2      spare rebuilding   /dev/sde
       3       8       80        3      active sync   /dev/sdf
[root@RHEL7CCIE ~]#
```

```sh
[root@RHEL7CCIE ~]# mdadm -D /dev/md0
/dev/md0:
        Version : 1.2
  Creation Time : Mon Sep 28 09:04:14 2020
     Raid Level : raid10
     Array Size : 16768000 (15.99 GiB 17.17 GB)
  Used Dev Size : 8384000 (8.00 GiB 8.59 GB)
   Raid Devices : 4
  Total Devices : 4
    Persistence : Superblock is persistent

    Update Time : Mon Sep 28 09:55:52 2020
          State : clean
 Active Devices : 4
Working Devices : 4
 Failed Devices : 0
  Spare Devices : 0

         Layout : near=2
     Chunk Size : 512K

           Name : RHEL7CCIE:0  (local to host RHEL7CCIE)
           UUID : f8d15b88:c053dd6d:78c5b6aa:28166b1f
         Events : 57

    Number   Major   Minor   RaidDevice State
       0       8       32        0      active sync   /dev/sdc
       1       8       48        1      active sync   /dev/sdd
       4       8       64        2      active sync   /dev/sde
       3       8       80        3      active sync   /dev/sdf
[root@RHEL7CCIE ~]#

```





## RAID 5 + 热备盘


释放之前 RAID 所占用的 sdc sdd sde sdf
```sh
[root@RHEL7CCIE ~]# mdadm -S /dev/md0
mdadm: stopped /dev/md0
[root@RHEL7CCIE ~]#
[root@RHEL7CCIE ~]# lsblk
NAME          MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda             8:0    0   32G  0 disk
├─sda1          8:1    0  500M  0 part /boot
└─sda2          8:2    0 31.5G  0 part
  ├─rhel-root 253:0    0 29.5G  0 lvm  /
  └─rhel-swap 253:1    0    2G  0 lvm  [SWAP]
sdb             8:16   0   20G  0 disk
├─sdb1          8:17   0    5G  0 part /media/new_drive
├─sdb2          8:18   0    1K  0 part
└─sdb5          8:21   0    3G  0 part [SWAP]
sdc             8:32   0    8G  0 disk
sdd             8:48   0    8G  0 disk
sde             8:64   0    8G  0 disk
sdf             8:80   0    8G  0 disk
sr0            11:0    1 1024M  0 rom
sr1            11:1    1 1024M  0 rom
[root@RHEL7CCIE ~]#
```


创建 RAID 5 ， -n 3 指定 RAID 含有三块硬盘。 -l 5 指定 RAID 5， -x 1 指定备份盘为一个。
```sh
[root@RHEL7CCIE ~]# mdadm -Cv /dev/md0 -n 3 -l 5 -x 1 /dev/sd[c-f]
mdadm: layout defaults to left-symmetric
mdadm: layout defaults to left-symmetric
mdadm: chunk size defaults to 512K
mdadm: /dev/sdc appears to be part of a raid array:
    level=raid10 devices=4 ctime=Mon Sep 28 09:04:14 2020
mdadm: /dev/sdd appears to be part of a raid array:
    level=raid10 devices=4 ctime=Mon Sep 28 09:04:14 2020
mdadm: /dev/sde appears to be part of a raid array:
    level=raid10 devices=4 ctime=Mon Sep 28 09:04:14 2020
mdadm: /dev/sdf appears to be part of a raid array:
    level=raid10 devices=4 ctime=Mon Sep 28 09:04:14 2020
mdadm: size set to 8384000K
Continue creating array? y
mdadm: Defaulting to version 1.2 metadata
mdadm: array /dev/md0 started.
[root@RHEL7CCIE ~]#
[root@RHEL7CCIE ~]# mdadm -D /dev/md0
/dev/md0:
        Version : 1.2
  Creation Time : Mon Sep 28 10:05:33 2020
     Raid Level : raid5
     Array Size : 16768000 (15.99 GiB 17.17 GB)
  Used Dev Size : 8384000 (8.00 GiB 8.59 GB)
   Raid Devices : 3
  Total Devices : 4
    Persistence : Superblock is persistent

    Update Time : Mon Sep 28 10:05:33 2020
          State : clean, degraded, recovering
 Active Devices : 2
Working Devices : 4
 Failed Devices : 0
  Spare Devices : 2

         Layout : left-symmetric
     Chunk Size : 512K

 Rebuild Status : 2% complete

           Name : RHEL7CCIE:0  (local to host RHEL7CCIE)
           UUID : 9191155d:d1f1a7a5:4d32d91b:920b05ab
         Events : 1

    Number   Major   Minor   RaidDevice State
       0       8       32        0      active sync   /dev/sdc
       1       8       48        1      active sync   /dev/sdd
       4       8       64        2      spare rebuilding   /dev/sde

       3       8       80        -      spare   /dev/sdf
[root@RHEL7CCIE ~]#
```

RAID 创建完毕状态。
```sh
[root@RHEL7CCIE ~]# mdadm -D /dev/md0
/dev/md0:
        Version : 1.2
  Creation Time : Mon Sep 28 10:05:33 2020
     Raid Level : raid5
     Array Size : 16768000 (15.99 GiB 17.17 GB)
  Used Dev Size : 8384000 (8.00 GiB 8.59 GB)
   Raid Devices : 3
  Total Devices : 4
    Persistence : Superblock is persistent

    Update Time : Mon Sep 28 10:10:21 2020
          State : clean
 Active Devices : 3
Working Devices : 4
 Failed Devices : 0
  Spare Devices : 1

         Layout : left-symmetric
     Chunk Size : 512K

           Name : RHEL7CCIE:0  (local to host RHEL7CCIE)
           UUID : 9191155d:d1f1a7a5:4d32d91b:920b05ab
         Events : 154

    Number   Major   Minor   RaidDevice State
       0       8       32        0      active sync   /dev/sdc
       1       8       48        1      active sync   /dev/sdd
       4       8       64        2      active sync   /dev/sde

       3       8       80        -      spare   /dev/sdf
[root@RHEL7CCIE ~]#
```

格式化 RAID 为 ext4 格式并挂载到 /media/raid5 中。
```sh
[root@RHEL7CCIE ~]# mkfs.ext4 /dev/md0
mke2fs 1.42.9 (28-Dec-2013)
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
Stride=128 blocks, Stripe width=256 blocks
1048576 inodes, 4192000 blocks
209600 blocks (5.00%) reserved for the super user
First data block=0
Maximum filesystem blocks=2151677952
128 block groups
32768 blocks per group, 32768 fragments per group
8192 inodes per group
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
        4096000

Allocating group tables: done
Writing inode tables: done
Creating journal (32768 blocks): done
Writing superblocks and filesystem accounting information: done

[root@RHEL7CCIE ~]# mkdir /media/raid5
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
/dev/sdb1 /media/new_drive xfs defaults,uquota 0 0
/dev/sdb5 swap swap defaults 0 0
/dev/md0                /media/raid5            ext4    defaults 0 0
[root@RHEL7CCIE ~]# mount -a
[root@RHEL7CCIE ~]# lsblk
NAME          MAJ:MIN RM  SIZE RO TYPE  MOUNTPOINT
sda             8:0    0   32G  0 disk
├─sda1          8:1    0  500M  0 part  /boot
└─sda2          8:2    0 31.5G  0 part
  ├─rhel-root 253:0    0 29.5G  0 lvm   /
  └─rhel-swap 253:1    0    2G  0 lvm   [SWAP]
sdb             8:16   0   20G  0 disk
├─sdb1          8:17   0    5G  0 part  /media/new_drive
├─sdb2          8:18   0    1K  0 part
└─sdb5          8:21   0    3G  0 part  [SWAP]
sdc             8:32   0    8G  0 disk
└─md0           9:0    0   16G  0 raid5 /media/raid5
sdd             8:48   0    8G  0 disk
└─md0           9:0    0   16G  0 raid5 /media/raid5
sde             8:64   0    8G  0 disk
└─md0           9:0    0   16G  0 raid5 /media/raid5
sdf             8:80   0    8G  0 disk
└─md0           9:0    0   16G  0 raid5 /media/raid5
sr0            11:0    1 1024M  0 rom
sr1            11:1    1 1024M  0 rom
[root@RHEL7CCIE ~]#
```


查看 磁盘设备 列表，再删除 RAID 中的一块磁盘。
```sh
[root@RHEL7CCIE ~]# lsscsi
[0:0:0:0]    cd/dvd  VBOX     CD-ROM           1.0   /dev/sr0
[1:0:0:0]    cd/dvd  VBOX     CD-ROM           1.0   /dev/sr1
[2:0:0:0]    disk    ATA      VBOX HARDDISK    1.0   /dev/sda
[3:0:0:0]    disk    ATA      VBOX HARDDISK    1.0   /dev/sdb
[4:0:0:0]    disk    ATA      VBOX HARDDISK    1.0   /dev/sdc
[5:0:0:0]    disk    ATA      VBOX HARDDISK    1.0   /dev/sdd
[6:0:0:0]    disk    ATA      VBOX HARDDISK    1.0   /dev/sde
[7:0:0:0]    disk    ATA      VBOX HARDDISK    1.0   /dev/sdf
[root@RHEL7CCIE ~]#
```
```sh
[root@RHEL7CCIE ~]# echo 1 > /sys/class/scsi_device/5\:0\:0\:0/device/delete
[root@RHEL7CCIE ~]# lsblk
NAME          MAJ:MIN RM  SIZE RO TYPE  MOUNTPOINT
sda             8:0    0   32G  0 disk
├─sda1          8:1    0  500M  0 part  /boot
└─sda2          8:2    0 31.5G  0 part
  ├─rhel-root 253:0    0 29.5G  0 lvm   /
  └─rhel-swap 253:1    0    2G  0 lvm   [SWAP]
sdb             8:16   0   20G  0 disk
├─sdb1          8:17   0    5G  0 part  /media/new_drive
├─sdb2          8:18   0    1K  0 part
└─sdb5          8:21   0    3G  0 part  [SWAP]
sdc             8:32   0    8G  0 disk
└─md0           9:0    0   16G  0 raid5 /media/raid5
sde             8:64   0    8G  0 disk
└─md0           9:0    0   16G  0 raid5 /media/raid5
sdf             8:80   0    8G  0 disk
└─md0           9:0    0   16G  0 raid5 /media/raid5
sr0            11:0    1 1024M  0 rom
sr1            11:1    1 1024M  0 rom
[root@RHEL7CCIE ~]#
```

查看 RAID 状态，那么我们就发现 sdf 最初为热备盘，现在就顶替掉被删除的 sdd 。
```sh
[root@RHEL7CCIE ~]# mdadm -D /dev/md0
/dev/md0:
        Version : 1.2
  Creation Time : Mon Sep 28 10:05:33 2020
     Raid Level : raid5
     Array Size : 16768000 (15.99 GiB 17.17 GB)
  Used Dev Size : 8384000 (8.00 GiB 8.59 GB)
   Raid Devices : 3
  Total Devices : 3
    Persistence : Superblock is persistent

    Update Time : Mon Sep 28 10:23:45 2020
          State : clean, degraded, recovering
 Active Devices : 2
Working Devices : 3
 Failed Devices : 0
  Spare Devices : 1

         Layout : left-symmetric
     Chunk Size : 512K

 Rebuild Status : 5% complete

           Name : RHEL7CCIE:0  (local to host RHEL7CCIE)
           UUID : 9191155d:d1f1a7a5:4d32d91b:920b05ab
         Events : 157

    Number   Major   Minor   RaidDevice State
       0       8       32        0      active sync   /dev/sdc
       3       8       80        1      spare rebuilding   /dev/sdf
       4       8       64        2      active sync   /dev/sde
[root@RHEL7CCIE ~]#
```




