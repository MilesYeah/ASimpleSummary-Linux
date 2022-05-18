
# RHEL 8 yum 源 配置


```conf
mkdir -p /media/CDROM
mkdir -p /media/temp
mount /dev/sr0 /media/temp/
cp -r /media/temp/* /media/CDROM/
vim /etc/yum.repos.d/rhel8.repo
```

```conf
[InstallMedia-BaseOS]
name=Red Hat Enterprise Linux 8 - BaseOS
metadata_expire=-1
gpgcheck=1
enabled=1
baseurl=file:///media/CDROM/BaseOS/
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release
 
[InstallMedia-AppStream]
name=Red Hat Enterprise Linux 8 - AppStream
metadata_expire=-1
gpgcheck=1
enabled=1
baseurl=file:///media/CDROM/AppStream/
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release

```


```sh
cat /etc/yum.repos.d/rhel8.repo 
```


————————————————
版权声明：本文为CSDN博主「msdnchina」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/msdnchina/java/article/details/90343119

