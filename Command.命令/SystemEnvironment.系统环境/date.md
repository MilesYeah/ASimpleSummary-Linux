# date 时间日期

语法：   
`date [-u] [-d datestr] [--date=datestr] [-s datestr] [--set=datestr] [--help] [+FORMAT] [MMDDhhmm[[CC]YY][.ss]]`

| 选项           | 作用                                     |
| -------------- | ---------------------------------------- |
| -d datestr     | 显示 datestr 中所设定的时间 (非系统时间) |
| --date=datestr | 同 -d                                    |
| --help         | 显示辅助讯息                             |
| -s datestr     | 将系统时间设为 datestr 中所设定的时间    |
| --set=datestr  | 同 -s                                    |
| -r fileName    | 打印文件最后修改时间                     |
|                |                                          |
|                |                                          |

* 若是不以加号作为开头，则表示要设定时间，
  * 时间格式为 `MMDDhhmm[[CC]YY][.ss]` ，其中 
  * `MM` 为月份， 
  * `DD` 为日， 
  * `hh` 为小时， 
  * `mm` 为分钟， 
  * `CC` 为年份前两位数字， 
  * `YY` 为年份后两位数字， 
  * `ss` 为秒数。
* 当以 root 身分更改了系统时间之后，请记得用命令 `clock -w` 来将系统时间写入 CMOS 中，这样下次重新开机时系统时间才会持续抱持最新的正确值。


```sh
[root@dell_tower ~]# date
Mon Oct 21 09:28:58 CST 2019
```
上面显示的是：星期一, 十月二十一日, 上午九点二十八分五十八秒，在 2019 年的 CST 时区。  
CST (China Standard Time UT+8:00) 中国标准时间

```sh
[root@dell_tower ~]# date +%Y/%m/%d
2019/10/21
[root@dell_tower ~]# date +%H:%M
09:29
[root@dell_tower ~]# date +%Y/%m/%d %H:%M
date: extra operand ‘%H:%M’
Try 'date --help' for more information.
[root@dell_tower ~]# date +"%Y/%m/%d %H:%M"
2019/10/21 09:29
[root@dell_tower ~]# date "+%Y/%m/%d %H:%M"
2019/10/21 09:36
[root@dell_tower ~]#
```

```sh
[root@dell_tower ~]# date +%T
09:57:49
[root@dell_tower ~]# date +%D
10/21/19
[root@dell_tower ~]# date +%x
10/21/2019
[root@dell_tower ~]#
```

那个 `+%Y%m%d` 就是date指令的一些参数功能，参照下表获取更多的可选格式控制符.


时间方面：

| 符号 | 意义                                               |
| ---- | -------------------------------------------------- |
| %    | 印出 %                                             |
| %n   | 下一行                                             |
| %t   | 跳格                                               |
| %H   | 小时(00..23)                                       |
| %I   | 小时(01..12)                                       |
| %k   | 小时(0..23)                                        |
| %l   | 小时(1..12)                                        |
| %M   | 分钟(00..59)                                       |
| %p   | 显示本地 AM 或 PM                                  |
| %r   | 直接显示时间 (12 小时制，格式为 hh:mm:ss [AP]M)    |
| %s   | 从 1970 年 1 月 1 日 00:00:00 UTC 到目前为止的秒数 |
| %S   | 秒(00..61)                                         |
| %T   | 直接显示时间 (24 小时制)                           |
| %X   | 相当于 %H:%M:%S                                    |
| %Z   | 显示时区                                           |

日期方面：

| 符号 | 意义                                                     |
| ---- | -------------------------------------------------------- |
| %a   | 星期几 (Sun..Sat)                                        |
| %A   | 星期几 (Sunday..Saturday)                                |
| %b   | 月份 (Jan..Dec)                                          |
| %B   | 月份 (January..December)                                 |
| %c   | 直接显示日期与时间                                       |
| %d   | 日 (01..31)                                              |
| %D   | 直接显示日期 (mm/dd/yy)                                  |
| %h   | 同 %b                                                    |
| %j   | 一年中的第几天 (001..366)                                |
| %m   | 月份 (01..12)                                            |
| %U   | 一年中的第几周 (00..53) (以 Sunday 为一周的第一天的情形) |
| %w   | 一周中的第几天 (0..6)                                    |
| %W   | 一年中的第几周 (00..53) (以 Monday 为一周的第一天的情形) |
| %x   | 直接显示日期 (mm/dd/yy)                                  |
| %y   | 年份的最后两位数字 (00.99)                               |
| %Y   | 完整年份 (0000..9999)                                    |


