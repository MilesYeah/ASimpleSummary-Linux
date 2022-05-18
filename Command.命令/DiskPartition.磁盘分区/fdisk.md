# fdisk

在Linux系统中，管理硬盘设备最常用的方法就当属fdisk命令了。
fdisk命令用于管理磁盘分区，格式为“fdisk  [磁盘名称]”，它提供了集添加、删除、转换分区等功能于一身的“一站式分区服务”。
不过与前面讲解的直接写到命令后面的参数不同，这条命令的参数是交互式的，因此在管理硬盘设备时特别方便，可以根据需求动态调整。

fdisk命令中的参数以及作用
| 参数 | 作用                   |
| ---- | ---------------------- |
| m    | 查看全部可用的参数     |
| n    | 添加新的分区           |
| d    | 删除某个分区信息       |
| l    | 列出所有可用的分区类型 |
| t    | 改变某个分区的类型     |
| p    | 查看分区表信息         |
| w    | 保存并退出             |
| q    | 不保存直接退出         |




## 实例

```sh
[root@RHEL7CCIE ~]# lsblk
NAME          MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda             8:0    0   32G  0 disk
├─sda1          8:1    0  500M  0 part /boot
└─sda2          8:2    0 31.5G  0 part
  ├─rhel-root 253:0    0 29.5G  0 lvm  /
  └─rhel-swap 253:1    0    2G  0 lvm  [SWAP]
sdb             8:16   0   20G  0 disk
sr0            11:0    1 1024M  0 rom
sr1            11:1    1 1024M  0 rom
[root@RHEL7CCIE ~]# 
```

```sh
[root@RHEL7CCIE ~]# fdisk /dev/sdb
Welcome to fdisk (util-linux 2.23.2).

Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

Device does not contain a recognized partition table
Building a new DOS disklabel with disk identifier 0xf14c6d22.

Command (m for help): m
Command action
   a   toggle a bootable flag
   b   edit bsd disklabel
   c   toggle the dos compatibility flag
   d   delete a partition
   g   create a new empty GPT partition table
   G   create an IRIX (SGI) partition table
   l   list known partition types
   m   print this menu
   n   add a new partition
   o   create a new empty DOS partition table
   p   print the partition table
   q   quit without saving changes
   s   create a new empty Sun disklabel
   t   change a partition's system id
   u   change display/entry units
   v   verify the partition table
   w   write table to disk and exit
   x   extra functionality (experts only)

Command (m for help): n
Partition type:
   p   primary (0 primary, 0 extended, 4 free)
   e   extended
Select (default p): p
Partition number (1-4, default 1): 1
First sector (2048-41943039, default 2048):
Using default value 2048
Last sector, +sectors or +size{K,M,G} (2048-41943039, default 41943039): +5G
Partition 1 of type Linux and of size 5 GiB is set

Command (m for help): p

Disk /dev/sdb: 21.5 GB, 21474836480 bytes, 41943040 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk label type: dos
Disk identifier: 0xf14c6d22

   Device Boot      Start         End      Blocks   Id  System
/dev/sdb1            2048    10487807     5242880   83  Linux

Command (m for help): w
The partition table has been altered!

Calling ioctl() to re-read partition table.
Syncing disks.
[root@RHEL7CCIE ~]#
```
```sh
[root@RHEL7CCIE ~]# lsblk
NAME          MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda             8:0    0   32G  0 disk
├─sda1          8:1    0  500M  0 part /boot
└─sda2          8:2    0 31.5G  0 part
  ├─rhel-root 253:0    0 29.5G  0 lvm  /
  └─rhel-swap 253:1    0    2G  0 lvm  [SWAP]
sdb             8:16   0   20G  0 disk
└─sdb1          8:17   0    5G  0 part
sr0            11:0    1 1024M  0 rom
sr1            11:1    1 1024M  0 rom
[root@RHEL7CCIE ~]#
```

```sh
[root@RHEL7CCIE ~]# mkfs
mkfs         mkfs.cramfs  mkfs.ext3    mkfs.fat     mkfs.msdos   mkfs.xfs
mkfs.btrfs   mkfs.ext2    mkfs.ext4    mkfs.minix   mkfs.vfat
[root@RHEL7CCIE ~]# mkfs.xfs /dev/sdb
sdb   sdb1
[root@RHEL7CCIE ~]# mkfs.xfs /dev/sdb1
meta-data=/dev/sdb1              isize=256    agcount=4, agsize=327680 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=0
data     =                       bsize=4096   blocks=1310720, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0 ftype=0
log      =internal log           bsize=4096   blocks=2560, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
[root@RHEL7CCIE ~]#
```

