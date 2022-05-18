

### 查看Linux内核版本命令（2种方法）：

1. `cat /proc/version`
2. `uname -a`



### 查看Linux系统版本的命令（3种方法）：

1. `lsb_release -a`
    即可列出所有版本信息：
    这个命令适用于所有的Linux发行版，包括Redhat、SuSE、Debian…等发行版。
 
2. `cat /etc/redhat-release`
    这种方法只适合Redhat系的Linux：
 
3. `cat /etc/issue`
    此命令也适用于所有的Linux发行版。





2. 查看那系统内核版本
```sh
uname -r
3.10.0-514.el7.x86_64

cat /etc/redhat-release 
CentOS Linux release 7.3.1611 (Core)
```



3. 升级内核
Centos 6和Centos 7的升级方法类似，只不过就是选择的YUM源或者rpm包不同罢了，下面主要是Centos 7的安装方法，中间也会有对于Centos 6 升级的方法提示。
* Centos 6 YUM源：http://www.elrepo.org/elrepo-release-6-6.el6.elrepo.noarch.rpm
* Centos 7 YUM源：http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm


升级内核需要先导入elrepo的key，然后安装elrepo的yum源：
```sh
#导入ELRepo软件仓库的公共秘钥
rpm -import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org

# #安装ELRepo软件仓库的yum源
# rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm

# To install ELRepo for RHEL-8 or CentOS-8:
yum install https://www.elrepo.org/elrepo-release-8.el8.elrepo.noarch.rpm


# To install ELRepo for RHEL-7, SL-7 or CentOS-7:
yum install https://www.elrepo.org/elrepo-release-7.el7.elrepo.noarch.rpm
```

仓库启用后，你可以使用下面的命令列出可用的内核相关包，如下:
```sh
[root@iZ2ze1ddoyj3i3p3098r20Z test]# yum --disablerepo="*" --enablerepo="elrepo-kernel" list available
Loaded plugins: langpacks
Available Packages
kernel-lt.x86_64                        4.4.163-1.el7.elrepo       elrepo-kernel
kernel-lt-devel.x86_64                  4.4.163-1.el7.elrepo       elrepo-kernel
kernel-lt-doc.noarch                    4.4.163-1.el7.elrepo       elrepo-kernel
kernel-lt-headers.x86_64                4.4.163-1.el7.elrepo       elrepo-kernel
kernel-lt-tools.x86_64                  4.4.163-1.el7.elrepo       elrepo-kernel
kernel-lt-tools-libs.x86_64             4.4.163-1.el7.elrepo       elrepo-kernel
kernel-lt-tools-libs-devel.x86_64       4.4.163-1.el7.elrepo       elrepo-kernel
kernel-ml-devel.x86_64                  4.19.2-1.el7.elrepo        elrepo-kernel
kernel-ml-doc.noarch                    4.19.2-1.el7.elrepo        elrepo-kernel
kernel-ml-headers.x86_64                4.19.2-1.el7.elrepo        elrepo-kernel
kernel-ml-tools.x86_64                  4.19.2-1.el7.elrepo        elrepo-kernel
kernel-ml-tools-libs.x86_64             4.19.2-1.el7.elrepo        elrepo-kernel
kernel-ml-tools-libs-devel.x86_64       4.19.2-1.el7.elrepo        elrepo-kernel
perf.x86_64                             4.19.2-1.el7.elrepo        elrepo-kernel
python-perf.x86_64                      4.19.2-1.el7.elrepo        elrepo-kernel
```



其中长期维护版本lt为4.4.163，最新主线稳定版ml为4.19

使用如下命令，安装需要的版本：
```sh
yum -y --enablerepo=elrepo-kernel install kernel-ml.x86_64 kernel-ml-devel.x86_64 
```

4. 修改grub中默认的内核版本
内核升级完毕后，目前内核还是默认的版本，如果此时直接执行reboot命令，重启后使用的内核版本还是默认的3.10，不会使用新的4.12.4，首先，我们可以通过命令查看默认启动顺序：
```sh
# awk -F\' '$1=="menuentry " {print $2}' /etc/grub2.cfg
CentOS Linux (4.12.4-1.el7.elrepo.x86_64) 7 (Core)
CentOS Linux (3.10.0-514.el7.x86_64) 7 (Core)
CentOS Linux (0-rescue-a43cc2091b4557f1fd10a52ccffa5db2) 7 (Core)
```

