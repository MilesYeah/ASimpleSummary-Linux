# ln 硬软链接

ln命令用于创建链接文件，格式为“ln [选项] 目标”。

在使用ln命令时，是否添加-s参数，将创建出性质不同的两种“快捷方式”。

| 参数 | 作用                                               |
| ---- | -------------------------------------------------- |
| -s   | 创建“符号链接”（如果不带-s参数，则默认创建硬链接） |
| -f   | 强制创建文件或目录的链接                           |
| -i   | 覆盖前先询问                                       |
| -v   | 显示创建链接的过程                                 |


## 软硬链接区别
硬链接原理：
* 使链接的两个文件共享同样文件内容，就是同样的inode
* 一旦文件1和文件2之间有了硬链接
* 那么你修改文件1或文件2，修改的是相同的一块内容
* 只不过我们可以用两个文件名来取到文件内容

硬链接缺陷：
* 只能创建指向文件的硬链接，不能创建指向目录的
* 通过一些参数的修改，也可以创建指向目录的硬链接，但比较复杂
* 软链接可以指向文件或目录。对于目录，一般都是用软链接
* 就是说它们共享相同的文件内容，也就是拥有同一个inode
* 可以用 ls -i 命令查看一下（-i参数可以显示文件的inode）
* 可以看到file1和file2的inode是一样的
* 当然你的电脑上应该和我不一样，是其他数字
* 如果我们用rm file2来删除file2，那么对file1没什么影响
* 如果我们用rm file1来删除file1，对file2也没什么影响
* 对于硬链接来说，删除任意一方的文件
* 共同指向的文件内容并不会从硬盘上被删除
* 只有既删除file1又删除file2
* 它们共同指向的文件内容才会消失
* 也就是那个inode才会被删去
* 用Is-l命令查看文件信息的时候
* 第二列的那个2，其实是表示拥有相同inode号的文件数
* 因为它们指向相同的文件内容，所以共享一个inode
* 这个第二列的数字，一般来说对于普通文件，都是1
* 因为不同文件inode不同嘛
* 对于目录来说，这第二列的数字标明目录内所含文件数目



创建软链接
* 软链接才真正像我们在Windows下的快捷方式，原理很相似
* 创建硬链接时In不带任何参数，创建软链接需要加上-s参数
* s是symbolic（符号的）的缩写
* ln -s file1 file2：创建了file1的软链接file2
* file2 的信息是这样的：file2->file1，表示file2指向file1
* file2 前面的权限那里的第一个字母变成了1，表示link（链接）
* 之前硬链接的时候是没有1的，硬链接看起来就和普通文件类似
* 我们用ls-1命令查看文件信息的时候，第二列的那个1
* 表示拥有相同 inode号的文件数。不难理解，因为file2指向file1
* 它们并没有指向同一块文件内容，所以它们的inode号不相同
* 其实file2这个软链接只是file1的一个快捷方式
* 它指向的是file1，所以显示的是file1的内容
* file2的inode和file1不一样，也就是文件内容不一样

软链接的特点
* 如果我们删除file2，没什么大不了，file1不会受到影响
* 如果删除file1，file2会变成“死链接”，因为指向的文件不见了
* 软链接可以指向目录，硬链接不行






## 实例

```sh
[root@RHEL7CCIE ~]# echo "Welcome to the party" > party
[root@RHEL7CCIE ~]# ll party
-rw-r--r--. 1 root root 21 Sep 23 20:04 party
[root@RHEL7CCIE ~]#
```

