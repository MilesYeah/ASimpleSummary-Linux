# cat  直接打印文件到标准输出
cat 是 Concatenate （连续） 的简写， 主要的功能是将一个文件的内容连续的印出在屏幕上面！  
如果加上 `-n` 或 `-b` ，每一行前面还会加上行号。

```sh
[root@study ~]# cat [-AbEnTv]
选项与参数：
-A  ：相当于 -vET 的整合选项，可列出一些特殊字符而不是空白而已；
-b  ：列出行号，仅针对非空白行做行号显示，空白行不标行号！
-E  ：将结尾的断行字符 $ 显示出来；
-n  ：打印出行号，连同空白行也会有行号，与 -b 的选项不同；
-T  ：将 [tab] 按键以 ^I 显示出来；
-v  ：列出一些看不出来的特殊字符
```

```sh
# 范例一：检阅 /etc/issue 这个文件的内容
[root@study ~]# cat /etc/issue
\S
Kernel \r on an \m

# 范例二：承上题，如果还要加印行号呢？
[root@study ~]# cat -n /etc/issue
     1  \S
     2  Kernel \r on an \m
     3
# 所以这个文件有三行！看到了吧！可以印出行号呢！这对于大文件要找某个特定的行时，有点用处！

# 如果不想要编排空白行的行号，可以使用“cat -b /etc/issue”，自己测试看看：
[root@dell_tower ~]# cat -b /etc/issue
     1  \S
     2  Kernel \r on an \m

# 输出所有字符
[root@dell_tower ~]# cat -A /etc/issue
\S$
Kernel \r on an \m$
$
```

在一般的环境中，使用 [tab] 与空白键的效果差不多，都是一堆空白。  
输出的结果并不会有特殊字体！使用 cat -A 就能够发现那些空白的地方是啥！  
[tab]会以 `^I` 表示，换行符以美元符号`$`表示，所以每一行后面都是 `$`！


```sh
# cat 同时打印多个文件在屏幕上
# 文件 1
[root@dell_tower miles]# cat another
aaaaaaaaaaaaaaaaaa
hahahaah

# 文件 2
[root@dell_tower miles]# cat test_script.sh
#!/bin/bash
echo Hello world!

# 文件 1 和 文件 2
[root@dell_tower miles]# cat another test_script.sh
aaaaaaaaaaaaaaaaaa
hahahaah
#!/bin/bash
echo Hello world!
[root@dell_tower miles]#
```

