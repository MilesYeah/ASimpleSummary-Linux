# printf 格式化输出

基本格式：`printf [format] [文本1] [文本2] ..`

## 常用格式替换符
| 替换符  | 含义                                  |
| ------- | ------------------------------------- |
| `%s`    | 字符串                                |
| `%f`    | 浮点格式                              |
| `%c`    | ASCII字符，即显示对应参数的第一个字符 |
| `%d,%i` | 十进制整数                            |
| `%o`    | 八进制值                              |
| `%u`    | 不带正负号的十进制值                  |
| `%x`    | 十六进制值（a-f）                     |
| `%X`    | 十六进制值（A-F）                     |
| `%%`    | 表示%本身                             |



## 常用转义字符
| 转义字符 | 含义                           |
| -------- | ------------------------------ |
| `\a`     | 警告字符，通常为ASCII的BEL字符 |
| `\b`     | 后退                           |
| `\f`     | 换页                           |
| `\n`     | 换行                           |
| `\r`     | 回车                           |
| `\t`     | 水平制表符                     |
| `\v`     | 垂直制表符                     |
| `\\`     | 表示\本身                      |



## 使用示例

```sh
[root@localhost ~]# printf "%s\n" 1 2 3 4
1
2
3
4
[root@localhost ~]# printf "%f\n" 1 2 3 4
1.000000
2.000000
3.000000
4.000000
[root@localhost ~]# printf "%.2f\n" 1 2 3 4
1.00
2.00
3.00
4.00
[root@localhost ~]# printf " (%s) " 1 2 3 4;echo ""
 (1)  (2)  (3)  (4)
[root@localhost ~]# printf "%s %s\n" 1 2 3 4
1 2
3 4
[root@localhost ~]# printf "%s %s %s\n" 1 2 3 4
1 2 3
4
[root@localhost ~]# #"-"表示左对齐, "10 10 4 4" 表示占的字符位数, 不够不空格
[root@localhost ~]# printf "%-10s %-10s %-4s %-4s \n" 姓名 性别 年龄 体重 苹果 男 18 60 香蕉 男 18 80
姓名     性别     年龄 体重
苹果     男        18   60
香蕉     男        18   80
[root@localhost ~]# printf "%X" 13    #10进制转16进制
D[root@localhost ~]# printf "%X\n" 13
D
[root@localhost ~]# printf "%d\n" 0xB    #16进制转10进制
11
[root@localhost ~]#
```

```sh
[root@localhost ~]# printf "%0.s*" {1..52}
****************************************************[root@localhost ~]#
```
