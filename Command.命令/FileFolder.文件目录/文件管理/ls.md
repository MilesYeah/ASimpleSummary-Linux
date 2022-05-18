
## ls: 文件与目录的检视

`ls` 可能是最常被执行的！因为我们随时都要知道文件或者是目录的相关信息。
不过，Linux的文件所记录的信息实在是太多，ls 没有必要全部都列出来。所以，当你只下达ls，默认显示只有：
* 非隐藏文件的文件名
* 以文件名进行排序
* 文件名代表的颜色显示

举例来说， 你下达`ls /etc`之后，只有经过排序的文件名以及以蓝色显示目录及白色显示一般文件。
```sh
[root@dell_tower ~]# ls [-aAdfFhilnrRSt] 文件名或目录名称..
[root@dell_tower ~]# ls [--color={never,auto,always}] 文件名或目录名称..
[root@dell_tower ~]# ls [--full-time] 文件名或目录名称..
```

选项与参数：
| para         | explaination                                                    |
| ------------ | --------------------------------------------------------------- |
| -a           | 全部的文件，连同隐藏文件（ 开头为 . 的文件） 一起列出来（常用） |
| -d           | 仅列出目录本身，而不是列出目录内的文件数据（常用）              |
| -l           | 长数据串行出，包含文件的属性与权限等等数据；（常用）            |
| --color=auto | 让系统自行依据设置来判断是否给予颜色 (默认加上)                 |
| -i           | 显示文件的 inode 信息                                           |
|              |                                                                 |



```sh
# 默认不加任何参数
[root@dell_tower ~]# ls
aaa  anaconda-ks.cfg  Desktop  Diag_main.log  Documents  Downloads  eclipse-workspace  LinuxProbe.pdf  miles  Music  Pictures  Public  rpmbuild  Templates  Videos

# -a显示～下所有文件，包括以.开头命名的隐藏文件
[root@dell_tower ~]# ls -a
.    .adobe           .bash_logout   .cache   Desktop        Downloads          .esd_auth      .idlerc         .local       .mozilla        .oracle_jre_usage  .pki             rpmbuild  .tcshrc    Videos
..   anaconda-ks.cfg  .bash_profile  .config  Diag_main.log  .eclipse           .gnupg         .lesshst        .macromedia  Music           .p2                Public           .ssh      Templates  .viminfo
aaa  .bash_history    .bashrc        .cshrc   Documents      eclipse-workspace  .ICEauthority  LinuxProbe.pdf  miles        .mysql_history  Pictures           .python_history  .swt      .tooling   .Xauthority
[root@dell_tower ~]#

# -l 以长格式显示文件或目录信息
[root@dell_tower ~]# ls -l
total 19644
-rwxr---wx  1 root root        0 Oct 16 14:12 aaa
-rw-------. 1 root root     1422 Jul 12  2017 anaconda-ks.cfg
drwxr-xr-x. 3 root root       21 Oct 22  2018 Desktop
-rw-r--r--  1 root root       57 Nov  2  2018 Diag_main.log
drwxr-xr-x. 2 root root        6 Aug  2  2017 Documents
drwxr-xr-x. 2 root root        6 Oct 22  2018 Downloads
drwxr-xr-x  4 root root       34 Aug  2  2018 eclipse-workspace
-rw-r--r--  1 root root 20105266 Jun 10  2018 LinuxProbe.pdf
drwxr-xr-x  2 root root       58 Oct 24 08:41 miles
drwxr-xr-x. 2 root root        6 Aug  2  2017 Music
drwxr-xr-x. 2 root root       98 Oct  8  2018 Pictures
drwxr-xr-x. 2 root root        6 Aug  2  2017 Public
drwxr-xr-x  4 root root       32 Mar  8  2019 rpmbuild
drwxr-xr-x. 2 root root        6 Aug  2  2017 Templates
drwxr-xr-x. 2 root root        6 Aug  2  2017 Videos
[root@dell_tower ~]#

# -d只显示目录本身
[root@dell_tower ~]# ls -ld /etc/
drwxr-xr-x. 141 root root 8192 Nov 30 08:13 /etc/

# ll相当于ls -l，以长格式形式显示目录下的内容
[root@dell_tower ~]# ll
total 19644
-rwxr---wx  1 root root        0 Oct 16 14:12 aaa
-rw-------. 1 root root     1422 Jul 12  2017 anaconda-ks.cfg
drwxr-xr-x. 3 root root       21 Oct 22  2018 Desktop
-rw-r--r--  1 root root       57 Nov  2  2018 Diag_main.log
drwxr-xr-x. 2 root root        6 Aug  2  2017 Documents
drwxr-xr-x. 2 root root        6 Oct 22  2018 Downloads
drwxr-xr-x  4 root root       34 Aug  2  2018 eclipse-workspace
-rw-r--r--  1 root root 20105266 Jun 10  2018 LinuxProbe.pdf
drwxr-xr-x  2 root root       58 Oct 24 08:41 miles
drwxr-xr-x. 2 root root        6 Aug  2  2017 Music
drwxr-xr-x. 2 root root       98 Oct  8  2018 Pictures
drwxr-xr-x. 2 root root        6 Aug  2  2017 Public
drwxr-xr-x  4 root root       32 Mar  8  2019 rpmbuild
drwxr-xr-x. 2 root root        6 Aug  2  2017 Templates
drwxr-xr-x. 2 root root        6 Aug  2  2017 Videos
[root@dell_tower ~]#
```

