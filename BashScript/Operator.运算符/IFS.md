# IFS

在linux中IFS是分隔符的意思，linux中变量分两种，全局变量env和局部变量set，set中包含了env的全部变量，我们查看IFS的值发现env | grep IFS为空，而set | grep IFS有值，说明IFS是局部变量，
```sh
[root@localhost ~]# set | grep ^IFS
IFS=$' \t\n'
[root@localhost ~]# 
```
从上面可以看出，IFS是已空格、制表符、换行符来进行分隔的。


IFS默认值是空格、制表符和换行符，此处以换行符\n来讨论，`IFS='\n'`，`IFS=$"\n"`，`IFS=$'\n'`，
* 第一个和第二个是等价的，就是普通字符反斜杠和n，
* 第三个是一个先转换为了回车符NL，在屏幕上直接就回车了。

```sh
[root@localhost ~]# echo "\n"
\n
[root@localhost ~]# echo $"\n"
\n
[root@localhost ~]# echo $'\n'


[root@localhost ~]# 
```



总结：
1. IFS="\n"和IFS=$"\n"等价，都是以反斜杠\ 和 英文字母n为分隔符，IFS=$'\n'则是以转化后的换行(即为按住Enter键的效果)为分隔符

2.出现多个空格并列为一个空格，多个除空格外的换行符并列出现时，如IFS="\n";str1="a\nb\nc" 或 IFS="&";str2="a&&b&&c" ，此时换行符\和字母n都作为str1的分隔符，&作为str2的换行符，则连续的两个换行符中间会出现一个空字符''，如上面脚本示例中的调试代码中出现的 ''

3. IFS="\n"和IFS=$"\n"都是表示反斜杠\ 和 英文字母n为分隔符，和按住Enter键的效果不是一回事，IFS=$'\n'表示按住Enter键的效果










## ref
* [linux中分隔符IFS](https://blog.csdn.net/earthchinagl/article/details/80804893)
* []()
* []()
* []()
* []()
* []()
* []()
