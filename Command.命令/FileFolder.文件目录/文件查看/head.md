# head  取出前面n行
head的英文意思就是“头”，它的用法就是显示出文件的前几行！

默认只显示十行。指定 `-n` 选项可以指定显示行数，`head -n 2 filename`即显示文件filename的前2行！

```sh
[root@study ~]# head [-n number] 文件 
选项与参数：
-n  ：后面接数字，代表显示几行的意思

[root@study ~]# head /etc/man_db.conf
# 默认的情况中，显示前面十行！若要显示前 20 行，就得要这样：
[root@study ~]# head -n 20 /etc/man_db.conf

# 后面100行的数据都不打印，只打印/etc/man_db.conf的前面几行
[root@study ~]# head -n -100 /etc/man_db.conf
```

另外： -n 选项后面的参数如果是负数，例如上面范例的 `-n -100` 时，代表显示不包括后面100行的前n行。  
举例来说 CentOS 7.1 的 /etc/man_db.conf 共有131行，则 `head -n -100 /etc/man_db.conf` 会列出前31行，后面100行不会打印出来。


