bc

这个命令主要是做一个精度比较高的数学运算的。比如开平方根等。下面是一个我们利用bc命令写的一个脚本（文件名：sqrt）

#!/bin/bash

if [ $
then
    echo 'Usage: sqrt number'
    exit 1
else
    echo -e "sqrt($1)\nquit\n" | bc -q -i
fi
于是，我们可以这样使用这个脚本进行平方根运算：

[hchen@RHELSVR5]$ ./sqrt 36
6
[hchen@RHELSVR5]$ ./sqrt 2.0000
1.4142
[hchen@RHELSVR5]$ ./sqrt 10.0000
3.1622


