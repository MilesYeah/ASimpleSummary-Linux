# 跳出循环
在循环过程中，有时候需要在未达到循环结束条件时强制跳出循环，Shell使用两个命令来实现该功能：break和continue。

## break
break命令允许跳出所有循环（终止执行后面的所有循环）。
下面的例子中，脚本进入死循环直至用户输入数字大于5。要跳出这个循环，返回到shell提示符下，需要使用break命令。

## continue
continue命令与break命令类似，只有一点差别，它不会跳出所有循环，仅仅跳出当前循环。


```sh
[root@dell_tower miles]# cat no_jump.sh ; echo -e "\nNow we execute script:"; ./no_jump.sh
#!/bin/bash
i=0
while [ $i -le 10 ]
do
        (( i++ ))
        echo $i
done

Now we execute script:
1
2
3
4
5
6
7
8
9
10
11
[root@dell_tower miles]#
```

```sh
[root@dell_tower miles]# cat how_break.sh ; echo -e "\nNow we execute script:"; ./how_break.sh
#!/bin/bash
i=0
while [ $i -le 10 ]
do
        (( i++ ))
        if [ $i -ge 5 ]; then
                break
        fi
        echo $i
done

Now we execute script:
1
2
3
4
[root@dell_tower miles]#
```

```sh
[root@dell_tower miles]# cat how_continue.sh ; echo -e "\nNow we execute script:"; ./how_continue.sh
#!/bin/bash
i=0
while [ $i -le 10 ]
do
        (( i++ ))
        if [ $i -le 5 ]; then
                continue
        fi
        echo $i
done

Now we execute script:
6
7
8
9
10
11
[root@dell_tower miles]#
```



