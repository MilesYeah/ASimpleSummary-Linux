# find

Linux find命令用来在指定目录下查找文件。任何位于参数之前的字符串都将被视为欲查找的目录名。如果使用该命令时，不设置任何参数，则find命令将在当前目录下查找子目录与文件。并且将查找到的子目录和文件全部进行显示。

语法:   ``find   path   -option   [   -print ]   [ -exec   -ok   command ]   {} \;``

注意事项::
* 当使用 Linux 下的 find 命令时，请使用 -ok 选项来避免文件被意外删除，这个选项会在移除任何文件之前都会请求你的许可。

参数说明:
* find 根据下列规则判断 path 和 expression，在命令列上第一个 - ( ) , ! 之前的部份为 path，之后的是 expression。
* 如果 path 是空字串则使用目前路径，如果 expression 是空字串则使用 -print 为预设 expression。
* expression 中可使用的选项有二三十个之多，在此只介绍最常用的部份。

| 参数                    | 解释                                                                                                                          |
| ----------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| -mount, -xdev           | 只检查和指定目录在同一个文件系统下的文件，避免列出其它文件系统中的文件                                                        |
| -amin n                 | 在过去 n 分钟内被读取过                                                                                                       |
| -anewer file            | 比文件 file 更晚被读取过的文件                                                                                                |
| -atime n                | 在过去n天内被读取过的文件                                                                                                     |
| -cmin n                 | 在过去 n 分钟内被修改过                                                                                                       |
| -cnewer file            | 比文件 file 更新的文件                                                                                                        |
| -ctime n                | 在过去n天内被修改过的文件                                                                                                     |
| -empty                  | 空的文件-gid n or -group name   gid 是 n 或是 group 名称是 name                                                               |
| -ipath p, -path p       | 路径名称符合 p 的文件，ipath 会忽略大小写                                                                                     |
| -name name, -iname name | 文件名称符合 name 的文件。iname 会忽略大小写                                                                                  |
| -pid n                  | process id 是 n 的文件                                                                                                        |
| -perm                   | 匹配权限(mode为完全匹配， -mode为包含即可)                                                                                    |
| -user                   | 匹配所有者                                                                                                                    |
| -group                  | 匹配组                                                                                                                        |
| -mtime -n +n            | 匹配修改内容的时间(-n至n天以内，+n指n天以前)                                                                                  |
| -atime -n +n            | 匹配访问内容的时间(-n至n天以内，+n指n天以前)                                                                                  |
| -ctime -n +n            | 匹配修改文件权限的时间(-n至n天以内，+n指n天以前)                                                                              |
| -nouser                 | 匹配无所有者的文件                                                                                                            |
| -nogroup                | 匹配无所有组的文件                                                                                                            |
| -newer f1 !f2           | 匹配比f1新但比f2旧的文件                                                                                                      |
| --type b/d/c/p/l/f      | 匹配文件类型(block块文件, directory目录, char字符设备,pipe管道文件, link链接文件, file文件文件)                               |
| -size n                 | 文件大小 是 n 单位，b 代表 512 位元组的区块，c 表示字元数，k 表示 kilo bytes，w 是二个位元组。-type c   文件类型是 c 的文件。 |
| -prune                  | 忽略某个目录                                                                                                                  |
| -exec ... ()\;          | 后面可跟用于进一步处理搜索结果的命令                                                                                                                              |
|                         |                                                                                                                               |
|                         |                                                                                                                               |
|                         |                                                                                                                               |
|                         |                                                                                                                               |



| type简称 | 中文解释     |
| -------- | ------------ |
| d        | 目录         |
| c        | 字型装置文件 |
| b        | 区块装置文件 |
| p        | 具名贮列     |
| f        | 一般文件     |
| l        | 符号连结     |
| s        | socket       |



混合查找::
* 你可以使用 ( ) 将运算式分隔，并使用下列运算。
* exp1 -and exp2
* ! expr
* -not expr
* exp1 -or exp2
* exp1, exp2


实例:
* 将目前目录及其子目录下所有延伸档名是 c 的文件列出来。
`find . -name "*.c"`
* 将目前目录其其下子目录中所有一般文件列出
`find . -type f`
* 将目前目录及其子目录下所有最近 20 天内更新过的文件列出
`find . -ctime -20`
* 查找/var/log目录中更改时间在7日以前的普通文件，并在删除之前询问它们：
`find /var/log -type f -mtime +7 -ok rm {} \;`
* 查找前目录中文件属主具有读、写权限，并且文件所属组的用户和其他用户具有读权限的文件：
`find . -type f -perm 644 -exec ls -l {} \;`
* 为了查找系统中所有文件长度为0的普通文件，并列出它们的完整路径：
`find / -type f -size 0 -exec ls -l {} \;`



