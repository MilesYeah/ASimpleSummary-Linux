# wc 统计字数/行数
如果我想要知道 /etc/man_db.conf 这个文件里面有多少字，多少行，多少字符，我该怎么做？
可以利用 wc 这个指令来实现，他可以帮我们统计输出的讯息的整体数据！

wc [-lwm]
选项与参数：
-l  ：仅列出行；
-w  ：仅列出多少字（英文单字）；
-m  ：多少字符；

```sh
# Sample: 那个 /etc/man_db.conf 里面到底有多少相关字、行、字符数？
[root@RHEL7CCIE ~]#  cat /etc/man_db.conf | wc
    131     723    5171
[root@RHEL7CCIE ~]#
# 输出的三个数字中，分别代表： “行、字数、字符数”

# Sample: 使用 last 可以输出登陆者，如何查询 root 的登录次数
[root@RHEL7CCIE ~]# last | grep 'root' | wc -l
8
[root@RHEL7CCIE ~]#
```


