



```sh
function variable_get_from_conf () {
    echo "Get variable from conf file..."

    local file=$1
    echo $file
    # $1 file contains the parameter, value.

    if [ -e ${file} ]; then
        rm -f temp.log
        cat ${file} | egrep -v "^#" | egrep -v "^$" > temp.log

        while read line
        do
            echo $line | grep "=" > /dev/null
            if [ $? -eq 0 ]; then
                echo "LINE: $line"
                # sleep 1
            else
                echo "No = in line: \"$line\""
                continue
            fi

            line=`echo $line | sed 's/export //g'`
            para=`echo $line | awk -F= '{print $1}'`
            value=`echo $line | awk -F= '{print $2}'`

            echo $value | egrep "[ \./]" > /dev/null
            if [ $? -eq 0 ]; then
                echo $value | grep "\"" > /dev/null
                if [ $? -eq 0 ]; then
                    cmd="export $para=$value"
                else
                    cmd="export $para=\"$value\""
                fi
            else
                cmd="export $para=$value"
            fi
            # cmd="export $para=$value"
            echo "CMD: $cmd"
            eval "$cmd"
            echo " "
        done < temp.log

    fi
}

```
