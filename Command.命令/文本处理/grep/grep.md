# grep


Linux系统中grep命令是一种强大的文本搜索工具，它能使用正则表达式搜索文本，并把匹 配的行打印出来。grep全称是Global Regular Expression Print，表示全局正则表达式版本，它的使用权限是所有用户。

语法：  grep [-abcEFGhHilLnqrsvVwxy][-A<显示列数>][-B<显示列数>][-C<显示列数>][-d<进行动作>][-e<范本样式>][-f<范本文件>][--help][范本样式][文件或目录...]


## [options]主要参数:

| 短参数       | 长参数                              | 解释                                                                                                   |   |
| ------------ | ----------------------------------- | ------------------------------------------------------------------------------------------------------ | - |
| -a           | --text                              | 不要忽略二进制的数据。                                                                                 |   |
| -A<显示列数> | --after-context=<显示列数>          | 除了显示符合范本样式的那一列之外，并显示该列之后的内容。                                               |   |
| -b           | --byte-offset                       | 在显示符合范本样式的那一列之前，标示出该列第一个字符的位编号。                                         |   |
| -B<显示列数> | --before-context=<显示列数>         | 除了显示符合范本样式的那一列之外，并显示该列之前的内容。                                               |   |
| `-c`         | --count                             | 计算符合范本样式的列数。                                                                               |   |
| -C<显示列数> | --context=<显示列数> 或 -<显示列数> | 除了显示符合范本样式的那一列之外，并显示该列之前后的内容。                                             |   |
| -d<进行动作> | --directories=<进行动作>            | 当指定要查找的是目录而非文件时，必须使用这项参数，否则grep指令将回报信息并停止动作。                   |   |
| -e<范本样式> | --regexp=<范本样式>                 | 指定字符串做为查找文件内容的范本样式。                                                                 |   |
| -E           | --extended-regexp                   | 将范本样式为延伸的普通表示法来使用。                                                                   |   |
| -f<范本文件> | --file=<范本文件>                   | 指定范本文件，其内容含有一个或多个范本样式，让grep查找符合范本条件的文件内容，格式为每列一个范本样式。 |   |
| -F           | --fixed-regexp                      | 将范本样式视为固定字符串的列表。                                                                       |   |
| -G           | --basic-regexp                      | 将范本样式视为普通的表示法来使用。                                                                     |   |
| -h           | --no-filename                       | 在显示符合范本样式的那一列之前，不标示该列所属的文件名称。                                             |   |
| -H           | --with-filename                     | 在显示符合范本样式的那一列之前，表示该列所属的文件名称。                                               |   |
| `-i`         | --ignore-case                       | 忽略字符大小写的差别。                                                                                 |   |
| -l           | --file-with-matches                 | 列出文件内容符合指定的范本样式的文件名称。                                                             |   |
| -L           | --files-without-match               | 列出文件内容不符合指定的范本样式的文件名称。                                                           |   |
| `-n`         | --line-number                       | 在显示符合范本样式的那一列之前，标示出该列的列数编号。                                                 |   |
| -q           | --quiet 或 --silent                 | 不显示任何信息。                                                                                       |   |
| -r           | --recursive                         | 此参数的效果和指定“-d recurse”参数相同。                                                               |   |
| -s           | --no-messages                       | 不显示错误信息。                                                                                       |   |
| `-v`         | --revert-match                      | 反转查找。                                                                                             |   |
| -V           | --version                           | 显示版本信息。                                                                                         |   |
| -w           | --word-regexp                       | 只显示全字符合的列。                                                                                   |   |
| -x           | --line-regexp                       | 只显示全列符合的列。                                                                                   |   |
| -y           |                                     | 此参数的效果和指定“-i”参数相同。                                                                       |   |
|              | --help                              | 在线帮助。                                                                                             |   |


## pattern正则表达式主要参数:

