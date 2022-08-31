

## RHEL 7 及以下 GUI 自动登陆

```conf
# GUI mode
# Enable auto login.
# The Daemon section should be empty, add two lines after [daemon]
[root@debian ~]# vim /etc/gdm/custom.conf
[daemon]
AutomaticLoginEnable=true
AutomaticLogin=root

```



## RHEL 8 GUI 自动登陆

RHEL8.x GUI 自动登陆

### step 1
vim /etc/gdm/custom.conf
```conf
[daemon]
# Uncoment the line below to force the login screen to use Xorg
WaylandEnable=false         #（去掉#注释）

AutomaticLoginEnable=true
AutomaticLogin=root
```


### step 2
```sh
[root@localhost ~]# cd /usr/share/xsessions/
[root@localhost xsessions]# ll
total 32
-rw-r--r--. 1 root root  132 Jun 30  2020 com.redhat.Kiosk.desktop
-rw-r--r--. 1 root root 1394 May  1  2020 gnome-classic.desktop
-rw-r--r--. 1 root root 8471 Jun 30  2020 gnome-custom-session.desktop
-rw-r--r--. 1 root root 1303 Jun 30  2020 gnome.desktop
-rw-r--r--. 1 root root 1303 Jun 30  2020 gnome-xorg.desktop
-rw-r--r--. 1 root root  130 Aug 13  2018 xinit-compat.desktop
[root@localhost xsessions]#
```

```sh

# 以经典桌面登录
for name in `ls`
do 
    # echo ${name}
    if [[ ${name} =~ "classic" ]]; then
        echo ${name}
    else
        echo ${name}.ori
        mv ${name} ${name}.ori
    fi
done
ll

```

```sh
[root@localhost xsessions]# ll
total 32
-rw-r--r--. 1 root root  132 Jun 30  2020 com.redhat.Kiosk.desktop.ori
-rw-r--r--. 1 root root 1394 May  1  2020 gnome-classic.desktop
-rw-r--r--. 1 root root 8471 Jun 30  2020 gnome-custom-session.desktop.ori
-rw-r--r--. 1 root root 1303 Jun 30  2020 gnome.desktop.ori
-rw-r--r--. 1 root root 1303 Jun 30  2020 gnome-xorg.desktop.ori
-rw-r--r--. 1 root root  130 Aug 13  2018 xinit-compat.desktop.ori
[root@localhost xsessions]#
```





## 文本模式
```sh
# 设定字符模式登录
systemctl set-default multi-user.target

# 修改如下配置
cd /lib/systemd/system/
cp getty@.service getty@.service.ori
vim /lib/systemd/system/getty@.service

```conf
#ExecStart=-/sbin/agetty -o '-p -- \\u' --noclear %I $TERM
ExecStart=-/sbin/agetty --autologin root --noclear %I $TERM
```





## ref
* [Linux设置以root用户开机自动登录桌面](https://blog.csdn.net/qq_27187579/article/details/97800354)
* []()
* []()
* []()
* []()
* []()
* []()
