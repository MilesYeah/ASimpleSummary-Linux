# blkid

blkid命令用于查看设备的名称、文件系统及UUID。

```sh
[root@localhost ~]# blkid
/dev/sdc: UUID="83dbc4c1-ec3e-ace9-1e9e-5e6f3e382c62" UUID_SUB="6edd202f-45cf-c321-3544-65ea87670ede" LABEL="localhost.localdomain:0" TYPE="linux_raid_member"
/dev/sdd: UUID="83dbc4c1-ec3e-ace9-1e9e-5e6f3e382c62" UUID_SUB="10adca9b-d974-9020-0952-d0b98da327be" LABEL="localhost.localdomain:0" TYPE="linux_raid_member"
/dev/sdb: UUID="83dbc4c1-ec3e-ace9-1e9e-5e6f3e382c62" UUID_SUB="5ac676cf-6756-1c7f-7179-405c27a97591" LABEL="localhost.localdomain:0" TYPE="linux_raid_member"
/dev/sde: UUID="83dbc4c1-ec3e-ace9-1e9e-5e6f3e382c62" UUID_SUB="dea29159-92c5-172f-022b-b854c7b0f730" LABEL="localhost.localdomain:0" TYPE="linux_raid_member"
/dev/sda1: UUID="c718c5c1-9c44-48c3-9fb6-8d57ab92899f" TYPE="xfs"
/dev/sda2: UUID="h5dpdm-YMJR-HbLi-FKWB-UtIt-9o2n-efbvpF" TYPE="LVM2_member"
/dev/sr0: UUID="2014-05-07-03-58-46-00" LABEL="RHEL-7.0 Server.x86_64" TYPE="iso9660" PTTYPE="dos"
/dev/mapper/rhel-root: UUID="abadf7df-4a2b-471d-a58c-6f38b41b7db5" TYPE="xfs"
/dev/mapper/rhel-swap: UUID="1ffec24e-98cc-468d-9295-49dfb0d7c28f" TYPE="swap"
/dev/md0: PTTYPE="gpt"
[root@localhost ~]#
```