# Linux下mount挂载cifs遇到的编码问题

(2013-11-24 11:02:27)

遇到的问题是NAS（Windows storage 2008）共享出的cifs（通过smb）。

我用命令 mount -t cifs //x.x.x.x/test  /home  -o username=test,password=test 挂载后无法创建中文文件，也无法显示预先已有的中文文件。查了下资料应该cifs共享默认是用Unicode传输，我在mount后增加了本地显示的编码参数iocharset，命令如下：

mount -t cifs //x.x.x.x/test  /home  -o username=test,password=test,iocharset=cp936

这样问题就解决了。

ps：支持中文的字符集有UTF-8，GB2312、GBK、GB18030等等。如果是UTF-8，取iocharset=utf8；如果是GB2312、GBK、GB18030，取iocharset=cp936。（对于足够新的发行版，基本上utf8一统天下。）

看你系统的字符编码是什么（locale查询，编辑/etc/sysconfig/i18n修改系统编码）
