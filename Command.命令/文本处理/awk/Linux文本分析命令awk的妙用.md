


[Linux文本分析命令awk的妙用](https://www.itcodemonkey.com/article/13545.html)

2019-03-18 11:15:35 分类：Linux学习
来自：Java识堂，作者：李立敏

## 基本用法
awk是一个强大的文本分析工具，简单来说awk就是把文件逐行读入，（空格，制表符）为默认分隔符将每行切片，切开的部分再进行各种分析处理



awk命令格式如下
```sh
awk [-F field-separator] 'commands' input-file(s)
```

[-F 分隔符]是可选的，因为awk使用空格，制表符作为缺省的字段分隔符，因此如果要浏览字段间有空格，制表符的文本，不必指定这个选项，但如果要浏览诸如/etc/passwd文件，此文件各字段以冒号作为分隔符，则必须指明-F选项


```sh
echo "this is a test" | awk '{ print $0 }'

## 输出为
this is a test
```

shell读取用户输入的字符串发现|，代表有管道。|左右被理解为简单命令，即前一个（左边）简单命令的标准输出指向后一个（右边）标准命令的标准输入



awk会根据分隔符将行分成若干个字段，$0为整行，$1为第一个字段，$2 为第2个地段，依此类推…



为打印一个字段或所有字段，使用print命令。这是一个awk动作


```sh
echo "this is a test" | awk '{ print $1 }'
## 输出为
this

echo "this is a test" | awk '{ print $1, $2 }'
## 输出为
this is
```

/etc/passwd的文件内容如下
```sh
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin
lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
```

举几个简单的小需求
1.只显示/etc/passwd的账户


```sh
awk -F : '{ print $1 }' /etc/passwd

## 输出为
root
bin
daemon
adm
lp
```

2.显示/etc/passwd的第1列和第7列，用逗号分隔显示，所有行开始前添加列名start1，start7，最后一行添加，end1，end7


```sh
awk -F ':' 'BEGIN {print "start1,start7"} {print $1 "," $7} END {print "end1,end7"}' /etc/passwd

## 输出为
start1,start7
root,/bin/bash
bin,/sbin/nologin
daemon,/sbin/nologin
adm,/sbin/nologin
lp,/sbin/nologin
end1,end7
```

BEGIN语句在所有文本处理动作执行之前被执行，END在所有文本处理动作执行之后被执行



3.统计/etc/passwd文件中，每行的行号，每行的列数，对应的完整行内容


```sh
awk -F : '{ print NR "\t" NF "\t" $0 }' /etc/passwd

## 输出为
1    7   root:x:0:0:root:/root:/bin/bash
2    7   bin:x:1:1:bin:/bin:/sbin/nologin
3    7   daemon:x:2:2:daemon:/sbin:/sbin/nologin
4    7   adm:x:3:4:adm:/var/adm:/sbin/nologin
5    7   lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
```

## 支持内置变量
上面示例中NR，和NF其实就是awk的内置变量，一些内置变量如下



变量名 | 解释
---|---
FILENAME | awk浏览的文件名
FS | 设置输入字段分隔符，等价于命令行-F选项
NF | 浏览记录的字段个数
NR | 已读的记录数


## 支持函数
输出字符串的长度
```sh
awk 'BEGIN { print length("this is a text") }'

## 输出为
14
```

将/etc/passwd的用户名变成大写输出
```sh
awk -F ':' '{ print toupper($1) }' /etc/passwd

## 输出为
ROOT
BIN
DAEMON
ADM
LP
```

常用函数如下

函数名 | 作用
---|---
toupper(s) | 返回s的大写
tolower(s) | 返回s的小写
length(s) | 返回s长度
substr(s,p) | 返回字符串s中从p开始的后缀部分


## 支持条件操作，正则表达式匹配


显示/etc/passwd中有daemon的行


```sh
awk -F ':' '$0 ~ /daemon/' /etc/passwd

## 输出为
daemon:x:2:2:daemon:/sbin:/sbin/nologin
```

awk条件操作符

操作符 | 描述
---|---
< | 小于
<= | 小于等于
== | 等于
!= | 不等于
~ | 匹配正则表达式
!~ | 不匹配正则表达式


## 支持流程控制语句，类C语言


if while do/while for break continue

输出第一个字段的第一个字符大于d的行


```sh
awk -F ':' '{ if ($1 > "d") { print $1 } else { print "-" } }' /etc/passwd

## 输出为
root
-
daemon
-
lp
```

可以把流程控制语句放到一个脚本中，然后调用脚本执行，如test.sh的内容如下


```sh
{ 
    if ($1 > "d") {
        print $1 
    } else {
        print "-" 
    } 
}
```

用如下方式执行，效果一样
```sh
awk -F ':' -f test.sh /etc/passwd

## 输出为
root
-
daemon
-
lp
```

## 应用场景


小编用awk进行文本分析比较少，主要用来写脚本
如一个weibo-interface-1.0.jar应用，启动脚本如下
start.sh


```sh
nohup java -jar weibo-interface-1.0.jar >out 2>&1 &
```

关闭脚本如下，kill.sh
```sh
kill -9 `jps -l | grep 'weibo-interface-1.0.jar' | awk '{print $1}'`
```

jps -l的输出如下
```sh
70208 com.st.kmp.main.KmpService
31036 com.st.cis.main.BaiduAnalysisService
66813 weibo-interface-1.0.jar
```

还有就是关闭hadoop集群的所有DataNode节点（不知道hadoop的可以认为DataNode是一个集群应用），假如一个个机器jps，查看pid，kill。很麻烦，直接写了一个脚本，依次ssh到各个节点，然后执行如下命令即可


```sh
kill `jps | grep 'DataNode' | awk '{print $1}'`
```

jps的输出为
```sh
508 DataNode
31481 JournalNode
31973 NodeManager
```
