# less 按页翻动

less 的用法比 more 更有弹性，除了 more 的基本操作外，less 可用键盘上 [pageup] [pagedown] 等按键来往前往后翻看。

```sh
[root@study ~]# less /etc/man_db.conf
#
#
# This file is used by the man-db package to configure the man and cat paths.
# It is also used to provide a manpath for those without one by examining
# their PATH environment variable. For details see the manpath（5） man page.
#
.....（中间省略）.....
:   <== 这里可以等待你输入指令！
```

less 里拥有更多的“搜寻”功能！不止可以向下搜寻，也可以向上搜寻。可以输入的指令有：
| command    | explaintion                                 |
| ---------- | ------------------------------------------- |
| 空白键     | 向下翻动一页；                              |
| [pagedown] | 向下翻动一页；                              |
| [pageup]   | 向上翻动一页；                              |
| /字串      | 向下搜寻“字串”的功能；                      |
| ?字串      | 向上搜寻“字串”的功能；                      |
| n          | 重复前一个搜寻 （与 / 或 ? 有关！）         |
| N          | 反向的重复前一个搜寻 （与 / 或 ? 有关！）   |
| g          | 前进到这个数据的第一行去；                  |
| G          | 前进到这个数据的最后一行去 （注意大小写）； |
| q          | 离开 less 这个程序；                        |
| =          | 查看当前位置                                |
|            |                                             |
|            |                                             |

