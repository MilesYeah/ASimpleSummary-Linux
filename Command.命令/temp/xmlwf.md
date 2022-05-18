xmlwf

这个命令可以让你检查一下一个XML文档是否是所有的tag都是正常的。如：

[hchen@RHELSVR5 ~]# curl 'https://coolshell.cn/?feed=rss2' > cocre.xml
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 64882    0 64882    0     0  86455      0 --:--:-- --:--:-- --:--:-- 2073k
[hchen@RHELSVR5 ~]# xmlwf cocre.xml
[hchen@RHELSVR5 ~]# perl -i -pe 's@<link>@<br>@g' cocre.xml
[hchen@RHELSVR5 ~]# xmlwf cocre.xml
cocre.xml:13:23: mismatched tag

