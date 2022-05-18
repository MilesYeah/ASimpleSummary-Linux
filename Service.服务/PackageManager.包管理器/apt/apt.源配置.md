# apt 源

```sh
sed -i 's#http://deb.debian.org#https://mirrors.163.com#g' /etc/apt/sources.list

apt-get update

apt-get upgrade


apt-get install inetutils-ping
```
还有ifconfig 可以用 apt-get install net-tools 来安装～





Debian 国内常用镜像源

随着 Debian Buster 10.3 的发布，Debian Buster 日趋稳定。如果在生产上使用了 Debian 9 的系统，现在是可以安全的，灰度升级到 Debian Buster 做前期验证了。这里我们整理一下国内较知名的镜像站点，共大家在生产环境中使用。

如何更新系统安装源
一般我们修改 /etc/apt/sources.list 文件，将 Debian 的默认源地址改成新的地址即可，比如将 http://deb.debian.org 改成 https://mirrors.163.com，可使用以下这条命令：

sed -i 's#http://deb.debian.org#https://mirrors.163.com#g' /etc/apt/sources.list
注意，如果安装源是 https 协议的，我们还需要安装软件包 apt-transport-https。 执行 apt-get install apt-transport-https，随后再执行 apt-get update 即可。

常用安装源站点列表
163镜像站

deb http://mirrors.163.com/debian/ buster main non-free contrib
deb http://mirrors.163.com/debian/ buster-updates main non-free contrib
deb http://mirrors.163.com/debian/ buster-backports main non-free contrib
deb http://mirrors.163.com/debian-security/ buster/updates main non-free contrib

deb-src http://mirrors.163.com/debian/ buster main non-free contrib
deb-src http://mirrors.163.com/debian/ buster-updates main non-free contrib
deb-src http://mirrors.163.com/debian/ buster-backports main non-free contrib
deb-src http://mirrors.163.com/debian-security/ buster/updates main non-free contrib
华为云镜像站

deb https://mirrors.huaweicloud.com/debian/ buster main contrib non-free
deb https://mirrors.huaweicloud.com/debian/ buster-updates main contrib non-free
deb https://mirrors.huaweicloud.com/debian/ buster-backports main contrib non-free
deb https://mirrors.huaweicloud.com/debian-security/ buster/updates main contrib non-free

deb-src https://mirrors.huaweicloud.com/debian/ buster main contrib non-free
deb-src https://mirrors.huaweicloud.com/debian/ buster-updates main contrib non-free
deb-src https://mirrors.huaweicloud.com/debian/ buster-backports main contrib non-free
腾讯云镜像站

deb http://mirrors.cloud.tencent.com/debian/ buster main non-free contrib
deb http://mirrors.cloud.tencent.com/debian-security buster/updates main
deb http://mirrors.cloud.tencent.com/debian/ buster-updates main non-free contrib
deb http://mirrors.cloud.tencent.com/debian/ buster-backports main non-free contrib

deb-src http://mirrors.cloud.tencent.com/debian-security buster/updates main
deb-src http://mirrors.cloud.tencent.com/debian/ buster main non-free contrib
deb-src http://mirrors.cloud.tencent.com/debian/ buster-updates main non-free contrib
deb-src http://mirrors.cloud.tencent.com/debian/ buster-backports main non-free contrib
中科大镜像站

deb https://mirrors.ustc.edu.cn/debian/ buster main contrib non-free
deb https://mirrors.ustc.edu.cn/debian/ buster-updates main contrib non-free
deb https://mirrors.ustc.edu.cn/debian/ buster-backports main contrib non-free
deb https://mirrors.ustc.edu.cn/debian-security/ buster/updates main contrib non-free

deb-src https://mirrors.ustc.edu.cn/debian/ buster main contrib non-free
deb-src https://mirrors.ustc.edu.cn/debian/ buster-updates main contrib non-free
deb-src https://mirrors.ustc.edu.cn/debian/ buster-backports main contrib non-free
deb-src https://mirrors.ustc.edu.cn/debian-security/ buster/updates main contrib non-free
阿里云镜像站

deb http://mirrors.aliyun.com/debian/ buster main non-free contrib
deb http://mirrors.aliyun.com/debian-security buster/updates main
deb http://mirrors.aliyun.com/debian/ buster-updates main non-free contrib
deb http://mirrors.aliyun.com/debian/ buster-backports main non-free contrib

