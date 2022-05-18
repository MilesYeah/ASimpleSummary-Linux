# chmod 改变文件权限

```sh
[root@localhost ~]# chmod --help
Usage: chmod [OPTION]... MODE[,MODE]... FILE...
  or:  chmod [OPTION]... OCTAL-MODE FILE...
  or:  chmod [OPTION]... --reference=RFILE FILE...
Change the mode of each FILE to MODE.
With --reference, change the mode of each FILE to that of RFILE.

  -c, --changes          like verbose but report only when a change is made
  -f, --silent, --quiet  suppress most error messages
  -v, --verbose          output a diagnostic for every file processed
      --no-preserve-root  do not treat '/' specially (the default)
      --preserve-root    fail to operate recursively on '/'
      --reference=RFILE  use RFILE's mode instead of MODE values
  -R, --recursive        change files and directories recursively
      --help     display this help and exit
      --version  output version information and exit

Each MODE is of the form '[ugoa]*([-+=]([rwxXst]*|[ugo]))+|[-+=][0-7]+'.

GNU coreutils online help: <https://www.gnu.org/software/coreutils/>
Full documentation at: <https://www.gnu.org/software/coreutils/chmod>
or available locally via: info '(coreutils) chmod invocation'
[root@localhost ~]#
```



##  chmod 改变文件权限

文件权限的改变使用的是`chmod`。
更改权限的方法有两种：使用数字 `4/2/1` 或符号 `r/w/x` 来更改权限。

如何用符号改变文件的权限：
```sh
[root@study ~]# chmod  u=rwx,go=rx  .bashrc
# 注意：u=rwx,go=rx 是连在一起的，中间并没有任何空白字符！

[root@study ~]# ls -al .bashrc
-rwxr-xr-x. 1 root root 176 Dec 29  2013 .bashrc

# 使用a代表ugo三个角色，为他们都加上w写权限
[root@study ~]# chmod  a+w  .bashrc
[root@study ~]# ls -al .bashrc
-rwxrwxrwx. 1 root root 176 Dec 29  2013 .bashrc

# 移除所有角色的执行权限
[root@study ~]# chmod  a-x  .bashrc
[root@study ~]# ls -al .bashrc
-rw-rw-rw-. 1 root root 176 Dec 29  2013 .bashrc
[root@study ~]# chmod 644 .bashrc  # 测试完毕得要改回来！
```

使用数字来改变文件的权限：

```sh
[root@study ~]# chmod [-R] xyz 文件或目录
选项与参数：
xyz : 就是刚刚提到的数字类型的权限属性，为 rwx 属性数值的相加。
-R : 进行递回（recursive）的持续变更，亦即连同次目录下的所有文件都会变更
```
```sh
# 查看aaa文件的权限
[root@dell_tower ~]# ll aaa
-rw-r--r-- 1 root root 0 Oct 16 14:12 aaa

# 使用数字改变aaa文件权限，755 = rwx r-x r-x
[root@dell_tower ~]# chmod 755 aaa
[root@dell_tower ~]# ll aaa
-rwxr-xr-x 1 root root 0 Oct 16 14:12 aaa

# 使用数字改变aaa文件权限，743 = rwx r-- -wx
[root@dell_tower ~]# chmod 743 aaa
[root@dell_tower ~]# ll aaa
-rwxr---wx 1 root root 0 Oct 16 14:12 aaa
```

