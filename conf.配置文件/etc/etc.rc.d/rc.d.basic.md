
## inittab以及rc

/etc/rc.d/rc则根据其参数指定的运行模式(运行级别，你在inittab文件中可以设置)来执行相应目录下的脚本。凡是以Kxx开头的，都以stop为参数来调用；凡是以Sxx开头的，都以start为参数来调用。调用的顺序按xx从小到大来执行。(其中xx是数字、表示的是启动顺序)例如，假设缺省的运行模式是3，/etc/rc.d/rc就会按上述方式调用/etc/rc.d/rc3.d/下的脚本。

得一提的是，Redhat中的运行模式2、3、5都把/etc/rc.d/rc.local做为初始化脚本中的最后一个，所以用户可以自己在这个文件中添加一些需要在其他初始化工作之后，登录之前执行的命令。

init在等待/etc/rc.d/rc执行完毕之后（因为在/etc/inittab中/etc/rc.d/rc的action是wait），将在指定的各个虚拟终端上运行/sbin/mingetty，等待用户的登录。

运行级别在/etc/inittab 文件里指定。这个文件是init 程序寻找的主要文件，最先运行的服务是放在/etc/rc.d 目录下的文件。在大多数的Linux 发行版本中，启动脚本都是位于 /etc/rc.d/init.d中的。这些脚本被用ln 命令连接到 /etc/rc.d/rcn.d 目录。


