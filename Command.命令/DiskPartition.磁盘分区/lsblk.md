
## lsblk命令 – 查看系统的磁盘



所属分类：linux命令 磁盘管理

lsblk命令的英文是“list block”，即用于列出所有可用块设备的信息，而且还能显示他们之间的依赖关系，但是它不会列出RAM盘的信息。

lsblk命令包含在util-linux-ng包中，现在该包改名为util-linux。

语法格式：lsblk [参数]

常用参数：
```md
-a 	显示所有设备
-b 	以bytes方式显示设备大小
-d 	不显示 slaves 或 holders
-D 	print discard capabilities
-e 	排除设备
-f 	显示文件系统信息
-h 	显示帮助信息
-i 	use ascii characters only
-m 	显示权限信息
-l 	使用列表格式显示
-n 	不显示标题
-o 	输出列
-P 	使用key=”value”格式显示
-r 	使用原始格式显示
-t 	显示拓扑结构信息
```

参考实例

lsblk命令默认情况下将以树状列出所有块设备：
```sh
[root@u22e ~ ]# lsblk
lsblk NAME   MAJ:MIN rm  SIZE RO type mountpoint
sda      8:0    0 232.9G  0 disk 
├─sda1   8:1    0  46.6G  0 part / 
├─sda2   8:2    0     1K  0 part  
├─sda5   8:5    0   190M  0 part /boot 
├─sda6   8:6    0   3.7G  0 part [SWAP] 
├─sda7   8:7    0  93.1G  0 part /data 
└─sda8   8:8    0  89.2G  0 part /personal 
sr0     11:0    1  1024M  0 rom
```
默认选项不会列出所有空设备：

`[root@u22e ~]# lsblk -a`

也可以用于列出一个特定设备的拥有关系，同时也可以列出组和模式：

`[root@u22e ~]# lsblk -m`

要获取SCSI设备的列表，你只能使用-S选项，该选项是用来以颠倒的顺序打印依赖的：

`[root@u22e ~]# lsblk -S`

例如，你也许想要以列表格式列出设备，而不是默认的树状格式。可以将两个不同的选项组合，以获得期望的输出：

`[root@u22e ~]# lsblk -nl`




```sh
[root@localhost ~]# lsblk -O
NAME KNAME MAJ:MIN FSTYPE MOUNTPOINT LABEL UUID                                 PARTTYPE                             PARTLABEL PARTUUID                             PARTFLAGS   RA RO RM HOTPLUG MODEL SERIAL   SIZE STATE OWNER GROUP MODE       ALIGNMENT MIN-IO OPT-IO PHY-SEC LOG-SEC ROTA SCHED RQ-SIZE TYPE DISC-ALN DISC-GRAN DISC-MAX DISC-ZERO WSAME WWN                RAND PKNAME HCTL       TRAN   SUBSYSTEMS  REV VENDOR ZONED
sda  sda     8:0                                                                                                                                                              4096  0  0       0 ST100 WJB036 931.5G runni root  disk  brw-rw----         0    512      0     512     512    1 mq-deadline
│                                                                                                                                                                                                                                                                                                         64 disk        0        0B       0B         0    0B 0x5000c500cd48c15a    1        7:0:0:0    sata   block:scsi:pci
│                                                                                                                                                                                                                                                                                                                                                                                                                         TN01 ATA    none
├─sda1
│    sda1    8:1   vfat   /boot/efi        D734-C22B                            c12a7328-f81f-11d2-ba4b-00a0c93ec93b EFI System Partition
│                                                                                                                              aa2fec12-c2f0-4cd0-bb25-b20d55d1eb5f           4096  0  0       0                600M       root  disk  brw-rw----         0    512      0     512     512    1 mq-deadline
│                                                                                                                                                                                                                                                                                                         64 part        0        0B       0B         0    0B 0x5000c500cd48c15a    1 sda                      block:scsi:pci
│                                                                                                                                                                                                                                                                                                                                                                                                                                     none
├─sda2
│    sda2    8:2   xfs    /boot            c1956362-92ca-4788-ac71-cdea32f406e1 0fc63daf-8483-4772-8e79-3d69d8477de4           b9d75d3b-9b4d-4df3-8985-f8ff37cdb815           4096  0  0       0                  1G       roo
t  disk  brw-rw----         0    512      0     512     512    1 mq-deadline
│                                                                                                                                                                                                                                                                                                         64 part        0        0B       0B         0    0B 0x5000c500cd48c15a    1 sda                      block:scsi:pci
│                                                                                                                                                                                                                                                                                                                                                                                                                                     none
├─sda3
│    sda3    8:3   swap   [SWAP]           927b9bcf-ef29-4ad6-b543-533ee2e824b9 0657fd6d-a4ab-43c4-84e5-0933c84b4f4f           f34d3ebb-eb04-4c27-87ea-53ff68d71d8c           4096  0  0       0                 16G       root  disk  brw-rw----         0    512      0     512     512    1 mq-deadline
│                                                                                                                                                                                                                                                                                                         64 part        0        0B       0B         0    0B 0x5000c500cd48c15a    1 sda                      block:scsi:pci
│                                                                                                                                                                                                                                                                                                                                                                                                                                     none
└─sda4
     sda4    8:4   xfs    /                133b800b-77cc-45e4-aeee-ce8e9bc54f04 0fc63daf-8483-4772-8e79-3d69d8477de4           fe7d7b0e-6bb6-4106-a7f5-395130e649a8           4096  0  0       0              913.9G       root  disk  brw-rw----         0    512      0     512     512    1 mq-deadline
                                                                                                                                                                                                                                                                                                          64 part        0        0B       0B         0    0B 0x5000c500cd48c15a    1 sda                      block:scsi:pci
                                                                                                                                                                                                                                                                                                                                                                                                                                      none
[root@localhost ~]# 

```
