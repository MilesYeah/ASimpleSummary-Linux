# history命令

history 命令用于显示历史执行过的命令，格式为`history [-c]`。

history 命令应该是作者最喜欢的命令。执行 history 命令能显示出当前用户在本地计算机中执行过的最近 1000 条命令记录。
如果觉得 1000 不够用，还可以自定义`/etc/profile`文件中的 HISTSIZE 变量值。
在使用 history 命令时，如果使用 `-c` 参数则会清空所有的命令历史记录。
还可以使用 `!编码数字` 的方式来重复执行某一次的命令。
总之， history 命令有很多有趣的玩法等待您去开发。

```sh
[root@linuxprobe ~]# history
1 tar xzvf VMwareTools-9.9.0-2304977.tar.gz
2 cd vmware-tools-distrib/
3 ls
4 ./vmware-install.pl -d
5 reboot
6 df -h
7 cd /run/media/
8 ls
9 cd root/
10 ls
11 cd VMware\ Tools/
12 ls
13 cp VMwareTools-9.9.0-2304977.tar.gz /home
14 cd /home
15 ls
16 tar xzvf VMwareTools-9.9.0-2304977.tar.gz
17 cd vmware-tools-distrib/
18 ls
19 ./vmware-install.pl -d
20 reboot
21 history
[root@linuxprobe ~]# !15
anaconda-ks.cfg  Documents  initial-setup-ks.cfg  Pictures  Templates
Desktop          Downloads  Music                 Public    Videos
```

历史命令会被保存到用户家目录中的.bash_history文件中。Linux系统中以点（.）开头的文件均代表隐藏文件，这些文件大多数为系统服务文件，可以用cat命令查看其文件内容。
```sh
[root@linuxprobe ~]# cat ~/.bash_history
```

要清空当前用户在本机上执行的Linux命令历史记录信息，可执行如下命令：
```sh
[root@linuxprobe ~]# history -c
```

