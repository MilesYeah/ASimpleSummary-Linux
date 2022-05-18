# until 循环
until循环执行一系列命令直至条件为真时停止。  
until循环与while循环在处理方式上刚好相反。  
一般while循环优于until循环，但在某些时候—也只是极少数情况下，until循环更加有用。

until 语法格式:
```sh
until condition
do
    command1
    ...
    commandN
done
```

条件可为任意测试条件，测试发生在循环末尾，因此循环至少执行一次，请注意这一点。