| 参数    | 解释                                         |
| ------- | -------------------------------------------- |
| `\`     | 忽略正则表达式中特殊字符的原有含义。         |
| `^`     | 匹配正则表达式的开始行。                     |
| `$`     | 匹配正则表达式的结束行。                     |
| `\<`    | 从匹配正则表达式的行开始。                   |
| `\>`    | 到匹配正则表达式的行结束。                   |
| `[ ]`   | 单个字符，如[A]即A符合要求 。                |
| `[ - ]` | 范围，如[A-Z]，即A、B、C一直到Z都符合要求 。 |
| `.`     | 所有的单个字符。                             |
| `*`     | 有字符，长度可以为0。                        |


## grep命令使用简单实例:

    $ grep 'test' d*
    显示所有以d开头的文件中包含 test的行。

    $ grep 'test' aa bb cc
    显示在aa，bb，cc文件中匹配test的行。

    $ grep '[a-z]\{5\}' aa
    显示所有包含每个字符串至少有5个连续小写字符的字符串的行。

    $ grep 'w\(es\)t.*\1' aa
    如果west被匹配，则es就被存储到内存中，并标记为1，然后搜索任意个字符(.*)，这些字符后面紧跟着 另外一个es(\1)，找到就显示该行。如果用egrep或grep -E，就不用”\”号进行转义，直接写成'w(es)t.*\1'就可以了。


## grep命令使用复杂实例:

    假设您正在'/usr/src/Linux/Doc'目录下搜索带字符 串'magic'的文件：
    $ grep magic /usr/src/Linux/Doc/*
    sysrq.txt:* How do I enable the magic SysRQ key?
    sysrq.txt:* How do I use the magic SysRQ key?
    其中文件'sysrp.txt'包含该字符串，讨论的是 SysRQ 的功能。
    默认情况下，'grep'只搜索当前目录。如果 此目录下有许多子目录，'grep'会以如下形式列出：
    grep: sound: Is a directory
    这可能会使'grep' 的输出难于阅读。这里有两种解决的办法：
    明确要求搜索子目录：grep -r
    或忽略子目录：grep -d skip
    如果有很多 输出时，您可以通过管道将其转到'less'上阅读：
    $ grep magic /usr/src/Linux/Documentation/* | less
    这样，您就可以更方便地阅读。
    有一点要注意，您必需提供一个文件过滤方式(搜索全部文件的话用 *)。如果您忘了，'grep'会一直等着，直到该程序被中断。如果您遇到了这样的情况，按 <CTRL c> ，然后再试。


## 下面还有一些有意思的命令行参数:

    grep -i pattern files ：不区分大小写地搜索。默认情况区分大小写，
    grep -l pattern files ：只列出匹配的文件名，
    grep -L pattern files ：列出不匹配的文件名，
    grep -w pattern files ：只匹配整个单词，而不是字符串的一部分(如匹配'magic'，而不是'magical')，
    grep -C number pattern files ：匹配的上下文分别显示[number]行，
    grep pattern1 | pattern2 files ：显示匹配 pattern1 或 pattern2 的行，
    grep pattern1 files | grep pattern2 ：显示既匹配 pattern1 又匹配 pattern2 的行。
    grep -n pattern files  即可显示行号信息
    grep -c pattern files  即可查找总行数


## 这里还有些用于搜索的特殊符号：  :

    \< 和 \> 分别标注单词的开始与结尾。
    例如：
    grep man * 会匹配 'Batman'、'manic'、'man'等，
    grep '\<man' * 匹配'manic'和'man'，但不是'Batman'，
    grep '\<man\>' 只匹配'man'，而不是'Batman'或'manic'等其他的字符串。
    '^'：指匹配的字符串在行首，
    '$'：指匹配的字符串在行 尾，




















grep 匹配制表符 和 换行符的命令


## code:


    [root@dhcp-9-79 ~]# ls
    anaconda-ks.cfg log.txt mno.txt original-ks.cfg
    [root@dhcp-9-79 ~]# cat log.txt 
    ok
    [root@dhcp-9-79 ~]# grep $'\n' log.txt 
    ok
    [root@dhcp-9-79 ~]# grep $'\t' log.txt 
    ok
















