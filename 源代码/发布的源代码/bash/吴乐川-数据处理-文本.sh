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

        # echo -e "〔调试〕： \e[0;33m'$Char'\e[0;0m 的等效宽度： \e[0;91m${CharWidth}\e[0;0m  ${TextFullWidth}"
    done

    echo $TextFullWidth
}





function ConvertTo-吴乐川将文本转换为多行文本 {
    local HAN_CHARACTER_PER_LINE_DEFAULT_MAX_COUNT=30
    local SHOULD_DEBUG=1





    # --内容分割记号          至多出现 1 次。    非空白文本。
    # --这批依赖包之依赖类别   至多出现 1 次。    '本产品拟囊括这些软件之整体或部分' | '本产品仅会在研发阶段借助这些软件'
    # --应仅作仿真演练        至多出现 1 次。    1 | 0 | true | false
    # --某依赖包之版本配置    可多次出现。        非空白文本。





    function _打印针对当前处理的参数的错误信息 {
        echo -e "\e[0;31m在命令参数表中的 “ \e[0;97m${_ProcessingArgumentName}\e[0;31m ” 参数：\n    \e[0;33m${1}\e[0;0m"
    }





    local OriginalText=''
    local HanCharacterPerLineMaxCount='undefined'
    local ShouldAddASpaceAfterLastEnglishWordPerLine='undefined' # 'true' 或其它值。
    local ShouldDoubleOriginalLineBreaks='undefined' # 'true' 或其它值。



    local _TemporaryArgumentValue
    local _ProcessingArgumentName
    local _ProcessedArgumentsCount=0
    local _CurrentArgumentOrArgumentPairHaveRecognized=0

    while [[ ! -z "$1" && $_ProcessedArgumentsCount -lt 2048 ]]; do
        if [ $SHOULD_DEBUG -eq 1 ]; then
            echo "〔调试〕： arg[${_ProcessedArgumentsCount}]='$1'"
        fi

        _ProcessedArgumentsCount=$((_ProcessedArgumentsCount+1))
        _CurrentArgumentOrArgumentPairHaveRecognized=0

        # ---------------------------------------------------------------

        _ProcessingArgumentName='--单行等效汉字字数上限'
        _TemporaryArgumentValue=''

         if [ "$1" == "${_ProcessingArgumentName}" ]; then
            _CurrentArgumentOrArgumentPairHaveRecognized=1
            shift

            if [ "${HanCharacterPerLineMaxCount}" != 'undefined' ]; then
                _打印针对当前处理的参数的错误信息  '不应重复出现。〔1〕。'
                return
            fi

            if [[ "$1" =~ ^- ]]; then
                _打印针对当前处理的参数的错误信息  '后面没有给出值。〔1〕。'
                return
            fi

            if [ -z "$1" ]; then
                _打印针对当前处理的参数的错误信息  '后面没有给出值。〔2〕。'
                return
            fi

            _TemporaryArgumentValue="$1"
            shift
        elif [[ "$1" =~ ^"${_ProcessingArgumentName}"= ]]; then
            _CurrentArgumentOrArgumentPairHaveRecognized=1

            if [ "${HanCharacterPerLineMaxCount}" != 'undefined' ]; then
                _打印针对当前处理的参数的错误信息  '不应重复出现。〔2〕。'
                shift
                return
            fi

            _TemporaryArgumentValue=${1:${#_ProcessingArgumentName}+1}
            shift

            if [ "$_TemporaryArgumentValue" == '0' ]; then
                HanCharacterPerLineMaxCount=0
            elif [ -z "${_TemporaryArgumentValue}" ]; then
                _打印针对当前处理的参数的错误信息  '等号（=）后面没有给出值。〔3〕。'
                return
            fi
        fi

        if [ ! -z "$_TemporaryArgumentValue" ]; then
            if [[ ! "${_TemporaryArgumentValue}" =~ ^[1-9][0-9]*$ ]]; then
                _打印针对当前处理的参数的错误信息  "给出值不合规。给出的值为 “ \e[0;33m${_TemporaryArgumentValue}\e[0;0m ” 。〔2〕。"
                return
            else
                HanCharacterPerLineMaxCount=$_TemporaryArgumentValue
            fi
        fi

        # ---------------------------------------------------------------

        _ProcessingArgumentName='--英语单词在行尾时其后应保留一个空格'
        _TemporaryArgumentValue=''

        if [ "$1" == "${_ProcessingArgumentName}" ]; then
            _CurrentArgumentOrArgumentPairHaveRecognized=1
            shift

            if [ "${ShouldAddASpaceAfterLastEnglishWordPerLine}" != 'undefined' ]; then
                _打印针对当前处理的参数的错误信息  "不应重复出现。〔1〕。已有参数将其配置为 “ \e[0;32m${ShouldAddASpaceAfterLastEnglishWordPerLine}\e[0;33m ” 。"
                return
            fi

            ShouldAddASpaceAfterLastEnglishWordPerLine='true'

            if [[ "$1" =~ ^- ]]; then continue; fi

            if [[ -z "$1" ]]; then continue; fi

            _TemporaryArgumentValue="$1"
            shift
        elif [[ "$1" =~ ^"${_ProcessingArgumentName}"= ]]; then
            _CurrentArgumentOrArgumentPairHaveRecognized=1

            if [ "${ShouldAddASpaceAfterLastEnglishWordPerLine}" != 'undefined' ]; then
                _打印针对当前处理的参数的错误信息  '不应重复出现。〔2〕。'
                shift
                return
            fi

            _TemporaryArgumentValue=${1:${#_ProcessingArgumentName}+1}
            shift

            if [ "$_TemporaryArgumentValue" == '0' ]; then
                _TemporaryArgumentValue='false'
            elif [ -z "$_TemporaryArgumentValue" ]; then
                _打印针对当前处理的参数的错误信息  '等号（=）后面没有给出值。〔1〕。'
                return
            fi
        fi

        if [ ! -z "${_TemporaryArgumentValue}" ]; then
            if [ "${_TemporaryArgumentValue}" == 'true' ] || [ "${_TemporaryArgumentValue}" == 'true' ] || [[ "$_TemporaryArgumentValue" =~ ^[01]$ ]]; then
                ShouldAddASpaceAfterLastEnglishWordPerLine='true'
            else
                ShouldAddASpaceAfterLastEnglishWordPerLine='false'
            fi
        fi

        # ---------------------------------------------------------------

        _ProcessingArgumentName='--原文本中的每个换行符在产生的内容中应改作两个换行符'
        _TemporaryArgumentValue=''

        if [ "$1" == "${_ProcessingArgumentName}" ]; then
            _CurrentArgumentOrArgumentPairHaveRecognized=1
            shift

            if [ "${ShouldDoubleOriginalLineBreaks}" != 'undefined' ]; then
                _打印针对当前处理的参数的错误信息  "不应重复出现。〔1〕。已有参数将其配置为 “ \e[0;32m${ShouldDoubleOriginalLineBreaks}\e[0;33m ” 。"
                return
            fi

            ShouldDoubleOriginalLineBreaks='true'

            if [[ "$1" =~ ^- ]]; then continue; fi

            if [[ -z "$1" ]]; then continue; fi

            _TemporaryArgumentValue="$1"
            shift
        elif [[ "$1" =~ ^"${_ProcessingArgumentName}"= ]]; then
            _CurrentArgumentOrArgumentPairHaveRecognized=1

            if [ "${ShouldDoubleOriginalLineBreaks}" != 'undefined' ]; then
                _打印针对当前处理的参数的错误信息  '不应重复出现。〔2〕。'
                shift
                return
            fi

            _TemporaryArgumentValue=${1:${#_ProcessingArgumentName}+1}
            shift

            if [ "${_TemporaryArgumentValue}" == '0' ]; then
                _TemporaryArgumentValue='false'
            elif [ -z "${_TemporaryArgumentValue}" ]; then
                _打印针对当前处理的参数的错误信息  '等号（=）后面没有给出值。〔1〕。'
                return
            fi
        fi

        if [ ! -z "${_TemporaryArgumentValue}" ]; then
            if [ "${_TemporaryArgumentValue}" == 'true' ] || [ "${_TemporaryArgumentValue}" == 'true' ] || [[ "$_TemporaryArgumentValue" =~ ^[01]$ ]]; then
                ShouldDoubleOriginalLineBreaks='true'
            else
                ShouldDoubleOriginalLineBreaks='false'
            fi
        fi

        # ---------------------------------------------------------------

        if [ $_CurrentArgumentOrArgumentPairHaveRecognized -eq 0 ]; then
            OriginalText+="$1"
            shift
        fi
    done

    _ProcessingArgumentName=''
    _TemporaryArgumentValue=''

    if [[ "${HanCharacterPerLineMaxCount}" == '0' || "${HanCharacterPerLineMaxCount}" == 'undefined' ]]; then
        HanCharacterPerLineMaxCount=$HAN_CHARACTER_PER_LINE_DEFAULT_MAX_COUNT
    fi

    if [ "${ShouldAddASpaceAfterLastEnglishWordPerLine}" == 'undefined' ]; then
        ShouldAddASpaceAfterLastEnglishWordPerLine='false'
    fi

    if [ "${ShouldDoubleOriginalLineBreaks}" == 'undefined' ]; then
        ShouldDoubleOriginalLineBreaks='false'
    fi



    if [ $SHOULD_DEBUG -eq 1 ]; then
        echo
        echo  -e  "〔调试〕： 单行等效汉字字数上限：\n           \e[0;33m${HanCharacterPerLineMaxCount}\e[0;0m"
        echo
        echo  -e  "〔调试〕： 英语单词在行尾时其后应保留一个空格：\n           \e[0;33m${ShouldAddASpaceAfterLastEnglishWordPerLine}\e[0;0m"
        echo
        echo  -e  "〔调试〕： 原文本中的每个换行符在产生的内容中应改作两个换行符：\n           \e[0;33m${ShouldDoubleOriginalLineBreaks}\e[0;0m"
        echo
        echo  -e  "〔调试〕： 原文本： \e[0;91m'\e[0;33m${OriginalText}\e[0;91m'\e[0;0m"
        echo
    fi
}
