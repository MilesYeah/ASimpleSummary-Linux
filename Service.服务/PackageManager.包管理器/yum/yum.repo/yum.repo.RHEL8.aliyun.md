# RHEL 8 yum 源 配置

1. 备份源文件
    ```sh
    cd /etc/yum.repos.d/
    mkdir bak
    mv *.repo bak/

    ```
2. 下载CentOS-Base.repo 到/etc/yum.repos.d/
    ```sh
    cd /etc/yum.repos.d/

    [root@localhost yum.repos.d]# wget -O /etc/yum.repos.d/centos8.repo https://mirrors.aliyun.com/repo/Centos-8.repo

    # mv centos8.repo redhat.repo
    ```

    ```sh
    wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
    # 或者
    curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
    ```


    ```sh
    [root@localhost yum.repos.d]# sed -i 's/$basearch/x86_64/g' centos8.repo
    [root@localhost yum.repos.d]# sed -i 's/$releasever/8/g' centos8.repo
    ```


3. 清理YUM缓存，重建YUM仓库
    ```sh
    yum clean all
    yum makecache
    yum repolist

    ```

j5FFmw3AZge7tR0smMxMAlJwqwFwvdagf2hiz7R/xRM=

## Epel 源

epel源 安装和配置
1. 查看可用的epel源
    ```sh
    [java@localhost yum.repos.d]$ yum list | grep epel-release
    epel-release.noarch                         7-11                       extras   
    [java@localhost yum.repos.d]$ 
    ```
2. 安装 epel
    ```sh
    [java@localhost yum.repos.d]$ yum install -y epel-release
    ```

3. 配置阿里镜像提供的epel源
    ```sh
    wget -O /etc/yum.repos.d/epel-7.repo  http://mirrors.aliyun.com/repo/epel-7.repo
    ```

4. 清除缓存
    ```sh
    yum clean all     # 清除系统所有的yum缓存
    yum makecache     # 生成yum缓存
    ```


## 下载的原样 repo 文件如下
```sh
[root@localhost yum.repos.d]# cat centos8.repo
# CentOS-Base.repo
#
# The mirror system uses the connecting IP address of the client and the
# update status of each mirror to pick mirrors that are updated to and
# geographically close to the client.  You should use this for CentOS updates
# unless you are manually picking other mirrors.
#
# If the mirrorlist= does not work for you, as a fall back you can try the
# remarked out baseurl= line instead.
#
#

[base]
name=CentOS-$releasever - Base - mirrors.aliyun.com
failovermethod=priority
baseurl=https://mirrors.aliyun.com/centos/$releasever/BaseOS/$basearch/os/
        http://mirrors.aliyuncs.com/centos/$releasever/BaseOS/$basearch/os/
        http://mirrors.cloud.aliyuncs.com/centos/$releasever/BaseOS/$basearch/os/
gpgcheck=1
gpgkey=https://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-Official

#additional packages that may be useful
[extras]
name=CentOS-$releasever - Extras - mirrors.aliyun.com
failovermethod=priority
baseurl=https://mirrors.aliyun.com/centos/$releasever/extras/$basearch/os/
        http://mirrors.aliyuncs.com/centos/$releasever/extras/$basearch/os/
        http://mirrors.cloud.aliyuncs.com/centos/$releasever/extras/$basearch/os/
gpgcheck=1
gpgkey=https://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-Official

#additional packages that extend functionality of existing packages
[centosplus]
name=CentOS-$releasever - Plus - mirrors.aliyun.com
failovermethod=priority
baseurl=https://mirrors.aliyun.com/centos/$releasever/centosplus/$basearch/os/
        http://mirrors.aliyuncs.com/centos/$releasever/centosplus/$basearch/os/
        http://mirrors.cloud.aliyuncs.com/centos/$releasever/centosplus/$basearch/os/
gpgcheck=1
enabled=0
gpgkey=https://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-Official

[PowerTools]
name=CentOS-$releasever - PowerTools - mirrors.aliyun.com
failovermethod=priority
baseurl=https://mirrors.aliyun.com/centos/$releasever/PowerTools/$basearch/os/
        http://mirrors.aliyuncs.com/centos/$releasever/PowerTools/$basearch/os/
        http://mirrors.cloud.aliyuncs.com/centos/$releasever/PowerTools/$basearch/os/
gpgcheck=1
enabled=0
gpgkey=https://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-Official


[AppStream]
name=CentOS-$releasever - AppStream - mirrors.aliyun.com
failovermethod=priority
baseurl=https://mirrors.aliyun.com/centos/$releasever/AppStream/$basearch/os/
        http://mirrors.aliyuncs.com/centos/$releasever/AppStream/$basearch/os/
        http://mirrors.cloud.aliyuncs.com/centos/$releasever/AppStream/$basearch/os/
gpgcheck=1
gpgkey=https://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-Official
[root@localhost yum.repos.d]#

```



