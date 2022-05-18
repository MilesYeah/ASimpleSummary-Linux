# cd 变换目录 change directory
cd 是 `Change Directory` 的缩写，这是用来变换工作目录的指令。   
注意，目录名称与cd指令之间存在一个空格。  

cd通常与特殊目录符号配合使用。
| 目录 | 解释           |
| ---- | -------------- |
| `.`  | 当前目录       |
| `..` | 上一级目录     |
| `-`  | 之前所在的目录 |
| `~`  | home 目录      |
|      |                |
|      |                |
|      |                |
|      |                |



```sh
[root@dell_tower ~]# cd ~miles
# 代表去到 miles 这个使用者的主文件夹，亦即 /home/miles

[root@dell_tower miles]# cd ~
# 表示回到自己的主文件夹，

[root@dell_tower ~]# cd /
[root@dell_tower /]# cd
# 没有加上任何路径，也还是代表回到自己主文件夹的意思！

[root@dell_tower ~]# cd ..
# 表示去到目前的上层目录，亦即是 /root 的上层目录的意思；

[root@dell_tower /]# cd -
/root
# 表示回到刚刚的那个目录，也就是 /root ～

[root@dell_tower ~]# cd /var/spool/mail/
# 这个就是绝对路径的写法！直接指定要去的完整路径名称！

[root@dell_tower mail]# cd ../postfix/
[root@dell_tower postfix]#
# 这个是相对路径的写法，我们由/var/spool/mail 去到/var/spool/postfix 就这样写！
```
