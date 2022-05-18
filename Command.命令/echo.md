

## echo 字符串的输出

echo命令用于在终端输出字符串或变量提取后的值，格式为: `echo [字符串 | $变量]`。


| 选项 | 作用         |
| ---- | ------------ |
| -e   | 显示特殊字符 |




```sh
# 输出字符串
[root@dell_tower ~]# echo "Happy Marriage 25th anniversary"
Happy Marriage 25th anniversary

# 输出变量内容
[root@dell_tower ~]# echo $SHELL
/bin/bash

# 转义特殊字符，其中\n为换行符，\t为水平制表符即Tab
[root@dell_tower ~]# echo -e "Hello $SHELL.\nNice to meet\tU."
Hello /bin/bash.
Nice to meet    U.
```


