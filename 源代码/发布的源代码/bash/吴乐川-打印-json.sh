# 应用示例：
#
# ```bash
# echo -e "\e[33m以下是在 package.json 中的特殊记载及其解释\e[0;0m"
# echo
# echo '{'
# Write-吴乐川打印_JSON_键           -Indent 1 'overrides' -ValueIsObject
# Write-吴乐川打印_JSON_键           -Indent 2 'stylus' -ValueIsObject
# echo
# Write-吴乐川打印_JSON_注释_并换行  -Indent 3 '// 实验证明，截止 2022-05-15 ，'
# Write-吴乐川打印_JSON_注释_并换行  -Indent 3 '// Stylus 依赖的 glob 不能采用最晚近的 v7.2.2 版。'
# Write-吴乐川打印_JSON_注释_并换行  -Indent 3 '// glob 不能采用 v7.2.1 版不存在。'
# Write-吴乐川打印_JSON_注释_并换行  -Indent 3 '// 故最高仅能采用 v7.2.0 版。'
# Write-吴乐川打印_JSON_键           -Indent 3 'glob'
# Write-吴乐川打印_JSON_值_文本型    -IsValueOfLastKey '7.2.0'
# Write-吴乐川打印_JSON_某字典结束   -Indent 2
# Write-吴乐川打印_JSON_某字典结束   -Indent 1
# echo '}'
# ```



function Write-吴乐川打印_JSON_键 {
    local indentLevel=0
    local key=''
    local valueIsObject=0
    local valueIsArray=0

    if [ "$1" == '-Indent' ]; then
        shift
        indentLevel=$1
        shift
    fi

    key="$1"
    shift

    if [ "$1" == '-ValueIsObject' ]; then
        valueIsObject=1
        shift
    fi

    if [ "$1" == '-valueIsArray' ]; then
        valueIsArray=1
        shift
    fi

    if [ $indentLevel -gt 0 ]; then
        local i=0
        while [ $i -lt $indentLevel ]; do
            echo -n "    "
            i=$((i+1))
        done
    fi

    echo -en "\"\e[32m${key}\e[0;0m\": "

    if [ $valueIsObject == 1 ]; then
        echo '{'
    fi

    if [ $valueIsArray == 1 ]; then
        echo '['
    fi
}



function Write-吴乐川打印_JSON_某字典结束 {
    local indentLevel=0

    if [ "$1" == '-Indent' ]; then
        shift
        indentLevel=$1
        shift
    fi

    if [ $indentLevel -gt 0 ]; then
        local i=0
        while [ $i -lt $indentLevel ]; do
            echo -n "    "
            i=$((i+1))
        done
    fi

    echo '}'
}



function Write-吴乐川打印_JSON_值_某列表结束 {
    local indentLevel=0

    if [ "$1" == '-Indent' ]; then
        shift
        indentLevel=$1
        shift
    fi

    if [ $indentLevel -gt 0 ]; then
        local i=0
        while [ $i -lt $indentLevel ]; do
            echo -n "    "
            i=$((i+1))
        done
    fi

    echo ']'
}



function Write-吴乐川打印_JSON_值_文本型 {
    local isValueOfLastKey=0
    local value=''

    if [ "$1" == '-IsValueOfLastKey' ]; then
        isValueOfLastKey=1
        shift
    fi

    value="$1"

    echo -en "\"\e[0;91m${value}\e[0;0m\""

    if [ ! $isValueOfLastKey ]; then
        echo -n ','
    fi

    echo
}



function Write-吴乐川打印_JSON_注释_并换行 {
    local indentLevel=0
    local comment=''

    if [ "$1" == '-Indent' ]; then
        shift
        indentLevel=$1
        shift
    fi

    comment="$1"

    if [ $indentLevel -gt 0 ]; then
        local i=0
        while [ $i -lt $indentLevel ]; do
            echo -n "    "
            i=$((i+1))
        done
    fi

    echo -e "\e[91m${comment}\e[0;0m"
}
