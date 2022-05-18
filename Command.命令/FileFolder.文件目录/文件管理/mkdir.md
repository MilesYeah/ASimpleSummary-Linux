# mkdir 创建新目录

如果想要创建新的目录的话，那么就使用 `mkdir: make directory`

```sh
[root@study ~]# mkdir [-mp] 目录名称
选项与参数：
-m ：设置文件的权限！直接设置，不需要看默认权限 （umask） 的脸色～
-p ：帮助你直接将所需要的目录（包含上层目录）递回创建起来！
```

在默认的情况下， 目录得一层一层的创建！
如：要创建一个目录为 /home/bird/testing/test1，  
* 那么首先必须要有 /home 
* 然后 /home/bird ，
* 再 /home/bird/testing 都必须要存在，  
* 才可以创建 /home/bird/testing/test1!   
* 假如没有 /home/bird/testing ，就没有办法创建 test1！

不过，现在有更简单有效的方法！那就是加上 -p 这个选项！
* 直接下达：" `mkdir -p /home/bird/testing/test1` "
* 系统会自动将 /home, /home/bird, /home/bird/testing 依序的创建！
* 并且，如果该目录本来就已经存在，系统也不会显示错误讯息！

```sh
# 范例：请到/tmp下面尝试创建数个新目录看看：
[root@study ~]# cd /tmp
[root@study tmp]# mkdir test    <==创建一名为 test 的新目录
[root@study tmp]# mkdir test1/test2/test3/test4
mkdir: cannot create directory 'test1/test2/test3/test4': No such file or directory
# 系统告诉我们，没要创建的目录不存在！就是没有目录才要创建的！
[root@study tmp]# mkdir -p test1/test2/test3/test4
# 原来是要建 test4 上层没先建 test3 之故！加了这个 -p 的选项，可以自行帮你创建多层目录！
```