```sh
[root@RHEL7CCIE ~]# mkdir /media/haha
[root@RHEL7CCIE ~]# mount /dev/sdb1 /media/haha/
[root@RHEL7CCIE ~]# df -h
Filesystem             Size  Used Avail Use% Mounted on
/dev/mapper/rhel-root   30G  3.0G   27G  11% /
devtmpfs               912M     0  912M   0% /dev
tmpfs                  921M   80K  921M   1% /dev/shm
tmpfs                  921M  8.7M  912M   1% /run
tmpfs                  921M     0  921M   0% /sys/fs/cgroup
/dev/sda1              497M  119M  379M  24% /boot
/dev/sdb1              5.0G   33M  5.0G   1% /media/haha
[root@RHEL7CCIE ~]#
[root@RHEL7CCIE ~]# du -sh /media/haha/
0       /media/haha/
[root@RHEL7CCIE ~]#
```



## 创建扩展分区

```sh
[root@RHEL7CCIE ~]# fdisk /dev/sdb
Welcome to fdisk (util-linux 2.23.2).

Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.


Command (m for help): n
Partition type:
   p   primary (1 primary, 0 extended, 3 free)
   e   extended
Select (default p): e
Partition number (2-4, default 2): 2
First sector (10487808-41943039, default 10487808):
Using default value 10487808
Last sector, +sectors or +size{K,M,G} (10487808-41943039, default 41943039):
Using default value 41943039
Partition 2 of type Extended and of size 15 GiB is set

Command (m for help): n
Partition type:
   p   primary (1 primary, 1 extended, 2 free)
   l   logical (numbered from 5)
Select (default p): l
Adding logical partition 5
First sector (10489856-41943039, default 10489856):
Using default value 10489856
Last sector, +sectors or +size{K,M,G} (10489856-41943039, default 41943039): +3G
Partition 5 of type Linux and of size 3 GiB is set

Command (m for help): p

Disk /dev/sdb: 21.5 GB, 21474836480 bytes, 41943040 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk label type: dos
Disk identifier: 0xf14c6d22

   Device Boot      Start         End      Blocks   Id  System
/dev/sdb1            2048    10487807     5242880   83  Linux
/dev/sdb2        10487808    41943039    15727616    5  Extended
/dev/sdb5        10489856    16781311     3145728   83  Linux

Command (m for help): w
The partition table has been altered!

Calling ioctl() to re-read partition table.

WARNING: Re-reading the partition table failed with error 16: Device or resource busy.
The kernel still uses the old table. The new table will be used at
the next reboot or after you run partprobe(8) or kpartx(8)
Syncing disks.
[root@RHEL7CCIE ~]# ll /dev/sd*
brw-rw----. 1 root disk 8,  0 Sep 23 14:54 /dev/sda
brw-rw----. 1 root disk 8,  1 Sep 23 14:54 /dev/sda1
brw-rw----. 1 root disk 8,  2 Sep 23 14:54 /dev/sda2
brw-rw----. 1 root disk 8, 16 Sep 23 15:08 /dev/sdb
brw-rw----. 1 root disk 8, 17 Sep 23 14:54 /dev/sdb1
[root@RHEL7CCIE ~]#
```

如上述命令所示，分区建立之后并没有立即生效。
使用 partprobe 探测新分区，并与系统内核同步。
```sh
[root@RHEL7CCIE ~]# partprobe
[root@RHEL7CCIE ~]# ll /dev/sd*
brw-rw----. 1 root disk 8,  0 Sep 23 15:09 /dev/sda
brw-rw----. 1 root disk 8,  1 Sep 23 14:54 /dev/sda1
brw-rw----. 1 root disk 8,  2 Sep 23 14:54 /dev/sda2
brw-rw----. 1 root disk 8, 16 Sep 23 15:09 /dev/sdb
brw-rw----. 1 root disk 8, 17 Sep 23 14:54 /dev/sdb1
brw-rw----. 1 root disk 8, 18 Sep 23 15:09 /dev/sdb2
brw-rw----. 1 root disk 8, 21 Sep 23 15:09 /dev/sdb5
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
└─sdb5          8:21   0    3G  0 part
sr0            11:0    1 1024M  0 rom
sr1            11:1    1 1024M  0 rom
[root@RHEL7CCIE ~]#
```
