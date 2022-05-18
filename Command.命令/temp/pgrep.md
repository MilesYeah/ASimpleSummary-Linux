pgrep

pgrep名字前有个p，我们可以猜到这和进程相关，又是grep，当然这是进程相关的grep命令。不过，这个命令主要是用来列举进程ID的。如：

$ pgrep -u hchen
22441
22444
这个命令相当于：

ps -ef | egrep '^hchen' | awk '{print $2}'
