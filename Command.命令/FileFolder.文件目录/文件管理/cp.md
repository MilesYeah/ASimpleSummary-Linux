# cp 复制文件或目录

复制 cp `copy` 这个指令是非常重要的，不同身份者执行这个指令会有不同的结果产生。

```sh
[root@study ~]# cp [-fipru] 来源文件（source） 目标文件（destination）
[root@study ~]# cp [options] source1 source2 source3 .... directory
```
选项与参数：
| para | explaination                                                                   |
| ---- | ------------------------------------------------------------------------------ |
| -f   | 为强制的意思，若目标文件已经存在且无法打开，则移除后再尝试一次，force          |
| -i   | 若目标文件已经存在时，在覆盖时会先询问动作的进行, interactive                  |
| -p   | 连同文件的属性（权限、用户、时间）一起复制过去，而非使用默认属性（备份常用）； |
| -r   | 递回持续复制，用于目录的复制行为， recursive                                   |
| -R   | 同 -r ，递回持续复制，用于目录的复制行为， recursive                           |
| -u   | 目标文件比源文件旧才覆盖旧目标文件，或目标文件不存在的情况下才复制。           |
|      |                                                                                |
|      |                                                                                |


PS:
1. 最后需要注意的，如果来源文件有两个以上，则最后一个目的文件一定要是“目录”才行！


```sh
# 新建一个空目录
[root@dell_tower miles]# mkdir cptest
[root@dell_tower miles]# ll cptest/
total 0

# 复制dump文件
[root@dell_tower miles]# cp dump cptest/
[root@dell_tower miles]# ll cptest/
total 20
-rw-r--r-- 1 root root 16735 Nov 30 08:25 dump

# cp默认自动加上-i选项提示是否覆盖
[root@dell_tower miles]# cp dump cptest/
cp: overwrite 'cptest/dump'? y

# 不加任何参数复制目录则会跳过目录
[root@dell_tower miles]# cp temp cptest/
cp: omitting directory 'temp'
[root@dell_tower miles]# ll cptest/
total 20
-rw-r--r-- 1 root root 16735 Nov 30 08:25 dump

# -r选项会允许目录的复制
[root@dell_tower miles]# cp -r temp cptest/
[root@dell_tower miles]# ll cptest/
total 20
-rw-r--r-- 1 root root 16735 Nov 30 08:25 dump
drwxr-xr-x 2 root root     6 Nov 30 08:28 temp
```



