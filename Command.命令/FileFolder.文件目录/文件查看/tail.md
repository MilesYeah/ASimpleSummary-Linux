# tail  取出后面n行

有头 head 自然有尾 tail.  
tail的用法跟head差不多类似，但它显示的是后面几行！默认也是显示十行，就加`-n number`即可指定显示行数。

```sh
[root@study ~]# tail [-n number] 文件 
选项与参数：
-n  ：后面接数字，代表显示几行的意思
-f  ：表示持续侦测后面所接的文件名，要等到按下[ctrl]-c才会结束tail的侦测
```
```sh
[root@study ~]# tail /etc/man_db.conf
# 默认的情况中，显示最后的十行！

# 若要显示最后的 20 行，就得要这样：
[root@study ~]# tail -n 20 /etc/man_db.conf

# 如果不知道/etc/man_db.conf有几行，却只想列出100行以后的数据时？
[root@study ~]# tail -n +100 /etc/man_db.conf

# 用于查看不断变化的文件，要等到输入[crtl]-c之后才会离开tail这个指令的侦测！
# 输入如下命令后，若一直向/var/log/messages最后一直添加新内容
# 则在当前terminal下就会动态看见新添加的内容，直到按 Ctrl C 命令才会推出
[root@study ~]# tail -f /var/log/messages
```



## 动态显示文件变化
使用如下命令就可以动态实时的查看 `/var/log/messages` 下的新增内容。
```sh
[root@study ~]# tail -f /var/log/messages
```
