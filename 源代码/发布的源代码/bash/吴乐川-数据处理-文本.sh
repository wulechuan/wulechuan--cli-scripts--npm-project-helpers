function Assert-吴乐川判断字符系中日韩文字 {
    local Char="$1"

    if [ ${#Char} -eq 0 ]; then
        echo '空内容'
        return
    fi

    if [ ${#Char} -gt 1 ]; then
        echo "'${Char}'：不止一个字符"
        return
    fi

    # * 中国汉字 "\u4E01" ~ "\u9FA5"
    # * 朝鲜文   "\u3130" ~ "\u318F"
    # * 朝鲜文   "\uAC00" ~ "\uD7A3"
    # * 日文     "\u0800" ~ "\u4E00"

    if [[

        # 以下仅第 1 种写法有效。故取第 1 种。
        "$Char" =~ [丁-龥]
        # "$Char" =~ "[`echo -en "\u4e01-\u9fa5"`]"

    ]] || [[

        # 以下仅第 1 中写法验证过。第 2 种我不会验证，也不在意。故意略过。
        "$Char" =~ [㄰-㆏]
        # "$Char" =~ "[`echo -en "\u3130-\u318F"`]"

    ]] || [[

        # 以下两种写法均有效。决定取第二种。
        # "$Char" =~ [가-힣]
        "$Char" =~ [`echo -en "\uAC00-\uD7A3"`]

    ]] || [[

        # 以下仅第 1 种写法有效。故取第 1 种。
        "$Char" =~ [ࠀ-一]
        # "$Char" =~ "[`echo -en "\u0800-\u4E00"`]"

    ]] || [[
        "$Char" =~ [“”‘’…：，；？！、。（）〈〉《》「」『』【】〒〓〔〕〖〗〝〞｛｝〃々〆〇〡〢〣〤〥〦〧〨〩]
    ]]; then
        echo 1
    else
        echo 0
    fi
}





function Assert-吴乐川判断排版时该字词之前不宜换行 {
    local Char="$1"

    if [ ${#Char} -eq 0 ]; then
        echo 0
        return
    fi

    if [ ${#Char} -gt 1 ]; then
        Char=${Char:0:1}
    fi

    if [[
        "$Char" =~ [,:：，；？！、。）〉》」』】〗〕｝”’…·]
    ]] || [[
        "$Char" == '.' || \
        "$Char" == '!' || \
        "$Char" == ';' || \
        "$Char" == ')' || \
        "$Char" == ']' || \
        "$Char" == '}'
    ]]; then
        echo 1
    else
        echo 0
    fi
}





function Get-吴乐川求一行文本视觉宽度等效英语字母数 {
    local Text="$1"
    if [ "$Text" == '0' ]; then
        echo 1
        return
    fi

    if [ -z "$Text" ]; then
        echo 0
        return
    fi

    local TextCharCount="${#Text}"

    local _temp_looping_index=0

    local Char=''
    local CharWidth=0
    local TextFullWidth=0

    for ((_temp_looping_index=0; _temp_looping_index<$TextCharCount; _temp_looping_index++)); do
        Char=${Text:$_temp_looping_index:1}

        CharWidth=1

        if [ `Assert-吴乐川判断字符系中日韩文字 $Char` -eq 1 ] && [[ ! "$Char" =~ [\“\”\‘\’…] ]]; then
            CharWidth=2
        fi

        TextFullWidth=$((TextFullWidth+CharWidth))

        # echo -e "〔调试〕： \e[0;33m'$Char' 的等效宽度： \e[0;91m${CharWidth}\e[0;0m  ${TextFullWidth}"
    done

    echo $TextFullWidth
}
