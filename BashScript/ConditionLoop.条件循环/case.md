# case
Shell case 语句为多选择语句。  
可以用case语句匹配一个值与一个模式，如果匹配成功，执行相匹配的命令。  
case语句格式如下：
```sh
case 值 in
    模式1)
        command1
        ...
        commandN
        ;;
    模式2)
        command1
        ...
        commandN
        ;;
    *)
        command1
        ...
        commandN
        ;;
esac
```

case工作方式如上所示。取值后面必须为单词 `in` ，每一模式必须以右括号结束。取值可以为变量或常数。  
匹配发现取值符合某一模式后，其间所有命令开始执行直至 `;;`。  
`;;` 与其他语言中的 `break` 类似，意思是跳到整个 case 语句的最后。

取值将检测匹配的每一个模式。
* 一旦模式匹配，则执行完匹配模式相应命令后不再继续其他模式。
* 如果无一匹配模式，使用星号 `*` 捕获该值，再执行后面的命令。

Example:
```sh
# 一个Inspur的例子
case $i in 
--sn*)
    sn=${i/*=/}
    ;;
--test_status*)
    test_status=${i/*=/}
    ;;
--error_code*)
    error_code=${i/*=/}
    ;;
--error_msg*)
    error_msg=${i/*=/}
    ;;
--ttf*)
    ttf=${i/*=/}
    ;;
--retest*)
    retest=${i/*=/}
    ;;
--opid*)
    opid=${i/*=/}
    ;;		
*)
    error_msg="${error_msg} ${i/*=/}"
    ;;
esac
```