对party 文件做四个硬链接文件。然后我们会发现 party 1 2 3 4 这五个文件的连接数都是 5.
```sh
[root@RHEL7CCIE ~]# ln party 1
[root@RHEL7CCIE ~]# ln party 2
[root@RHEL7CCIE ~]# ln party 3
[root@RHEL7CCIE ~]# ln party 4
[root@RHEL7CCIE ~]# ll
total 32
-rw-r--r--. 5 root root   21 Sep 23 20:04 1
-rw-r--r--. 5 root root   21 Sep 23 20:04 2
-rw-r--r--. 5 root root   21 Sep 23 20:04 3
-rw-r--r--. 5 root root   21 Sep 23 20:04 4
-rw-------. 1 root root 1218 Jul  7 16:23 anaconda-ks.cfg
drwxr-xr-x. 2 root root    6 Jul  7 16:32 Desktop
drwxr-xr-x. 2 root root    6 Jul  7 16:32 Documents
drwxr-xr-x. 2 root root    6 Jul  7 16:32 Downloads
d---rwx---+ 2 root root    6 Sep 23 10:13 haha
-rw-r--r--. 1 root root 1269 Jul  7 16:32 initial-setup-ks.cfg
drwxr-xr-x. 2 root root    6 Jul  7 16:32 Music
-rw-r--r--. 5 root root   21 Sep 23 20:04 party
drwxr-xr-x. 2 root root    6 Jul  7 16:32 Pictures
drwxr-xr-x. 2 root root    6 Jul  7 16:32 Public
drwxr-xr-x. 2 root root    6 Jul  7 16:32 Templates
drwxr-xr-x. 2 root root    6 Jul  7 16:32 Videos
[root@RHEL7CCIE ~]#
```
四个硬链接的内容都与源文件一样。
```sh
[root@RHEL7CCIE ~]# cat 1
Welcome to the party
[root@RHEL7CCIE ~]# cat 2
Welcome to the party
[root@RHEL7CCIE ~]# cat 3
Welcome to the party
[root@RHEL7CCIE ~]# cat 4
Welcome to the party
[root@RHEL7CCIE ~]#
```
修改源文件，硬链接的内容都会相应改变。
```sh
[root@RHEL7CCIE ~]# vim party
[root@RHEL7CCIE ~]# cat party
Welcome to the party, the world is so beautiful
[root@RHEL7CCIE ~]# cat 1
Welcome to the party, the world is so beautiful
[root@RHEL7CCIE ~]# cat 2
Welcome to the party, the world is so beautiful
[root@RHEL7CCIE ~]# cat 3
Welcome to the party, the world is so beautiful
[root@RHEL7CCIE ~]# cat 4
Welcome to the party, the world is so beautiful
[root@RHEL7CCIE ~]#
```
建立两个 软连接。
```sh
[root@RHEL7CCIE ~]# ln -s party s1
[root@RHEL7CCIE ~]# ln -s party s2
[root@RHEL7CCIE ~]# cat s1
Welcome to the party, the world is so beautiful
[root@RHEL7CCIE ~]# cat s2
Welcome to the party, the world is so beautiful
[root@RHEL7CCIE ~]#
```

修改源文件，软硬链接的内容都会相应改变。
```sh
[root@RHEL7CCIE ~]# vim party
[root@RHEL7CCIE ~]# cat party
Welcome to the party, the world is so beautiful, I love it so much.
[root@RHEL7CCIE ~]# cat 1
Welcome to the party, the world is so beautiful, I love it so much.
[root@RHEL7CCIE ~]# cat s1
Welcome to the party, the world is so beautiful, I love it so much.
[root@RHEL7CCIE ~]#
```

修改硬连接内容，源文件，及软硬链接的内容都会相应改变。
```sh
[root@RHEL7CCIE ~]# vim 1
[root@RHEL7CCIE ~]# cat 1
Welcome to the party, the world is so beautiful, I love it so much. hard 1
[root@RHEL7CCIE ~]# cat s1
Welcome to the party, the world is so beautiful, I love it so much. hard 1
[root@RHEL7CCIE ~]# cat party
Welcome to the party, the world is so beautiful, I love it so much. hard 1
[root@RHEL7CCIE ~]#
```

修改软连接内容，源文件，及软硬链接的内容都会相应改变。
```sh
[root@RHEL7CCIE ~]# vim s1
[root@RHEL7CCIE ~]# cat s1
Welcome to the party, the world is so beautiful, I love it so much. hard 1, soft 1
[root@RHEL7CCIE ~]# cat 1
Welcome to the party, the world is so beautiful, I love it so much. hard 1, soft 1
[root@RHEL7CCIE ~]# cat party
Welcome to the party, the world is so beautiful, I love it so much. hard 1, soft 1
[root@RHEL7CCIE ~]#
```