另外一个例子
```sh
[root@localhost ~]# cat  /etc/grub2.cfg | grep menuentry
if [ x"${feature_menuentry_id}" = xy ]; then
  menuentry_id_option="--id"
  menuentry_id_option=""
export menuentry_id_option
menuentry 'Red Hat Enterprise Linux Server (5.4.117-1.el7.elrepo.x86_64) 7.0 (Maipo)' --class red --class gnu-linux --class gnu --class os --unrestricted $menuentry_id_option 'gnulinux-3.10.0-123.el7.x86_64-advanced-abadf7df-4a2b-471d-a58c-6f38b41b7db5' {
menuentry 'Red Hat Enterprise Linux Server, with Linux 3.10.0-123.el7.x86_64' --class red --class gnu-linux --class gnu --class os --unrestricted $menuentry_id_option 'gnulinux-3.10.0-123.el7.x86_64-advanced-abadf7df-4a2b-471d-a58c-6f38b41b7db5' {
menuentry 'Red Hat Enterprise Linux Server, with Linux 0-rescue-6e0dc83b9f07144e928f33afa9e69986' --class red --class gnu-linux --class gnu --class os --unrestricted $menuentry_id_option 'gnulinux-0-rescue-6e0dc83b9f07144e928f33afa9e69986-advanced-abadf7df-4a2b-471d-a58c-6f38b41b7db5' {
[root@localhost ~]#

```


由上面可以看出新内核(4.12.4)目前位置在0，原来的内核(3.10.0)目前位置在1，所以如果想生效最新的内核，还需要修改内核的启动顺序为0：
```sh
# vim /etc/default/grub

GRUB_TIMEOUT=5
GRUB_DISTRIBUTOR="$(sed 's, release .*$,,g' /etc/system-release)"
#GRUB_DEFAULT=saved
# 将默认的 saved 改为 0，也就是新内核的顺序
GRUB_DEFAULT=0
GRUB_DISABLE_SUBMENU=true
GRUB_TERMINAL_OUTPUT="console"
GRUB_CMDLINE_LINUX="rd.lvm.lv=rhel/root crashkernel=auto  rd.lvm.lv=rhel/swap vconsole.font=latarcyrheb-sun16 vconsole.keymap=us rhgb quiet"
GRUB_DISABLE_RECOVERY="true"

```


Centos 6 更改的文件相同，使用命令确定新内核位置后，然后将参数default更改为0即可。


5. 重新创建内核配置

接着运行grub2-mkconfig命令来重新创建内核配置，如下：
```sh
# grub2-mkconfig -o /boot/grub2/grub.cfg

[root@localhost ~]# cd /boot/grub2/
[root@localhost grub2]# mv grub.cfg grub.cfg.ori
[root@localhost grub2]#
[root@localhost grub2]# ll
total 32
-rw-r--r--. 1 root root   64 Jul  7  2020 device.map
drwxr-xr-x. 2 root root   24 Jul  7  2020 fonts
-rw-r--r--. 1 root root 5015 May 10 11:42 grub.cfg.ori
-rw-r--r--. 1 root root 1024 Jul  7  2020 grubenv
drwxr-xr-x. 2 root root 8192 Jul  7  2020 i386-pc
drwxr-xr-x. 2 root root 4096 Jul  7  2020 locale
drwxr-xr-x. 3 root root   19 Jul  7  2020 themes
[root@localhost grub2]#
[root@localhost grub2]# grub2-mkconfig -o /boot/grub2/grub.cfg
Generating grub configuration file ...
Found linux image: /boot/vmlinuz-5.4.117-1.el7.elrepo.x86_64
Found initrd image: /boot/initramfs-5.4.117-1.el7.elrepo.x86_64.img
Found linux image: /boot/vmlinuz-3.10.0-123.el7.x86_64
Found initrd image: /boot/initramfs-3.10.0-123.el7.x86_64.img
Found linux image: /boot/vmlinuz-0-rescue-6e0dc83b9f07144e928f33afa9e69986
Found initrd image: /boot/initramfs-0-rescue-6e0dc83b9f07144e928f33afa9e69986.img
done
[root@localhost grub2]#
```



5. 重启系统并查看系统内核
```sh
# reboot
```

系统启动完毕后，可以通过命令查看系统的内核版本，如下：
```sh
# uname -r
4.12.4-1.el7.elrepo.x86_64
```

已成功更新至4.12.4




## ref
* [原文链接](https://blog.csdn.net/qq_37788558/article/details/84373650)
* [ELPO home](http://elrepo.org/tiki/HomePage)
* []()
* []()
* []()
* []()
* []()
