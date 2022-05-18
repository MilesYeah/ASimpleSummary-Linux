# crontab.周期性计划任务

crontab

* `crontab -e` 创建、编辑计划任务
* `crontab -l` 查看当前计划任务
* `crontab -r` 删除某条计划任务
* `crontab -l -u ${username}` 如果您是以管理员的身份登录的系统，还可以在crontab命令中加上-u参数来编辑他人的计划任务。


分、时、日、月、星期 命令

crond设置任务的参数字段说明

| 字段 | 说明                                     |
| ---- | ---------------------------------------- |
| 分钟 | 取值为0～59的整数                        |
| 小时 | 取值为0～23的任意整数                    |
| 日期 | 取值为1～31的任意整数                    |
| 月份 | 取值为1～12的任意整数                    |
| 星期 | 取值为0～7的任意整数，其中0与7均为星期日 |
| 命令 | 要执行的命令或程序脚本                   |

分、时、日、月、星期中可以有如下几种格式
* 单个数字 `1` ：代表只是在这个点执行，表明在第一分钟执行一次
* 时间段 `1-5` ：如果是分钟，那么就说明第一到第五分钟，每分钟都执行一次
* 时间段 `1,3,5` ：如果是分钟，那么就说明第一三五分钟，每分钟都执行一次
* 时间间隔 `*/2` ：如果是分钟，表明每隔两分钟执行一次

PS:
* 日和星期最好不好同时写，因为咱们不知道这一天是周几，所以计划任务可能不会被执行

```sh
30 * * * * /usr/sbin/reboot     # 每30分都会重启一次
30 1 * * * /usr/sbin/reboot     # 每天的1点30分都会重启一次
30 1 2 * * /usr/sbin/reboot     # 每月2号的1点30分都会重启一次
30 1 2 3 * /usr/sbin/reboot     # 每年的3月2号的1点30分都会重启一次
30 1 * 3 5 /usr/sbin/reboot     # 每年的3月的每个周五的1点30分都会重启一次
30 1 * * 5 /usr/sbin/reboot     # 每周五的1点30分都会重启一次
```
```sh
30 1 2-10 3 * /usr/sbin/reboot     # 每年的3月2到10号的1点30分都会重启一次
30 1 2,3,5 3 * /usr/sbin/reboot     # 每年的3月2号3号5号的1点30分都会重启一次
30 1 */2 * * /usr/sbin/reboot     # 每隔两天的1点30分都会重启一次
```

```sh
[root@RHEL7CCIE ~]# crontab -l
no crontab for root
[root@RHEL7CCIE ~]# crontab -e
no crontab for root - using an empty one
crontab: installing new crontab
[root@RHEL7CCIE ~]# crontab -l
30 * * * * echo `date` >> /root/haha
[root@RHEL7CCIE ~]#
```

创建新的计划任务
```sh
[root@RHEL7CCIE ~]# crontab -e
crontab: installing new crontab
[root@RHEL7CCIE ~]#
[root@RHEL7CCIE ~]# crontab -l
30 * * * * echo `date` >> /root/haha
*/2 * * * * echo `date` >> /root/haha
[root@RHEL7CCIE ~]# cat /root/haha
[root@RHEL7CCIE ~]# cat /root/haha
Tue Sep 22 19:04:02 CST 2020
[root@RHEL7CCIE ~]# cat /root/haha
Tue Sep 22 19:04:02 CST 2020
Tue Sep 22 19:06:01 CST 2020
[root@RHEL7CCIE ~]#
```

查看用户 miles 的计划任务
```sh
[root@RHEL7CCIE ~]# crontab -l -u miles
no crontab for miles
[root@RHEL7CCIE ~]#
```

删除所有任务
```sh
[root@RHEL7CCIE ~]# crontab -r
[root@RHEL7CCIE ~]# crontab -l
no crontab for root
[root@RHEL7CCIE ~]#
```
