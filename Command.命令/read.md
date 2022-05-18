# read 读取来自键盘输入的变量

要读取来自键盘输入的变量，就用 `read` 。   
这个指令最常被用在 shell script 中，想要跟使用者有一些交互。

read 之后不加任何参数，直接加上变量名称，那么下面就会主动出现一个空白行等待你的输入（如 Sample1）； 
如果加上 `-t` 后面接秒数，如范例二，那么 30 秒之内没有任何动作时， 该指令就会自动略过了；
如果是加上 `-p` 在输入的光标前就会有比较多可以用的提示字符给我们参考！

```sh
[dmtsai@study ~]$ read [-pt] variable
选项与参数：
-p  ：后面可以接提示字符！
-t  ：后面可以接等待的“秒数！” 不会一直等待使用者！
```
```sh
# Sample1 : 让使用者由键盘输入一内容，将该内容变成名为 atest 的变量
[dmtsai@study ~]$ read atest
This is a test          <==此时光标会等待你输入！请输入左侧文字看看
[dmtsai@study ~]$ echo ${atest}
This is a test          <==你刚刚输入的数据已经变成一个变量内容！

# Sample2 : 提示使用者 30 秒内输入自己的大名，将该输入字串作为名为 named 的变量内容
[dmtsai@study ~]$ read -p "Please keyin your name: " -t 30 named
Please keyin your name: VBird Tsai   <==注意看，会有提示字符！
[dmtsai@study ~]$ echo ${named}
VBird Tsai        <==输入的数据又变成一个变量的内容了！
```


