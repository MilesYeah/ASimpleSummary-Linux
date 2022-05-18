

执行yum命令提示Python解释器不存在
问题现象
在执行yum命令时提示以下报错信息。

-bash: /usr/bin/yum: /usr/bin/python: bad interpreter: No such file or directory
说明：yum是一个python脚本。

解决方法
执行以下命令查看yum路径。
cat /usr/bin/yum
系统会返回以下路径。
#!/usr/bin/python
执行以下命令检查上述查看的路径。
ls -al /usr/bin/python
如果系统返回以下信息，Python可能被卸载、被改名或移动路径。
ls: cannot access /usr/bin/python: No such file or directory
请您参考以下步骤进行排查。
执行以下命令，查看安装包是否存在。 
rpm -qa | grep python
系统返回以下信息。
python-decorator-3.4.0-3.el7.noarch
libselinux-python-2.5-14.1.el7.x86_64
python-backports-1.0-8.el7.x86_64
python-pyudev-0.15-9.el7.noarch
rpm-python-4.11.3-35.el7.x86_64
python-2.7.5-76.el7.x86_64
.....
如果发现有Python相关文件，说明Python相关文件被改名或移动路径：
执行以下命令，查看Python相关文件。
ls -al /usr/bin/python*
系统返回以下信息，发现“/usr/bin/python.bak -> python2”信息，说明是被改名了，手动将/usr/bin/python.bak改回/usr/bin/python后，即可恢复正常。
lrwxrwxrwx  1 root root   14 Feb 15  2019 /usr/bin/python-config -> python2-config
lrwxrwxrwx. 1 root root    7 Feb 15  2019 /usr/bin/python.bak -> python2
lrwxrwxrwx. 1 root root    9 Feb 15  2019 /usr/bin/python2 -> python2.7
lrwxrwxrwx  1 root root   16 Feb 15  2019 /usr/bin/python2-config -> python2.7-config
-rwxr-xr-x. 1 root root 7216 Oct 31  2018 /usr/bin/python2.7
-rwxr-xr-x  1 root root 1835 Oct 31  2018 /usr/bin/python2.7-config
如果未发现Python相关文件，即判定Python被卸载：
请您找个同系统的正常实例，依次执行如下命令。
mkdir /python/
yum install python --downloadonly --downloaddir=/python/
执行以下命令将/python/中的rpm包传到异常实例。
scp /python/* root@x.x.x.x:/tmp/
注意：x.x.x.x指的是需要访问的主机地址。前提是主机还有公网访问能力，能复制文件到主机中。
在异常实例上依次执行以下命令，安装Python即可。
cd /tmp
rpm -ivh *


## ref
* [yum命令提示Python解释器不存在](https://help.aliyun.com/knowledge_detail/158851.html?spm=5176.13910061.sslink.3.1f1ac5c2d9RMac#QDRbX)
* 