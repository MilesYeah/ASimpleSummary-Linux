


使用yum时rpmdb open failed解决方案  (2013-09-29 11:26:45)转载▼
分类： 系统学习笔记

1、前提条件：安装软件包的时候，被我手动终止了
```sh
[root@dhcp yum.repos.d]# yum clean all
rpmdb: Thread/process 4541/140619363587840 failed: Thread died in Berkeley DB library
error: db3 error(-30974) from dbenv->failchk: DB_RUNRECOVERY: Fatal error, run database recovery
error: cannot open Packages index using db3 -  (-30974)
error: cannot open Packages database in /var/lib/rpm
CRITICAL:yum.main:
Error: rpmdb open failed
[root@dhcp yum.repos.d]# yum makecache
rpmdb: Thread/process 4541/140619363587840 failed: Thread died in Berkeley DB library
error: db3 error(-30974) from dbenv->failchk: DB_RUNRECOVERY: Fatal error, run database recovery
error: cannot open Packages index using db3 -  (-30974)
error: cannot open Packages database in /var/lib/rpm
CRITICAL:yum.main:
```

2、根据提示可以知道rpm数据库被损坏，如是按照下面的方法进行重建
```sh
[root@dhcp yum.repos.d]# cd /var/lib/rpm/
[root@dhcp rpm]# ls
Basenames     __db.004     Name            Pubkeys         Triggername
Conflictname  Dirnames     Obsoletename    Requirename
__db.001      Filedigests  Packages        Requireversion
__db.002      Group        Providename     Sha1header
__db.003      Installtid   Provideversion  Sigmd5
[root@dhcp rpm]# rm __db.* -rf
[root@dhcp rpm]# rpm --rebuilddb
[root@dhcp rpm]# yum clean all
Loaded plugins: aliases, changelog, downloadonly, kabi, presto, product-id,
              : refresh-packagekit, security, subscription-manager, tmprepo,
              : verify, versionlock
Updating certificate-based repositories.
Unable to read consumer identity
Loading support for Red Hat kernel ABI
Cleaning repos: rhel-source
Cleaning up Everything
0 delta-package files removed, by presto
[root@dhcp rpm]# yum update
Loaded plugins: aliases, changelog, downloadonly, kabi, presto, product-id,
              : refresh-packagekit, security, subscription-manager, tmprepo,
              : verify, versionlock
Updating certificate-based repositories.
Unable to read consumer identity
Loading support for Red Hat kernel ABI
rhel-source                                                | 4.0 kB     00:00 ...
rhel-source/primary_db                                     | 3.1 MB     00:00 ...
Setting up Update Process
No Packages marked for Update
```

