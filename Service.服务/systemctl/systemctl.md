

## systemctl



### 设置运行级别

systemctl使用目标取代了运行级别的概念

如下：

  6              7

init ---> systemd   

init0 ---> systemctl poweroff #关机

init1 ---> systemctl isolate rescue.target  #单用户

init3 ---> systemctl isolate    #字符界面

inti5 ---> systemctl isolate   #图形界面

init6 ---> systemctl reboot  #重启





### RHEL7启动原理：

BIOS自检--->MBR--->GRUB--->加载内核--->systemd的init进程--->login

systemd的初始化进程

作用：加载所需的服务和用户空间工具，挂载文件系统/etc/fstab



systemd是linux内核启动的第一个进程，取代了sysvinit程序（即init）

负责协调引导过程的其余部分并配置为用户的环境



### systemd相比init的优点

1、启动速度快--->各服务平行运行（SSD会加快）

2、提供系统服务的快照

3、挂载及自动挂载的管理

4、服务自动实时更新。（重新启动与暂停或停止）

5、使用Linux核心cgroup功能进行管理



### RHEL7使用systemd进程初始化

初始化进程的PID是1

可使用ps –aux | grep systemd进行查看



### RHEL7服务启动配置

systemd的主要的命令行工具是systemctl

大多数Linux系统管理员应该已经熟练service chkconfig的使用，systemd可以同样完成。



### RHEL6中服务启动配置命令service、chkconfig

service使用：

Usage：service  [服务名称]  {start|stop|status|restart|reload}

start启动服务

stop暂停服务

status查看状态

restart重启服务

reload激活

chkconfig 命令设置开机自启

chkconfig servername {on|off}



### RHEL7中使用systemctl命令实现服务的配置



systemctl命令

Usage: systemctl { start | restart | stop | status | enable | disable }  servername

systemctl start [服务名称] 启动

systemctl restart [服务名称] 重新启动

systemctl stop [服务名称] 停止

systemctl status [服务名称] 状态查询

systemctl enable [服务名称] 开机自启

systemctl disable [服务名称] 开机自动关闭








