# lsscsi

lsscsi 可以列出诸如硬盘/光驱等 SCSI/SATA 设备信息。


```sh
[alvin@VM_0_16_centos ~]$ lsscsi
[0:0:1:0]    cd/dvd  QEMU     QEMU DVD-ROM     1.2.  /dev/sr0
```


## 命令移除一块磁盘设备
`echo 1 > /sys/class/scsi_device/{DISK_ID}/device/delete`

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