## 查找符合相应条件的文件，并删除这些文件

这里考虑仅需要保存最近5天的dailybuild，对于早于5天的目录执行删除操作。
查看了一下find命令说明，可以 
* 使用 "-type d" 参数来只查找目录，忽略文件。 
* 使用 "-mtime +5" 参数来指定只查找5天前有更改的目录 
* 其中 "-mtime -n/+n" 是指按文件更改时间来查找文件，-n指n天以内，+n指n天以前
所以最终脚本内容大体如下：

```sh
#!/bin/sh
cd /dailybuild/
files=`find ./* -name "*-*-*" -type d -mtime +5 -print`
for file in $files
do
    rm -rf $file
done
```



## exec
```sh
[root@RHEL7CCIE CCIE]# mkdir /var/tmp/miles
[root@RHEL7CCIE CCIE]# find /home/ -user miles
/home/miles
/home/miles/.mozilla
/home/miles/.mozilla/extensions
/home/miles/.mozilla/plugins
/home/miles/.bash_logout
/home/miles/.bash_profile
/home/miles/.bashrc
/home/miles/.cache
/home/miles/.cache/abrt
/home/miles/.cache/abrt/lastnotification
/home/miles/.config
/home/miles/.config/abrt
[root@RHEL7CCIE CCIE]# find /home/ -user miles -exec cp -a {} /var/tmp/miles/ \;
[root@RHEL7CCIE CCIE]# ll /var/tmp/miles/ -a
total 28
drwxr-xr-x.  9 root  root  4096 Sep  8 11:50 .
drwxrwxrwt. 10 root  root  4096 Sep  8 11:49 ..
drwxrwxr-x.  2 miles miles   29 Sep  8 11:46 abrt
-rw-r--r--.  1 miles miles   18 Jan 29  2014 .bash_logout
-rw-r--r--.  1 miles miles  193 Jan 29  2014 .bash_profile
-rw-r--r--.  1 miles miles  231 Jan 29  2014 .bashrc
drwxrwxr-x.  3 miles miles   17 Sep  8 11:46 .cache
drwxrwxr-x.  3 miles miles   17 Sep  8 11:46 .config
drwxr-xr-x.  2 miles miles    6 Jan 27  2014 extensions
-rw-------.  1 miles miles   11 Sep  8 11:46 lastnotification
drwx------.  5 miles miles 4096 Sep  8 11:48 miles
drwxr-xr-x.  4 miles miles   37 Jul  7 16:12 .mozilla
drwxr-xr-x.  2 miles miles    6 Jan 27  2014 plugins
[root@RHEL7CCIE CCIE]#
```

```sh
[root@RHEL7CCIE CCIE]# find /var/tmp/miles -name * -exec rm -fr {} \;
find: ‘/var/tmp/miles’: No such file or directory
[root@RHEL7CCIE CCIE]# ll -a /var/tmp/miles
ls: cannot access /var/tmp/miles: No such file or directory
[root@RHEL7CCIE CCIE]# ll -a /var/tmp/
total 5028
drwxrwxrwt.  9 root root    4096 Sep  8 11:53 .
drwxr-xr-x. 22 root root    4096 Sep  7 11:41 ..
drwxr-xr-x.  4 abrt abrt      93 Sep  7 15:19 abrt
-rw-------.  1 root root 5133132 Sep  7 15:18 sosreport-RHEL7CCIE-20200907151644.tar.xz
-rw-r--r--.  1 root root      33 Sep  7 15:18 sosreport-RHEL7CCIE-20200907151644.tar.xz.md5
drwx------.  3 root root      16 Sep  7 11:41 systemd-private-bp2PsY
drwx------.  3 root root      16 Sep  7 11:41 systemd-private-JRJgP4
drwx------.  3 root root      16 Sep  7 11:27 systemd-private-jSYSIW
drwx------.  3 root root      16 Sep  7 11:25 systemd-private-LjHRMt
drwx------.  3 root root      16 Sep  7 15:16 systemd-private-P1DG7H
drwx------.  3 root root      16 Sep  7 11:25 systemd-private-pAGrFn
[root@RHEL7CCIE CCIE]#
```

