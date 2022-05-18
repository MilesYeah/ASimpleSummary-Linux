
## 一般linux系统，开机启动过程如下：

boot>> loader >>kernel >>init >> inittab >>rcS.conf >> rc.conf >> rc2.d >> rc.local

对于centos系列的系统，init进程会读取/etc/inittab(文件内容如下id:5:initdefault:),决定启动的runlevel，系统初始化由/etc/init/rcS.conf完成，不runlevel的初始化由/etc/init/rc.conf进行选择，然后由特定的脚本文件/etc/rc.d/rc2来执行，注意rc2是一个目录，下面的文件实际上是指向/etc/init.d/中的文件链接。rc.local会在所以初始化工作的随后来执行。所以，对于用户而言，如果我们想要我们的修改对于所有的启动级别都生效，那么需要改动rc.local；如果需要改动默认的runlvel，需要改动inittab。

ubuntu的启动过程与centos系列系统类似，但是在runlevel的处理上有所不同。centos是由文本配置文件来决定runlevel，ubuntu系统是由由/var/run/utmp来决定了，这个文件会被reboot等程序不断改写，里面保存的是上一次的runlevel.使用runlevel命令，可以查看当前runlevel.

初始化完成后，就是登录，执行特定的脚本文件，完成环境变量的初始化。



