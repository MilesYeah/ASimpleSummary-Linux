

## 随笔引言
### 随笔内容：
1. RedHat 配置Centos yum源
2. yum配置系统本地源（光盘）

### 原因：
1. RedHat yum源是收费的，没有成功注册RH的机器是不能正常使用yum的；
2. CentOs yum源是免费的，可以使用国内网易的yum源，比较稳定；
3. 知道挂载本地源，也是很方便的；

### 系统环境：
* 系统版本：Red Hat Enterprise Linux Server release 6.2
* 软件环境：系统默认是自带了yum程序的，不过我卸了它，装centos版的
* 所需文件：见下文2.2
* 说明：我个人环境，仅做参考，Redhat 6及相关版本大致通用


## RedHat 配置Centos yum源
###  卸载本地yum
```sh
rpm -qa|grep yum　　#查看本地yum
rpm -qa|grep yum|xargs rpm -e --nodeps　　#卸载本地yum，不检查依赖性，卸载yum程序
```

###  下载centos yum 程序
```sh
wget http://mirrors.163.com/centos/6/os/x86_64/Packages/yum-3.2.29-69.el6.centos.noarch.rpm
wget http://mirrors.163.com/centos/6/os/x86_64/Packages/yum-plugin-fastestmirror-1.1.30-30.el6.noarch.rpm
wget http://mirrors.163.com/centos/6/os/x86_64/Packages/yum-metadata-parser-1.1.2-16.el6.x86_64.rpm
#命令wget 下载，也可以使用浏览器下载到你个人目录
```

###  安装centos yum程序
```sh
rpm -ivh yum-3.2.29-69.el6.centos.noarch.rpm yum-plugin-fastestmirror-1.1.30-30.el6.noarch.rpm yum-metadata-parser-1.1.2-16.el6.x86_64.rpm
#3个文件一起安装，以免它们相互依赖
```

###  配置centos
```sh
cd /etc/yum.repos.d/　　#进入到yum配置文件目录
wget http://mirrors.163.com/.help/CentOS6-Base-163.repo　　#下载CentOS配置文件

vi CentOS6-Base-163.repo　　#编辑配置文件
# 如果你系统没有配置环境变量$releasever 和 $basearch，（可以命令echo查看有没有）
# 那么配置文件就把$releasever 都 改成6或者i386（如下会贴出几大步骤的截图）
yum clean all　　#清除yum缓存
yum makecache　　#更新yum缓存
```


###  验证
（下回安装软件后在贴）


## RedHat 配置本地源
###  挂载本地光盘到系统
```sh
mkdir /media/rhel               #新建挂载目录
mount /dev/cdrom /media/rhel    #挂载光盘到/media/rhel目录下
cd /media/rhel                  #进入挂载目录
ls                              #查看挂载目录，光盘挂载成功
```
###  配置本地yum源
```sh
cd /etc/yum.repos.d/    #进入yum配置目录
touch rhel-media.repo   #建立yum配置文件
vi rhel-media.repo      #编辑配置文件，添加以下内容
```
```conf
[rhel-media]
name=Red Hat Enterprise Linux 6.2   #自定义名称
baseurl=file:///media/rhel          #本地光盘挂载路径
enabled=1                           #启用yum源，0为不启用，1为启用
gpgcheck=1                          #检查GPG-KEY，0为不检查，1为检查
gpgkey=file:///media/rhel/RPM-GPG-KEY-redhat-release    #GPG-KEY路径
```
```sh
yum clean all       #清除yum缓存（还是别乱清理了，待会163的yum源也被清理了）
```


## 验证
```sh
yum install php         #安装php，也可以你光盘中的其他程序
```
