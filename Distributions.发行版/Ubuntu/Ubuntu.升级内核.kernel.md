# Ubuntu.升级内核.kernel


## 下载内核
目前下载有很多地址，我主要使用以下两个：

* github上下载[linux kernel](https://github.com/torvalds/linux/releases)
* ubuntu的仓库中下载[linux kernel](http://kernel.ubuntu.com/~kernel-ppa/mainline/)

内核需要下载那些文件？


### [Choose the proper upstream kernel files](https://wiki.ubuntu.com/Kernel/MainlineBuilds)
The build directories are nicely organized into per architecture groups. For example, if one is using a 64-bit/amd64 architecture and wants the generic kernel version you would want those files marked A, from the appropriate group.
If you want the low latency version, B.
```
  Build for amd64 succeeded (see BUILD.LOG.amd64):
AB  linux-headers-4.19.0-041900_4.19.0-041900.201810221809_all.deb
A   linux-headers-4.19.0-041900-generic_4.19.0-041900.201810221809_amd64.deb
B   linux-headers-4.19.0-041900-lowlatency_4.19.0-041900.201810221809_amd64.deb
A   linux-image-unsigned-4.19.0-041900-generic_4.19.0-041900.201810221809_amd64.deb
B   linux-image-unsigned-4.19.0-041900-lowlatency_4.19.0-041900.201810221809_amd64.deb
A   linux-modules-4.19.0-041900-generic_4.19.0-041900.201810221809_amd64.deb
B   linux-modules-4.19.0-041900-lowlatency_4.19.0-041900.201810221809_amd64.deb
```
Download upstream kernel files from the Ubuntu archive, Available From: [Ubuntu Mainline Kernel Archive (sorted by most recent build)](https://kernel.ubuntu.com/~kernel-ppa/mainline/?C=N;O=D)




## 安装顺序
使用sudo dpkg -i ***.deb 的形式安装。

首先安装linux-headers-4.17.0-041700_4.17.0-041700.201806041953_all.deb

安装linux-headers-4.17.0-041700-generic_4.17.0-041700.201806041953_amd64.deb

安装linux-modules-4.17.0-041700-generic_4.17.0-041700.201806041953_amd64.deb

安装linux-image-unsigned-4.17.0-041700-generic_4.17.0-041700.201806041953_amd64.deb

如果是4.16版本及以前内核，此文件是没有的，也不需要安装。


实例
```sh
dpkg -i linux-headers-5.13.0-051300rc1_5.13.0-051300rc1.202105092230_all.deb
dpkg -i linux-headers-5.13.0-051300rc1-generic_5.13.0-051300rc1.202105092230_amd64.deb
dpkg -i linux-modules-5.13.0-051300rc1-generic_5.13.0-051300rc1.202105092230_amd64.deb
# 其中可能会遇到依赖问题，此时可以执行一次 `apt autoremove` 再重新安装 `linux-modules` 和 `linux-image`
dpkg -i linux-image-unsigned-5.13.0-051300rc1-generic_5.13.0-051300rc1.202105092230_amd64.deb
apt autoremove

cat /boot/grub/grub.cfg | grep menuentry

```


安装完成后重启即可。



### 如果重启后没有自动有以新的内核进入系统
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

然后再重启试试看




## 删除多余内核
1. 查看当前系统安装的内核
```sh
dpkg --get-selections| grep linux

console-setup-linux install
libselinux1:amd64 install
libselinux1:i386 install
linux-base install
linux-firmware install
linux-generic install
linux-headers-4.4.0-22 install
linux-headers-4.4.0-22-generic install
linux-headers-4.4.0-24 install
linux-headers-4.4.0-24-generic install
linux-headers-4.4.0-28 install
linux-headers-4.4.0-28-generic install
linux-headers-4.4.0-31 install
linux-headers-4.4.0-31-generic install
linux-headers-4.4.0-34 install
linux-headers-4.4.0-34-generic install
linux-headers-4.4.0-36 install
linux-headers-4.4.0-36-generic install
linux-headers-4.4.0-38 install
linux-headers-4.4.0-38-generic install
linux-headers-4.4.0-42 install
linux-headers-4.4.0-42-generic install
linux-headers-generic install
linux-image-4.2.0-21-generic deinstall
linux-image-4.2.0-22-generic deinstall
linux-image-4.4.0-31-generic deinstall
linux-image-4.4.0-34-generic install
linux-image-4.4.0-36-generic install
linux-image-4.4.0-38-generic install
linux-image-4.4.0-42-generic install
linux-image-extra-4.2.0-21-generic deinstall
linux-image-extra-4.4.0-31-generic deinstall
linux-image-extra-4.4.0-34-generic deinstall
linux-image-extra-4.4.0-36-generic deinstall
linux-image-extra-4.4.0-38-generic install
linux-image-extra-4.4.0-42-generic install
linux-image-generic install
linux-libc-dev:amd64 install
linux-sound-base install
pptp-linux install
syslinux install
syslinux-common install
syslinux-legacy install
util-linux install

```




### 卸载内核

可以看到系统已经安装了多个内核版本，包括 headers 和 image ，可以删除这些来卸载旧的内核。

比如删除 4.4.0-22 内核，我们看到上面只有 headers，因此可以这样：
```sh
sudo apt-get remove --purge linux-headers-4.4.0-22

sudo apt-get remove --purge linux-image-4.2.0-22-generic
```


以此类推。

然后终端执行：
```sh
sudo apt-get autoclean
sudo apt-get autoremove
```

然后重启电脑即可。



## ref
* [原文链接](https://blog.csdn.net/wf19930209/article/details/81879777)
* [Ubuntu Wiki MainlineBuilds](https://wiki.ubuntu.com/Kernel/MainlineBuilds)
* []()
* []()
* []()
* []()
* []()
* []()