删掉一个软链接，其源文件，其他的软硬链接都存在，且内容都未改变。
```sh
[root@RHEL7CCIE ~]# ll
total 32
-rw-r--r--. 5 root root   83 Sep 23 20:09 1
-rw-r--r--. 5 root root   83 Sep 23 20:09 2
-rw-r--r--. 5 root root   83 Sep 23 20:09 3
-rw-r--r--. 5 root root   83 Sep 23 20:09 4
-rw-------. 1 root root 1218 Jul  7 16:23 anaconda-ks.cfg
drwxr-xr-x. 2 root root    6 Jul  7 16:32 Desktop
drwxr-xr-x. 2 root root    6 Jul  7 16:32 Documents
drwxr-xr-x. 2 root root    6 Jul  7 16:32 Downloads
d---rwx---+ 2 root root    6 Sep 23 10:13 haha
-rw-r--r--. 1 root root 1269 Jul  7 16:32 initial-setup-ks.cfg
drwxr-xr-x. 2 root root    6 Jul  7 16:32 Music
-rw-r--r--. 5 root root   83 Sep 23 20:09 party
drwxr-xr-x. 2 root root    6 Jul  7 16:32 Pictures
drwxr-xr-x. 2 root root    6 Jul  7 16:32 Public
lrwxrwxrwx. 1 root root    5 Sep 23 20:07 s1 -> party
lrwxrwxrwx. 1 root root    5 Sep 23 20:07 s2 -> party
drwxr-xr-x. 2 root root    6 Jul  7 16:32 Templates
drwxr-xr-x. 2 root root    6 Jul  7 16:32 Videos
[root@RHEL7CCIE ~]# rm s1
rm: remove symbolic link ‘s1’? y
[root@RHEL7CCIE ~]# cat 1
Welcome to the party, the world is so beautiful, I love it so much. hard 1, soft 1
[root@RHEL7CCIE ~]# cat party
Welcome to the party, the world is so beautiful, I love it so much. hard 1, soft 1
[root@RHEL7CCIE ~]#
```

删掉一个硬链接，其源文件，其他的软硬链接都存在，且内容都未改变。
```sh
[root@RHEL7CCIE ~]# rm -f 1
[root@RHEL7CCIE ~]# cat 2
Welcome to the party, the world is so beautiful, I love it so much. hard 1, soft 1
[root@RHEL7CCIE ~]# cat party
Welcome to the party, the world is so beautiful, I love it so much. hard 1, soft 1
[root@RHEL7CCIE ~]#
```

删除源文件 party ，那么硬链接 2 依然存在，且内容可以读取。但是软连接 s2 就不存在了。
```sh
[root@RHEL7CCIE ~]# ll
total 28
-rw-r--r--. 4 root root   83 Sep 23 20:09 2
-rw-r--r--. 4 root root   83 Sep 23 20:09 3
-rw-r--r--. 4 root root   83 Sep 23 20:09 4
-rw-------. 1 root root 1218 Jul  7 16:23 anaconda-ks.cfg
drwxr-xr-x. 2 root root    6 Jul  7 16:32 Desktop
drwxr-xr-x. 2 root root    6 Jul  7 16:32 Documents
drwxr-xr-x. 2 root root    6 Jul  7 16:32 Downloads
d---rwx---+ 2 root root    6 Sep 23 10:13 haha
-rw-r--r--. 1 root root 1269 Jul  7 16:32 initial-setup-ks.cfg
drwxr-xr-x. 2 root root    6 Jul  7 16:32 Music
-rw-r--r--. 4 root root   83 Sep 23 20:09 party
drwxr-xr-x. 2 root root    6 Jul  7 16:32 Pictures
drwxr-xr-x. 2 root root    6 Jul  7 16:32 Public
lrwxrwxrwx. 1 root root    5 Sep 23 20:07 s2 -> party
drwxr-xr-x. 2 root root    6 Jul  7 16:32 Templates
drwxr-xr-x. 2 root root    6 Jul  7 16:32 Videos
[root@RHEL7CCIE ~]# rm -f party
[root@RHEL7CCIE ~]# cat 2
Welcome to the party, the world is so beautiful, I love it so much. hard 1, soft 1
[root@RHEL7CCIE ~]# cat s2
cat: s2: No such file or directory
[root@RHEL7CCIE ~]# ll
total 24
-rw-r--r--. 3 root root   83 Sep 23 20:09 2
-rw-r--r--. 3 root root   83 Sep 23 20:09 3
-rw-r--r--. 3 root root   83 Sep 23 20:09 4
-rw-------. 1 root root 1218 Jul  7 16:23 anaconda-ks.cfg
drwxr-xr-x. 2 root root    6 Jul  7 16:32 Desktop
drwxr-xr-x. 2 root root    6 Jul  7 16:32 Documents
drwxr-xr-x. 2 root root    6 Jul  7 16:32 Downloads
d---rwx---+ 2 root root    6 Sep 23 10:13 haha
-rw-r--r--. 1 root root 1269 Jul  7 16:32 initial-setup-ks.cfg
drwxr-xr-x. 2 root root    6 Jul  7 16:32 Music
drwxr-xr-x. 2 root root    6 Jul  7 16:32 Pictures
drwxr-xr-x. 2 root root    6 Jul  7 16:32 Public
lrwxrwxrwx. 1 root root    5 Sep 23 20:07 s2 -> party
drwxr-xr-x. 2 root root    6 Jul  7 16:32 Templates
drwxr-xr-x. 2 root root    6 Jul  7 16:32 Videos
[root@RHEL7CCIE ~]#
```