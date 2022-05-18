# sshpass：用于非交互的ssh 密码验证

对于未连接过的主机。而又不输入yes进行确认，需要进行sshd服务的优化：


使用 -p 参数指定明文密码，然后直接登录远程服务器。 它支持密码从命令行,文件,环境变量中读取

1. 从命令行方式传递密码
sshpass -p user_password ssh user_name@192.168.1.2  【登录远程机器】
sshpass -p user_password scp -P22 root@192.168.1.2:/home/test  ./ 【远程机器/home/test 复制到本机当前目录】
还可以加参数 -q 【去掉进度显示】

2. 从文件读取密码
echo "user_password" > user.passwd
sshpass -f user.passwd ssh user_name@192.168.1.2

3. 从环境变量获取密码
export SSHPASS="user_password"
sshpass -e ssh user_name@192.168.1.2 

4. sshpass -p user_password ssh  -o StrictHostKeyChecking=no  user_name@192.168.1.2 
【-o StrictHostKeyChecking=no 表示远程连接时不提示是否输入yes/no】

5. 使用sshpass远程免密，在远程主机上执行shell命令，如下远程执行命令：touch /opt/file.txt
sshpass -p user_password ssh  -o StrictHostKeyChecking=no  user_name@192.168.1.2  touch /opt/file.txt
[注：shell命令要和sshpass命令写在一行]

