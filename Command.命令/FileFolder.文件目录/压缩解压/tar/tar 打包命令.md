
tar 打包命令

操作命令：

打包与压缩：tar [-j|-z] [cv] [-f 文件名]

查看文件： tar [-j|-z] [tv] [-f 文件名]

解压缩： tar [-j|-z] [xv] [-f 文件名] [-c 目录]

主要参数：

	-c: 建立打包文件，可搭配-v来查看过程中被打包的文件名

	-t: 查看打包文件内含有哪些文件

	-x: 解压缩或解打包功能，可以配合-C（大写）在特定目录解开，-c,-t,-x不能同时出现在一串命令中

	-j: 通过bzip2的支持进行压缩/解压缩：此文件名最好为*.tar.bz2

	-z: 通过gzip的支持进行压缩/解压缩：此文件名最好为*.tar.gz

	-v: 在压缩/解压缩的过程中，将正在处理的文件名显示出来

	-f filename: -f后面要立刻接要被处理的文件名

	-C 目录:这个选项用在解压缩，在特定目录解压缩可以使用这个选项

	-p:（小写p）保留备份数据的原本权限与属性，通常用于备份重要的配置文件，很重要的参数

	-P:（大写P）保留绝对路径，允许备份数据中含有根目录存在

	--exclude=FILE:在压缩的过程中，不要将FILE打包

	技巧：



解压缩包内单一文件的方法



tar -jtv -f 目录/文件名.tar.bz2 | grep ‘查找的字符串’

grep是搜索关键词的功能，找到目标目录后

tar -jxv -f 打包文件名.tar.bz2 解开目标目录

打包某目录，但不含该目录下某些文件的方法



tar -jcv -f /root/etc.tar.bz2 --exclude=/root/etc* > --exclude=/root/etc.tar.bz2 /etc /root

仅备份比某个时刻还要新的档案



	--newer选项和--newer-mtime

	--newer表示后面含有mtime 与 ctime

	--newer-mtime则仅是mtime

使用find /etc -newer /etc/passwd找出比较新的文件

找一个目标文件的时间

tar -jcv -f /root/etc.tar.bz2 > --newer-mtime="2011/10/3" /etc/*










