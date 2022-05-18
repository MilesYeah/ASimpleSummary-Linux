# usradd

useradd命令中的用户参数以及作用

| 参数 | 作用                                     |
| ---- | ---------------------------------------- |
| -d   | 指定用户的家目录（默认为/home/username） |
| -e   | 账户的到期时间，格式为YYYY-MM-DD.        |
| -u   | 指定该用户的默认UID                      |
| -g   | 指定一个初始的用户基本组（必须已存在）   |
| -G   | 指定一个或多个扩展用户组                 |
| -N   | 不创建与用户同名的基本用户组             |
| -s   | 指定该用户的默认Shell解释器              |




```sh
[root@RHEL7CCIE ~]# useradd xiaoqi
[root@RHEL7CCIE ~]# id xiaoqi
uid=1001(xiaoqi) gid=1001(xiaoqi) groups=1001(xiaoqi)
[root@RHEL7CCIE ~]# useradd -u 6666 xiaomo
[root@RHEL7CCIE ~]# id xiaomo
uid=6666(xiaomo) gid=6666(xiaomo) groups=6666(xiaomo)
[root@RHEL7CCIE ~]# useradd -u 6666 haha
useradd: UID 6666 is not unique
[root@RHEL7CCIE ~]#
```
