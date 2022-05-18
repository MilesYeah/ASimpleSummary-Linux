# stat命令

stat命令用于查看文件的具体存储信息和时间等信息，格式为“stat 文件名称”。

stat命令可以用于查看文件的存储信息和时间等信息，命令stat anaconda-ks.cfg会显示出文件的三种时间状态（已加粗）：Access、Modify、Change。这三种时间的区别将在下面的touch命令中详细详解：
```sh
[root@linuxprobe ~]# stat anaconda-ks.cfg
File: ‘anaconda-ks.cfg’
Size: 1213 Blocks: 8 IO Block: 4096 regular file
Device: fd00h/64768d Inode: 68912908 Links: 1
Access: (0600/-rw-------) Uid: ( 0/ root) Gid: ( 0/ root)
Context: system_u:object_r:admin_home_t:s0
Access: 2017-07-14 01:46:18.721255659 -0400
Modify: 2017-05-04 15:44:36.916027026 -0400
Change: 2017-05-04 15:44:36.916027026 -0400
Birth: -
```

