# declare


declare[+/-][选项]变量名
* `-` ：给变量设置类型属性
* `+` ：取消变量的类型属性
* `-a` ：将变量声明为数组型
* `-i` ：将变量声明为整数型（integer）
* `-x` ：将变量声明为环境变量
  * export=declare -x
* `-r` ：将变量声明为只读变量
* `-p` ：显示指定变量的被声明的类型



## associated Array 关联数组
* 类似高级语言中的字典
* 每个元素都有一个名字
* 但不能用索引引用
* 但可以将元素的名称赋值为数字索引

```sh
[root@localhost Desktop]# declare -A color
[root@localhost Desktop]# color[black]='heise'
[root@localhost Desktop]# color["red"]='hongse'
[root@localhost Desktop]# color['green']='lvse'
[root@localhost Desktop]# color['blue']=lanse
[root@localhost Desktop]# color['purple']=
[root@localhost Desktop]# echo ${color[*]}
hongse lanse lvse heise
[root@localhost Desktop]# echo ${color[@]}
hongse lanse lvse heise
[root@localhost Desktop]# echo ${!color[*]}
red blue green black purple
[root@localhost Desktop]# echo ${!color[@]}
red blue green black purple
[root@localhost Desktop]# echo ${#color[@]}
5
[root@localhost Desktop]# echo ${#color[*]}
5
[root@localhost Desktop]# echo "${color[black]}"
heise
[root@localhost Desktop]# echo "${color[green]}"
lvse
[root@localhost Desktop]# echo "${color[purple]}"

[root@localhost Desktop]# echo "${color[notexist]}"

[root@localhost Desktop]# 
[root@localhost Desktop]# color[8]='fa'
[root@localhost Desktop]# echo ${color[*]}
hongse lanse lvse fa heise
[root@localhost Desktop]# echo ${color[@]}
hongse lanse lvse fa heise
[root@localhost Desktop]# echo ${color[8]}
fa
[root@localhost Desktop]# echo ${color[0]}

[root@localhost Desktop]# echo ${color[1]}

[root@localhost Desktop]# 
```


## indexed Array 索引数组
* 类似高级语言中的列表
* 每个元素都有一个索引，0123，元素没有名称
* 元素名称不能赋值为数字之外的名称

```sh
[root@localhost Desktop]# declare -a indexa
[root@localhost Desktop]# indexa[0]=0
[root@localhost Desktop]# indexa[1]=1
[root@localhost Desktop]# indexa[2]=20
[root@localhost Desktop]# indexa[3]=3
[root@localhost Desktop]# indexa[4]=23
[root@localhost Desktop]# indexa[5]=66
[root@localhost Desktop]# echo ${indexa[*]}
0 1 20 3 23 66
[root@localhost Desktop]# echo ${indexa[@]}
0 1 20 3 23 66
[root@localhost Desktop]# echo ${!indexa[*]}
0 1 2 3 4 5
[root@localhost Desktop]# echo ${!indexa[@]}
0 1 2 3 4 5
[root@localhost Desktop]# echo ${#indexa[*]}
6
[root@localhost Desktop]# echo ${#indexa[@]}
6
[root@localhost Desktop]# echo ${indexa[0]}
0
[root@localhost Desktop]# echo ${indexa[2]}
20
[root@localhost Desktop]# echo ${indexa[1]}
1
[root@localhost Desktop]# 
[root@localhost Desktop]# indexa['haha']=kaixin
-bash: 'haha': syntax error: operand expected (error token is "'haha'")
[root@localhost Desktop]# 
```



————————————————
版权声明：本文为CSDN博主「「已注销」」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/Forcezs/article/details/80511828
