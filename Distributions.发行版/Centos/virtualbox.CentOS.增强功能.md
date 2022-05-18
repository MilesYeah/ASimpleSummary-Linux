# virtualbox.CentOS.增强功能




## kernel headers not found for target kernel

原因已经表明出来了,说明kernel headers 没有安装;

直接贴出解决方案:

1. update kernel
    ```sh
    yum update kernel -y
    ```

2. Install the kernel-headers, kernel-devel and other required packages
    ```sh
    yum install kernel-headers kernel-devel gcc make -y
    ```

3. Reboot the server to make sure it load to the new kernel
    ```sh
    init 6
    ```
    ```sh
    yum update kernel -y && yum install kernel-headers kernel-devel gcc make -y && init 6
    ```

4. 重启后安装

    ```sh
    [root@localhost ~]# mount | grep -i vbox
    /dev/sr1 on /run/media/root/VBox_GAs_6.1.20 type iso9660 (ro,nosuid,nodev,relatime,nojoliet,check=s,map=n,blocksize=2048,uid=0,gid=0,dmode=500,fmode=400,uhelper=udisks2)
    [root@localhost ~]# cd /run/media/root/VBox_GAs_6.1.20
    [root@localhost VBox_GAs_6.1.20]# ll
    total 46855
    -r--r--r--. 1 root root      763 Feb 20  2020 AUTORUN.INF
    -r-xr-xr-x. 1 root root     6384 Apr 20 12:46 autorun.sh
    dr-xr-xr-x. 2 root root      792 Apr 20 12:54 cert
    dr-xr-xr-x. 2 root root     1824 Apr 20 12:54 NT3x
    dr-xr-xr-x. 2 root root     2652 Apr 20 12:54 OS2
    -r-xr-xr-x. 1 root root     4821 Apr 20 12:46 runasroot.sh
    -r--r--r--. 1 root root      547 Apr 20 12:54 TRANS.TBL
    -r--r--r--. 1 root root  3990728 Apr 20 12:50 VBoxDarwinAdditions.pkg
    -r-xr-xr-x. 1 root root     3949 Apr 20 12:46 VBoxDarwinAdditionsUninstall.tool
    -r-xr-xr-x. 1 root root  7423411 Apr 20 12:47 VBoxLinuxAdditions.run
    -r--r--r--. 1 root root  9406464 Apr 20 12:45 VBoxSolarisAdditions.pkg
    -r-xr-xr-x. 1 root root 16880768 Apr 20 12:51 VBoxWindowsAdditions-amd64.exe
    -r-xr-xr-x. 1 root root   270784 Apr 20 12:47 VBoxWindowsAdditions.exe
    -r-xr-xr-x. 1 root root  9982112 Apr 20 12:49 VBoxWindowsAdditions-x86.exe
    [root@localhost VBox_GAs_6.1.20]#
    [root@localhost VBox_GAs_6.1.20]# ./VBoxLinuxAdditions.run
    Verifying archive integrity... All good.
    Uncompressing VirtualBox 6.1.20 Guest Additions for Linux........
    VirtualBox Guest Additions installer
    Removing installed version 6.1.14 of VirtualBox Guest Additions...
    Copying additional installer modules ...
    Installing additional modules ...
    VirtualBox Guest Additions: Starting.
    VirtualBox Guest Additions: Building the VirtualBox Guest Additions kernel
    modules.  This may take a while.
    VirtualBox Guest Additions: To build modules for other installed kernels, run
    VirtualBox Guest Additions:   /sbin/rcvboxadd quicksetup <version>
    VirtualBox Guest Additions: or
    VirtualBox Guest Additions:   /sbin/rcvboxadd quicksetup all
    VirtualBox Guest Additions: Building the modules for kernel
    3.10.0-1160.25.1.el7.x86_64.
    [root@localhost VBox_GAs_6.1.20]#
    [root@localhost VBox_GAs_6.1.20]#
    ```

    安装失败，提示 log 可以在 /var/log/vboxadd-setup.log 中找到
    ```sh
    [root@localhost ~]# cat /var/log/vboxadd-setup.log
    Building the main Guest Additions 6.1.20 module for kernel 4.18.0-240.22.1.el8_3.x86_64.
    Error building the module.  Build output follows.
    make V=1 CONFIG_MODULE_SIG= CONFIG_MODULE_SIG_ALL= -C /lib/modules/4.18.0-240.22.1.el8_3.x86_64/build M=/tmp/vbox.0 SRCROOT=/tmp/vbox.0 -j4 modules
    make[1]: warning: -jN forced in submake: disabling jobserver mode.
    Makefile:978: *** "Cannot generate ORC metadata for CONFIG_UNWINDER_ORC=y, please install libelf-dev, libelf-devel or elfutils-libelf-devel".  Stop.
    make: *** [/tmp/vbox.0/Makefile-footer.gmk:117: vboxguest] Error 2
    modprobe vboxguest failed
    modprobe vboxguest failed
    [root@localhost ~]#
    [root@localhost ~]# yum -y install elfutils-libelf-devel
    [root@localhost ~]#
    ```
    由 log 可见 系统还需要 libelf-dev, libelf-devel or elfutils-libelf-devel 这三个库中的一个
    尝试使用 yum 安装，只有 elfutils-libelf-devel 可以安装，安装 elfutils-libelf-devel 后再重试执行 `./VBoxLinuxAdditions.run`





## VirtualBox ValueError VBoxGuestAdditions mount.vboxsf already defined

```sh
[root@localhost VBox_GAs_6.1.20]# ./VBoxLinuxAdditions.run
Verifying archive integrity... All good.
Uncompressing VirtualBox 6.1.20 Guest Additions for Linux........
VirtualBox Guest Additions installer
Removing installed version 6.1.20 of VirtualBox Guest Additions...
Copying additional installer modules ...
Installing additional modules ...
VirtualBox Guest Additions: Starting.
VirtualBox Guest Additions: Building the VirtualBox Guest Additions kernel
modules.  This may take a while.
VirtualBox Guest Additions: To build modules for other installed kernels, run
VirtualBox Guest Additions:   /sbin/rcvboxadd quicksetup <version>
VirtualBox Guest Additions: or
VirtualBox Guest Additions:   /sbin/rcvboxadd quicksetup all
VirtualBox Guest Additions: Building the modules for kernel
4.18.0-240.22.1.el8_3.x86_64.
ValueError: File context for /opt/VBoxGuestAdditions-6.1.20/other/mount.vboxsf already defined
[root@localhost VBox_GAs_6.1.20]#
```

```sh
[root@localhost VBox_GAs_6.1.20]# semanage fcontext -d /opt/VBoxGuestAdditions-6.1.20/other/mount.vboxsf
[root@localhost VBox_GAs_6.1.20]# restorecon /opt/VBoxGuestAdditions-6.1.20/other/mount.vboxsf
[root@localhost VBox_GAs_6.1.20]#

semanage fcontext -d /opt/VBoxGuestAdditions-6.1.20/other/mount.vboxsf && restorecon /opt/VBoxGuestAdditions-6.1.20/other/mount.vboxsf

```





## ref
* [文章转载自](https://blog.csdn.net/qq_22156459/article/details/88049089)
* []()
* []()
* []()
* []()
* []()
* []()
* []()
* []()
