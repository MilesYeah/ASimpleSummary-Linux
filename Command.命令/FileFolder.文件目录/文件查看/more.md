# more 按页翻动
仔细的看如下的范例，如果 more 后面接的文件内容行数大于屏幕输出的行数时， 就会出现类似上面的图示。
重点在最后一行，最后一行会显示出目前显示的百分比， 而且还可以在最后一行输入一些有用的指令！

```sh
[root@study ~]# more /etc/man_db.conf
#
#
# This file is used by the man-db package to configure the man and cat paths.
# It is also used to provide a manpath for those without one by examining
# their PATH environment variable. For details see the manpath（5） man page.
#
.....（中间省略）.....
--More--（28%）  <== 重点在这一行！你的光标也会在这里等待你的指令
```

在 more 这个程序的运行过程中，你有几个按键可以按的：
```
空格键（space）   代表向下翻一页；
Enter            代表向下翻“一行”；
/字串            代表在这个显示的内容当中，向下搜寻“字串”这个关键字；
:f               立刻显示出文件名以及目前显示的行数；
q                代表立刻离开 more ，不再显示该文件内容。
b 或 [ctrl]-b    代表往回翻页，不过这动作只对文件有用，对管道无用。
```

