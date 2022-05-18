# regex.regularExpression.正则表达式


```sh
line='CATEGORY=BaseBoard'

if [[ $line =~ (Base)(Board) ]]; then
    echo "BASH_REMATCH: ${BASH_REMATCH}"
    echo "BASH_REMATCH[*]: ${BASH_REMATCH[*]}"
    echo "#BASH_REMATCH[*]: ${#BASH_REMATCH[*]}"
    echo "BASH_REMATCH[@]: ${BASH_REMATCH[@]}"
    echo "#BASH_REMATCH[@]: ${#BASH_REMATCH[@]}"
    echo "BASH_REMATCH[1]: ${BASH_REMATCH[1]}"
    echo "BASH_REMATCH[2]: ${BASH_REMATCH[2]}"

    echo -e "\n=-=-=-=-=-=-=-=-=-=-=-=-=\nFor BASH_REMATCH[*]"
    for item in "${BASH_REMATCH[*]}"
    do
        echo $item
    done

    echo -e "\n=-=-=-=-=-=-=-=-=-=-=-=-=\nFor BASH_REMATCH[@]"
    for item in "${BASH_REMATCH[@]}"
    do
        echo $item
    done

    echo -e "\n=-=-=-=-=-=-=-=-=-=-=-=-=\nFor quoted \"BASH_REMATCH[*]\""
    for item in ${BASH_REMATCH[*]}
    do
        echo $item
    done

    echo -e "\n=-=-=-=-=-=-=-=-=-=-=-=-=\nFor quoted \"BASH_REMATCH[@]\""
    for item in ${BASH_REMATCH[@]}
    do
        echo $item
    done
fi
```


```
BASH_REMATCH: BaseBoard
BASH_REMATCH[*]: BaseBoard Base Board
#BASH_REMATCH[*]: 3
BASH_REMATCH[@]: BaseBoard Base Board
#BASH_REMATCH[@]: 3
BASH_REMATCH[1]: Base
BASH_REMATCH[2]: Board

=-=-=-=-=-=-=-=-=-=-=-=-=
For BASH_REMATCH[*]
BaseBoard Base Board

=-=-=-=-=-=-=-=-=-=-=-=-=
For BASH_REMATCH[@]
BaseBoard
Base
Board

=-=-=-=-=-=-=-=-=-=-=-=-=
For quoted "BASH_REMATCH[*]"
BaseBoard
Base
Board

=-=-=-=-=-=-=-=-=-=-=-=-=
For quoted "BASH_REMATCH[@]"
BaseBoard
Base
Board
```





## ref
* []()
* []()
* []()
* []()
* []()
* []()