## 修改后的 repo 文件
如果环境变量中没有 $releasever $basearch ，我们需要将对应的变量做修改
* $releasever  是 OS 版本 8
* $basearch   是 OS 的架构 x86_64 


```sh
[root@localhost yum.repos.d]# sed -i 's/$basearch/x86_64/g' centos8.repo
[root@localhost yum.repos.d]# sed -i 's/$releasever/8/g' centos8.repo
```


```sh
[root@localhost yum.repos.d]# cat centos8.repo
# CentOS-Base.repo
#
# The mirror system uses the connecting IP address of the client and the
# update status of each mirror to pick mirrors that are updated to and
# geographically close to the client.  You should use this for CentOS updates
# unless you are manually picking other mirrors.
#
# If the mirrorlist= does not work for you, as a fall back you can try the
# remarked out baseurl= line instead.
#
#

[base]
name=CentOS-8 - Base - mirrors.aliyun.com
failovermethod=priority
baseurl=https://mirrors.aliyun.com/centos/8/BaseOS/x86_64/os/
        http://mirrors.aliyuncs.com/centos/8/BaseOS/x86_64/os/
        http://mirrors.cloud.aliyuncs.com/centos/8/BaseOS/x86_64/os/
gpgcheck=1
gpgkey=https://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-Official

#additional packages that may be useful
[extras]
name=CentOS-8 - Extras - mirrors.aliyun.com
failovermethod=priority
baseurl=https://mirrors.aliyun.com/centos/8/extras/x86_64/os/
        http://mirrors.aliyuncs.com/centos/8/extras/x86_64/os/
        http://mirrors.cloud.aliyuncs.com/centos/8/extras/x86_64/os/
gpgcheck=1
gpgkey=https://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-Official

#additional packages that extend functionality of existing packages
[centosplus]
name=CentOS-8 - Plus - mirrors.aliyun.com
failovermethod=priority
baseurl=https://mirrors.aliyun.com/centos/8/centosplus/x86_64/os/
        http://mirrors.aliyuncs.com/centos/8/centosplus/x86_64/os/
        http://mirrors.cloud.aliyuncs.com/centos/8/centosplus/x86_64/os/
gpgcheck=1
enabled=0
gpgkey=https://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-Official

[PowerTools]
name=CentOS-8 - PowerTools - mirrors.aliyun.com
failovermethod=priority
baseurl=https://mirrors.aliyun.com/centos/8/PowerTools/x86_64/os/
        http://mirrors.aliyuncs.com/centos/8/PowerTools/x86_64/os/
        http://mirrors.cloud.aliyuncs.com/centos/8/PowerTools/x86_64/os/
gpgcheck=1
enabled=0
gpgkey=https://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-Official


[AppStream]
name=CentOS-8 - AppStream - mirrors.aliyun.com
failovermethod=priority
baseurl=https://mirrors.aliyun.com/centos/8/AppStream/x86_64/os/
        http://mirrors.aliyuncs.com/centos/8/AppStream/x86_64/os/
        http://mirrors.cloud.aliyuncs.com/centos/8/AppStream/x86_64/os/
gpgcheck=1
gpgkey=https://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-Official
[root@localhost yum.repos.d]#
```


# redhat8 更改yum源
redhat安装完成后是不能直接使用yum安装的，会提示我们没有注册，所以要修改成Centos的源
This system is not registered to Red Hat Subscription Management. You can use subscription-manager to register.

这里使用阿里云Centos8yum源
```
cd /etc/yum.repos.d/
```
下载阿里云yum源
```
curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-8.repo
```
将redhat源名称修改
```
mv redhat.repo redhat.repo_bak
```
这个时候我们已经可以使用阿里云yum源了，但是还是会有注册提示，可以忽略
我们可以通过修改以下两个文件的Enable=0来禁用Subscription Management提示
```
vi /etc/yum/pluginconf.d/product-id.conf
vi /etc/yum/pluginconf.d/subscription-manager.conf

yum clean all
yum makecache
```


## ref
* [原文链接：](https://blog.csdn.net/wxg_wll/article/details/106329257)
* [原文链接：](https://blog.csdn.net/xiaojin21cen/article/details/84726193)
* []()
* []()
* []()
* []()
* []()
* []()