deb-src http://mirrors.aliyun.com/debian-security buster/updates main
deb-src http://mirrors.aliyun.com/debian/ buster main non-free contrib
deb-src http://mirrors.aliyun.com/debian/ buster-updates main non-free contrib
deb-src http://mirrors.aliyun.com/debian/ buster-backports main non-free contrib
清华大学镜像站

deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian-security/ buster/updates main contrib non-free

deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian-security/ buster/updates main contrib non-free
兰州大学镜像站

deb http://mirror.lzu.edu.cn/debian stable main contrib non-free
deb http://mirror.lzu.edu.cn/debian stable-updates main contrib non-free
deb http://mirror.lzu.edu.cn/debian/ buster-backports main contrib non-free
deb http://mirror.lzu.edu.cn/debian-security/ buster/updates main contrib non-free

deb-src http://mirror.lzu.edu.cn/debian stable main contrib non-free
deb-src http://mirror.lzu.edu.cn/debian stable-updates main contrib non-free
deb-src http://mirror.lzu.edu.cn/debian/ buster-backports main contrib non-free
deb-src http://mirror.lzu.edu.cn/debian-security/ buster/updates main contrib non-free
上海交大镜像站

deb https://mirror.sjtu.edu.cn/debian/ buster main contrib non-free
deb https://mirror.sjtu.edu.cn/debian/ buster-updates main contrib non-free
deb https://mirror.sjtu.edu.cn/debian/ buster-backports main contrib non-free
deb https://mirror.sjtu.edu.cn/debian-security/ buster/updates main contrib non-free

deb-src https://mirror.sjtu.edu.cn/debian/ buster-updates main contrib non-free
deb-src https://mirror.sjtu.edu.cn/debian/ buster-backports main contrib non-free
deb-src https://mirror.sjtu.edu.cn/debian/ buster main contrib non-free
deb-src https://mirror.sjtu.edu.cn/debian-security/ buster/updates main contrib non-free
附上官方全球镜像站列表地址：https://www.debian.org/mirror/list

 

 

debian 7.x (wheezy)

编辑/etc/apt/sources.list文件(需要使用sudo), 在文件最前面添加以下条目(操作前请做好相应备份)

deb http://mirrors.aliyun.com/debian/ wheezy main non-free contrib
deb http://mirrors.aliyun.com/debian/ wheezy-proposed-updates main non-free contrib
deb-src http://mirrors.aliyun.com/debian/ wheezy main non-free contrib
deb-src http://mirrors.aliyun.com/debian/ wheezy-proposed-updates main non-free contrib
debian 8.x (jessie)

编辑/etc/apt/sources.list文件(需要使用sudo), 在文件最前面添加以下条目(操作前请做好相应备份)

deb http://mirrors.aliyun.com/debian/ jessie main non-free contrib
deb http://mirrors.aliyun.com/debian/ jessie-proposed-updates main non-free contrib
deb-src http://mirrors.aliyun.com/debian/ jessie main non-free contrib
deb-src http://mirrors.aliyun.com/debian/ jessie-proposed-updates main non-free contrib
debian 9.x (stretch)

编辑/etc/apt/sources.list文件(需要使用sudo), 在文件最前面添加以下条目(操作前请做好相应备份)

deb http://mirrors.aliyun.com/debian/ stretch main non-free contrib
deb-src http://mirrors.aliyun.com/debian/ stretch main non-free contrib
deb http://mirrors.aliyun.com/debian-security stretch/updates main
deb-src http://mirrors.aliyun.com/debian-security stretch/updates main
deb http://mirrors.aliyun.com/debian/ stretch-updates main non-free contrib
deb-src http://mirrors.aliyun.com/debian/ stretch-updates main non-free contrib
deb http://mirrors.aliyun.com/debian/ stretch-backports main non-free contrib
deb-src http://mirrors.aliyun.com/debian/ stretch-backports main non-free contrib

 

 


再来补充（解决不知道命令怎样安装的终极办法）

今天又新拉最新的centos 镜像，创建好容器之后，进入容器竟然连service 命令都没有。于是继续谷歌，后来找到了whatprovides 这个命令，找到一台装有service 命令的主机,执行

whereis service
找到service 所在路径