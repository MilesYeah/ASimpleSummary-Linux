## /var/log/message

系统报错日志：几乎所有的开机系统发生的错误都会在此记录

messages 日志是核心系统日志文件。它包含了系统启动时的引导消息，以及系统运行时的其他状态消息。IO 错误、网络错误和其他系统错误都会记录到这个文件中。其他信息，比如某个人的身份切换为 root，也在这里列出。如果服务正在运行，比如 DHCP 服务器，您可以在 messages 文件中观察它的活动。通常，/var/log/messages 是您在做故障诊断时首先要查看的文件。

