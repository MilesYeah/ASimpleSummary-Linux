split

如果你有一个很大的文件，你想把其分割成一些小的文件，那么这个命令就是干这件事的了。

[hchen@RHELSVR5 applebak]# ls -l largefile.tar.gz
-rw-r--r-- 1 hchen hchen 436774774 04-17 02:00 largefile.tar.gz

[hchen@RHELSVR5 applebak]# split -b 50m largefile.tar.gz LF_

[hchen@RHELSVR5]# ls -l LF_*
-rw-r--r-- 1 hchen hchen 52428800 05-10 18:34 LF_aa
-rw-r--r-- 1 hchen hchen 52428800 05-10 18:34 LF_ab
-rw-r--r-- 1 hchen hchen 52428800 05-10 18:34 LF_ac
-rw-r--r-- 1 hchen hchen 52428800 05-10 18:34 LF_ad
-rw-r--r-- 1 hchen hchen 52428800 05-10 18:34 LF_ae
-rw-r--r-- 1 hchen hchen 52428800 05-10 18:35 LF_af
-rw-r--r-- 1 hchen hchen 52428800 05-10 18:35 LF_ag
-rw-r--r-- 1 hchen hchen 52428800 05-10 18:35 LF_ah
-rw-r--r-- 1 hchen hchen 17344374 05-10 18:35 LF_ai
文件合并只需要使用简单的合并就行了，如：

[hchen@RHELSVR5]#  cat LF_* >largefile.tar.gz


