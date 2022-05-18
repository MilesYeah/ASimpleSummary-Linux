# partx



```sh
[root@localhost ~]# partx -l /dev/sda
# 1:      2048-  1026047 (  1024000 sectors,    524 MB)
# 2:   1026048- 67108863 ( 66082816 sectors,  33834 MB)
[root@localhost ~]#
[root@localhost ~]# lsblk
NAME          MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda             8:0    0   32G  0 disk
├─sda1          8:1    0  500M  0 part /boot
└─sda2          8:2    0 31.5G  0 part
  ├─rhel-root 253:0    0 29.5G  0 lvm  /
  └─rhel-swap 253:1    0    2G  0 lvm  [SWAP]
sr0            11:0    1  3.5G  0 rom  /media/cdrom
[root@localhost ~]#
```
