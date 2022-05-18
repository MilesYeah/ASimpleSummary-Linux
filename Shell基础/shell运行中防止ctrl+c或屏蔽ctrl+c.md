
# [shell运行中防止ctrl+c或屏蔽ctrl+c](https://blog.csdn.net/azhangyi188/article/details/23253825)


2014年04月09日 10:45:11 天涯一道 阅读数：4303


在shell中,我们一般不希望用户发出ctrl+c来中断运行中的shell.通常用到trap命令
trap语法如下 :
 `trap command signal`
trap命令的参数分为两部分，前一部分是接收到指定信号时将要采取的行动，后一部分是要处理的信号名.请记住，脚本程序通常是以从上到下的顺序解释执行的，所以必须在你想保护的那部分代码以前指定trap命令。
如果要重置某个信号的处理条件到其默认值，只需简单的将command设置为-。如果要忽略某个信号，就把command设置为空字符串‘’。一个不带参数的trap命令将列出当前设置的信号及其行动的清单。

| 信     号 | 说     明                            |
| --------- | ------------------------------------ |
| HUP(1)    | 挂起，通常因终端掉线或用户退出而引发 |
| INT(2)    | 中断，通常因按下Ctrl+C组合键而引发   |
| QUIT(3)   | 退出，通常因按下Ctrl+\组合键而引发   |
| ABRT(6)   | 中止，通常因某些严重的执行错误而引发 |
| ALRM(14)  | 报警，通常用来处理超时               |
| TERM(15)  | 终止，通常在系统关机时发送           |

如下面的shell
```sh
#!/bin/bash
trap '' INT
```






# [在shell中通过trap控制ctrl+c](https://blog.csdn.net/ace_fei/article/details/7052528)

2011-12-08 10:37:02 ace_fei 阅读数 4607更多
分类专栏： SHELL
版权声明：本文为博主原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接和本声明。
本文链接：https://blog.csdn.net/ace_fei/article/details/7052528
```sh
#!/bin/bash
 
trap '{ echo "Hey, you pressed Ctrl-C.  Time to quit." ; exit 1; }' INT
echo "Counting to 5 slowly, press Ctrl-C to interrupt."
for number in 1 2 3 4 5; do
        echo $number
        sleep 1
done
 
trap '' INT
echo "Counting to 5 again, but pressing Ctrl-C shouldn't work."
for number in 1 2 3 4 5; do
        echo $number
        sleep 1
done
 
trap - INT
echo "One more time, but Ctrl-C should work again."
for number in 1 2 3 4 5; do
        echo $number
        sleep 1
done
exit 0
```

