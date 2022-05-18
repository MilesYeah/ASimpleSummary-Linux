# Process_substitution

关于shell的进程替换process substitution，日志文件与屏幕同显：exec &> >(tee "$log_file")的解释说明

置顶 跃祥666888 2018-10-22 11:28:24  2086  收藏 2
分类专栏： linux内核学习 FPGA
一、解释进程替换

进程替换仅仅在支持命名管道（FIFO）或/dev/fd来命名打开的文件的系统上可用。它采取的形式是：
```
<(list)
```
或
```
>(list)
```
进程list运行时，输入或输出连接到FIFO或在/dev/fd中的文件。作为扩展的结果，把此文件名作为参数传递到当前命令。如果使用>(list)的形式，对该文件的写入，将为list提供输入。如果使用<(list)形式时，作为参数传递的文件应被读取，以获得list的输出。需要注意的<或>和左括号之间是没有空格的，否则将被解释为重定向。
当进程替换可用时，进程替换和参数变量扩展，命令替换和算术扩展，同时进行。

===============================初步解释============================

上面是官方手册给出的解释，说的可能有点晦涩难懂，不用急，下面慢慢说来：

进程替换会跟/dev/fd/<n>系统中的文件关联起来，该系统文件会作为参数传递给其他命令，其他命令对该文件进行的是读取还是输出到该文件取决于进程替换格式是小于号还是大于号。如果是>()格式(大于号表示输入到括号中)：该系统文件为括号中的命令提供输入，如果是<()格式(小于号表示从括号中输出出去)：该/dev/fd/<n>文件接收括号中命令的输出，然后该文件被其他命令作为参数读取以获得括号中命令的输出。

=========================如果还是不懂，看下面例子=========================

举例子：exec &> >(tee "$log_file") #将shell脚本中标准输出和错误输出都写入日志文件中同时在屏幕上显示。

进程替换指的是一个命令的输出作为另一个命令的输入，>()等效为/dev/fd/<n>文件，也就是exec &> /dev/fd/<n>，将标准输出和错误输出都重定向到/dev/fd/<n>文件中，<n>表示第n号文件，可以去该目录下看看，有很多序号的文件，一般用的是63号文件，该文件是系统内部，你查看不到的。

之后进程替换中的tee命令读取/dev/fd/<n>文件作为括号中tee命令的输入(也就是读取/dev/fd/<n>文件)。

说明：tee命令是需要输入的，将输入到该命令的文本同时输出到屏幕和参数指定的文件中。

============================================

回头再看官方解释应该就觉得还是官方解释的简洁到位。

另外不是任何命令都支持进程替换的

实现机制：进程替换有两种实现方式，在支持/dev/fd的系统中，他通过调用pipe()系统调用来实现，这个系统调用将为新的匿名管道返回一个文件描述符，然后创建字串/dev/fd/$fd，再替换命令行。在不支持/dev/fd的系统中，它将调用mkfifo命令后跟一个临时文件名来创建一个命名管道(named pipe),之后在命令行中替换为这个文件名。为了阐明所涉及的步骤，考虑下面支持/dev/fd的系统上的简单的命令替换：

diff file1 <(sort file2)
shell执行步骤：

1. 创建一个新的匿名管道。这个管道可以用类似/dev/fd/63的东西来访问；你可以用类似echo <(true)的命令来查看它(译者注：它这里指/dev/fd/63)。

2. 在后台执行进程替换的命令（这里指sort file2），将其输出管道连接到匿名管道。

3. 执行主要的命令，用匿名管道的路径替换这个进程替换指令(指<(……)这种指令格式)，在这个例子中，完全的命令可以被展开成如下形式：

diff file1 /dev/fd/63

 4. 执行完成后，关闭匿名管道。

对于命名管道，在管道的创建和删除方面的执行过程是完全不同的。创建使用mkfifo，删除使用unlink，其余方面都差不多。

参考资料：

https://en.wikipedia.org/wiki/Process_substitution






## another 
Use process substitution with & redirection and exec:
```sh
exec &> >(tee -a "$log_file")
echo "This will be logged to the file and to the screen"
```
* `$log_file` will contain the output of the script and any subprocesses, and the output will also be printed to the screen.
* `>(...)` starts the process `...` and returns a file representing its standard input.
* `exec &> ...` redirects both standard output and standard error into `...` for the remainder of the script (use just `exec > ...` for stdout only).
* `tee -a` appends its standard input to the file, and also prints it to the screen.





## instance

```sh
StartLogging() {
	flowPhase=$(grep PHASE flowLog 2>/dev/null | awk -F= '{print $2}')
	if [ -v $flowPhase ]; then
    		flowPhase=STARTING
	fi
	LOG_LOCATION=/tmp/PROCESS.$flowPhase.$(date +%Y_%m_%d_%H_%M_%S).log
	exec > >(tee -i $LOG_LOCATION)
	exec 2>&1
}
```


