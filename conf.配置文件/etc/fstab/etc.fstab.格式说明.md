# /etc/fstab 格式说明

```sh
[root@xckydb ~]# vi /etc/fstab
LABEL=/                 /                       ext3    defaults        1 1
LABEL=/boot             /boot                   ext3    defaults        1 2
tmpfs                   /dev/shm                tmpfs   defaults        0 0
devpts                  /dev/pts                devpts  gid=5,mode=620  0 0
sysfs                   /sys                    sysfs   defaults        0 0
proc                    /proc                   proc    defaults        0 0
LABEL=SWAP-sda2         swap                    swap    defaults        0 0
/dev/sdb                /data                   ext3    defaults        0 0
/dev/sdb1               /media/new              xfs     defaults        0 0
```


--格式说明

| /dev/sdb1 | /data    | ext3     | defaults         | 0        | 0        |
| --------- | -------- | -------- | ---------------- | -------- | -------- |
| 挂载对象   | 挂载目录 |  格式类型 |  文件系统访问权限  | 是否备份  | 是否自检 |



用于挂载信息的指定填写格式中，各字段所表示的意义
| 字段             | 意义                                                                                 |
| ---------------- | ------------------------------------------------------------------------------------ |
| 挂载对象         | 一般为设备的路径+设备名称，也可以写唯一识别码（UUID，Universally Unique Identifier） |
| 挂载目录         | 指定要挂载到的目录，需在挂载前创建好                                                 |
| 格式类型         | 指定文件系统的格式，比如Ext3、Ext4、XFS、SWAP、iso9660（此为光盘设备）等             |
| 文件系统访问权限 | 若设置为defaults，则默认权限为：rw, suid, dev, exec, auto, nouser, async             |
| 是否备份         | 若为1则开机后使用dump进行磁盘备份，为0则不备份                                       |
| 是否自检         | 若为1则开机后自动进行磁盘自检，为0则不自检                                           |

