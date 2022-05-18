mkfifo

熟悉Unix的人都应该知道这个是一个创建有名管道的系统调用或命令。平时，我们在命令行上使用竖线“|”把命令串起来是使用无命管道。而我们使用mkfifo则使用的是有名管道。下面是示例：

下面是创建一个有名管道：

[hchen@RHELSVR5 ~]# mkfifo /tmp/hchenpipe

[hchen@RHELSVR5 ~]# ls -l /tmp
prw-rw-r-- 1 hchen  hchen  0 05-10 18:58 hchenpipe
然后，我们在一个shell中运行如下命令，这个命令不会返回，除非有人从这个有名管道中把信息读走。

[hchen@RHELSVR5 ~]# ls -al > /tmp/hchenpipe
我们在另一个命令窗口中读取这个管道中的信息：（其会导致上一个命令返回）

[hchen@RHELSVR5 ~]# head /tmp/hchenpipe
drwx------ 8 hchen hchen    4096 05-10 18:27 .
drwxr-xr-x 7 root  root     4096 03-05 00:06 ..
drwxr-xr-x 3 hchen hchen    4096 03-01 18:13 backup
-rw------- 1 hchen hchen     721 05-05 22:12 .bash_history
-rw-r--r-- 1 hchen hchen      24 02-28 22:20 .bash_logout
-rw-r--r-- 1 hchen hchen     176 02-28 22:20 .bash_profile
-rw-r--r-- 1 hchen hchen     124 02-28 22:20 .bashrc
-rw-r--r-- 1 root  root    14002 03-07 00:29 index.htm
-rw-r--r-- 1 hchen hchen   31465 03-01 23:48 index.php
