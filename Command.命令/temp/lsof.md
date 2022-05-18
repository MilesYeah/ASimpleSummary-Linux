lsof

可以列出打开了的文件。

[root@RHELSVR5 ~]# lsof | grep TCP
httpd       548    apache    4u     IPv6   14300967    TCP *:http (LISTEN)
httpd       548    apache    6u     IPv6   14300972    TCP *:https (LISTEN)
httpd       561    apache    4u     IPv6   14300967    TCP *:http (LISTEN)
httpd       561    apache    6u     IPv6   14300972    TCP *:https (LISTEN)
sshd       1764      root    3u     IPv6       4993    TCP *:ssh (LISTEN)
tcpserver  8965      root    3u     IPv4  153795500    TCP *:pop3 (LISTEN)
mysqld    10202     mysql   10u     IPv4   73819697    TCP *:mysql (LISTEN)
sshd      10735      root    3u     IPv6  160731956    TCP 210.51.0.232:ssh->123.117.239.68:31810 (ESTABLISHED)
sshd      10767     hchen    3u     IPv6  160731956    TCP 210.51.0.232:ssh->123.117.239.68:31810 (ESTABLISHED)
vsftpd    11095      root    3u     IPv4  152157957    TCP *:ftp (LISTEN)

