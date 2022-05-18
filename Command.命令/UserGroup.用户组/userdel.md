# userdel

userdel命令用于删除用户，格式为“userdel [选项] 用户名”。

如果我们确认某位用户后续不再会登录到系统中，则可以通过userdel命令删除该用户的所有信息。在执行删除操作时，该用户的家目录默认会保留下来，此时可以使用-r参数将其删除。

| 参数 | 作用                     |
| ---- | ------------------------ |
| -f   | 强制删除用户             |
| -r   | 同时删除用户及用户家目录 |


```sh
[root@RHEL7CCIE ~]# cd /home/
[root@RHEL7CCIE home]# ls
CCIE  miles  xiaomo  xiaoqi
[root@RHEL7CCIE home]# userdel xiaomo
[root@RHEL7CCIE home]# ls
CCIE  miles  xiaomo  xiaoqi
[root@RHEL7CCIE home]# userdel -r xiaoqi
[root@RHEL7CCIE home]# ls
CCIE  miles  xiaomo
[root@RHEL7CCIE home]#
```

