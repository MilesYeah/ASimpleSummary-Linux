# eval

Linux eval命令用于重新运算求出参数的内容。

eval可以读取一连串的参数，然后按照参数特性来执行。参数数目不限，彼此之间用分号隔开。

eval会对后面的命令进行两遍扫描，
* 如果第一遍扫描后，命令是个普通命令，则执行此命令；
* 如果命令中含有变量的间接引用，则保证间接引用的语义。

也就是说，eval命令将会首先扫描命令行进行所有的置换，然后再执行该命令。
因此，eval命令适用于那些一次扫描无法实现其功能的变量。

eval 执行以下两个步骤：
* 执行变量替换，类似与C语言的宏替代；
* 执行替换后的命令串。


## eval command-line

其中command－line是在终端上键入的一条普通命令行。然而当在它前面放上eval时，其结果是shell在执行命令行之前扫描它两次。如：
```sh
pipe="|"
eval ls $pipe wc -l
```
shell第1次扫描命令行时，它替换出pipe的值｜，接着eval使它再次扫描命令行，这时shell把｜作为管道符号了。

如果变量中包含任何需要shell直接在命令行中看到的字符（不是替换的结果），就可以使用eval。命令行结束符（； ｜ &），I／o重定向符（< >）和引号就属于对shell具有特殊意义的符号，必须直接出现在命令行中。

## eval echo /$$# 取得最后一个参数
```sh
cat last
eval echo /$$#
./last one two three four
four
```

第一遍扫描后，shell把反斜杠去掉了。当shell再次扫描该行时，它替换了$4的值，并执行echo命令


## 以下示意如何用eval命令创建指向变量的“指针”：
```sh
x=100
ptrx=x
eval echo /$$ptrx 指向ptrx，用这里的方法可以理解b中的例子
# 100 打印100
eval $ptrx=50 将50存到ptrx指向的变量中。
echo $x
50 
```





```sh
[root@localhost ~]# fun0 () {
>     echo "this is fun0"
>     return 0
> }
[root@localhost ~]# 
[root@localhost ~]# fun1 () {
>     echo "this is fun1"
>     return 1
> }
[root@localhost ~]# 
[root@localhost ~]# fun2 () {
>     echo "this is fun2"
>     return 2
> }
[root@localhost ~]# 
[root@localhost ~]# cmd=fun0; eval $cmd; echo $?
this is fun0
0
[root@localhost ~]# cmd=fun1; eval $cmd; echo $?
this is fun1
1
[root@localhost ~]# cmd=fun2; eval $cmd; echo $?
this is fun2
2
[root@localhost ~]# 
```



## ref
* [【Linux】eval命令的使用](https://blog.csdn.net/her__0_0/article/details/65938894)
* []()
* []()
* []()
* []()
* []()
* []()

