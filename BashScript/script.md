
# Shell script



## shell里有没有类似于C语言fflush这种，刷新缓冲区的命令


1. 试试 sync 命令。
sync writes any data buffered in memory out to disk.
但不清楚是不是将缓冲区给清空了。

2. sync不行的话用 awk 吧，awk里的语法同C语言，可以直接使用C语句。
echo "" | awk '{fflush()}'

4
int c;
while((c = getchar()) != '\n' && c != EOF);









## shell实现判断输入的数字是否为合理的浮点数

```bash
#!/bin/sh
 
# validfloat -- Tests whether a number is a valid floating-point value.
# Note that this script cannot accept scientific (1.304e5) notation.
 
# To test whether an entered value is a valid floating-point number, we
# need to split the value at the decimal point. We then test the first part
# to see if it's a valid integer, then test the second part to see if it's a
# valid >=0 integer, so -30.5 is valid, but -30.-8 isn't.
 
. validint  # Bourne shell notation to source the validint function
 
validfloat()
{
 fvalue="$1"
 
 if [ ! -z $(echo $fvalue | sed 's/[^.]//g') ] ; then
 
  decimalPart="$(echo $fvalue | cut -d. -f1)"
  fractionalPart="$(echo $fvalue | cut -d. -f2)"
 
  if [ ! -z $decimalPart ] ; then
   if ! validint "$decimalPart" "" "" ; then
    return 1
   fi
  fi
 
  if [ "${fractionalPart%${fractionalPart#?}}" = "-" ] ; then
   echo "Invalid floating-point number: '-' not allowed \
    after decimal point" >&2
   return 1
  fi
  if [ "$fractionalPart" != "" ] ; then
   if ! validint "$fractionalPart" "0" "" ; then
    return 1
   fi
  fi
 
  if [ "$decimalPart" = "-" -o -z "$decimalPart" ] ; then
   if [ -z $fractionalPart ] ; then
    echo "Invalid floating-point format." >&2 ; return 1
   fi
  fi
 
 else
  if [ "$fvalue" = "-" ] ; then
   echo "Invalid floating-point format." >&2 ; return 1
  fi
 
  if ! validint "$fvalue" "" "" ; then
   return 1
  fi
 fi
 
 return 0
}
```

notice::

1. `if [ ! -z $(echo $fvalue | sed 's/[^.]//g') ]` 将输入，以.分成整数和小数部分。
2. `if [ "${fractionalPart%${fractionalPart#?}}" = "-" ]` 判断小数点后面如果接‘-'号，这输出字符不合法
3. 接着的一些if语句就是判断小数及整数部分合不合法
4. 由于 valiint函数没给出，脚本不能完全执行，valiint函数是判断字符串是否全为数字.

