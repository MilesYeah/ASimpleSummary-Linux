

## 什么是epel
如果既想获得 RHEL 的高质量、高性能、高可靠性，又需要方便易用(关键是免费)的软件包更新功能，那么 Fedora Project 推出的 EPEL(Extra Packages for Enterprise Linux)正好适合你。EPEL(http://fedoraproject.org/wiki/EPEL) 是由 Fedora 社区打造，为 RHEL 及衍生发行版如 CentOS、Scientific Linux 等提供高质量软件包的项目。

## 使用心得
1，不用去换原来yum源，安装后会产生新repo

2，epel会有很多源地址，如果一个下不到，会去另外一个下
    ```
    http://mirror.xfes.ru/fedora-epel/6/x86_64/ibus-table-chinese-scj-1.3.4-1.el6.noarch.rpm: [Errno 14] PYCURL ERROR 6 - ""
    Trying other mirror.
    http://mirrors.ustc.edu.cn/fedora/epel/6/x86_64/ibus-table-chinese-scj-1.3.4-1.el6.noarch.rpm: [Errno 14] PYCURL ERROR 6 - ""
    Trying other mirror.
    http://repo.boun.edu.tr/epel/6/x86_64/ibus-table-chinese-scj-1.3.4-1.el6.noarch.rpm: [Errno 14] PYCURL ERROR 6 - ""kjs

    。。。。。。
    ```

3，更新时如果下载的包不全，就不会进行安装。这样的话，依赖关系可以保重

## 安装epel,centos6选6，5就选5
32位系统选择：
    ```
    rpm -ivh http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

    rpm -ivh http://dl.fedoraproject.org/pub/epel/5/i386/epel-release-5-4.noarch.rpm
    ```

64位系统选择：
    ```
    rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

    rpm -ivh http://dl.fedoraproject.org/pub/epel/5/x86_64/epel-release-5-4.noarch.rpm
    ```
导入key：
    ```
    rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6

    rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-5
    
    ```

如果用比较新的软件，用epel-test.repo这个文件就行了

别忘了安装
    ```
    yum install yum-priorities

    [root@localhost yum.repos.d]# ls |grep epel
    epel.repo
    epel-testing.repo
    ```

原文来自：http://blog.51yip.com/linux/1337.html

本文地址：https://www.linuxprobe.com/centos-pel.html编辑：public，审核员：逄增宝

Linux命令大全：https://www.linuxcool.com/

















## ref
* [Centos 建议使用epel源](https://www.linuxprobe.com/centos-pel.html)
* []()
* []()
* []()
* []()
* []()
* []()

