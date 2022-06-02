function Assert-吴乐川判断字符系中日韩文字_直接回显结论 {
    local Char="$1"
    local ResultReceiver
    Assert-吴乐川判断字符系中日韩文字_须采用接收器变量  ResultReceiver  "$Char"
    echo  $ResultReceiver
}

function Assert-吴乐川判断字符系中日韩文字_须采用接收器变量 {
    local Char="$2"

    if [ ${#Char} -eq 0 ]; then
        eval "$1='空内容'"
        return
    fi

    if [ ${#Char} -gt 1 ]; then
        eval "$1='“${Char}”：不止一个字符'"
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
        eval "$1=true"
    else
        eval "$1=false"
    fi
}





function Assert-吴乐川判断排版时该字词之前不宜换行_直接回显结论 {
    local Char="$1"
    local ResultReceiver
    Assert-吴乐川判断排版时该字词之前不宜换行_须采用接收器变量  ResultReceiver  "$Char"
    echo  $ResultReceiver
}

function Assert-吴乐川判断排版时该字词之前不宜换行_须采用接收器变量 {
    local Char="$2"

    if [ ${#Char} -eq 0 ]; then
        eval "$1=false"
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
        eval "$1=true"
    else
        eval "$1=false"
    fi
}





function Get-吴乐川求一行文本视觉宽度等效英语字母数_直接回显结论 {
    local Text="$1"
    local ResultReceiver
    Assert-吴乐川求一行文本视觉宽度等效英语字母数_须采用接收器变量  ResultReceiver  "$Text"
    echo  $ResultReceiver
}

function Get-吴乐川求一行文本视觉宽度等效英语字母数_须采用接收器变量 {
    local Text="$2"
    if [ "$Text" == '0' ]; then
        eval "$1=1"
        return
    fi

    if [ -z "$Text" ]; then
        eval "$1=0"
        return
    fi

    local TextCharCount="${#Text}"

    local LoopIndex=0

    local Char=''
    local CharWidth=0
    local TextFullWidth=0
    local CharIsHan='false'

    for ((LoopIndex=0; LoopIndex<$TextCharCount; LoopIndex++)); do
        Char=${Text:$LoopIndex:1}

        CharWidth=1

        Assert-吴乐川判断字符系中日韩文字_须采用接收器变量  CharIsHan  "$Char"
        if [ "$CharIsHan" == 'true' ] && [[ ! "$Char" =~ [\“\”\‘\’…] ]]; then
            CharWidth=2
        fi

        TextFullWidth=$((TextFullWidth+CharWidth))

        # echo -e "〔调试〕： \e[0;33m'$Char'\e[0;0m 的等效宽度： \e[0;91m${CharWidth}\e[0;0m  ${TextFullWidth}"
    done

    eval "$1=$TextFullWidth"
}





function ConvertTo-吴乐川将文本转换为多行文本_直接回显结论 {
    local ResultReceiver_TheLinesArray
    local ResultReceiver_TheLinesCount
    local _IFS_BACKUP_="$IFS"

    ConvertTo-吴乐川将文本转换为多行文本_须采用接收器变量 \
        --用以接收排好版的文本的逐行文本列表的变量名 ResultReceiver_TheLinesArray \
        --用以接收排好版的文本的行数的变量名 ResultReceiver_TheLinesCount \
        $*

    # if false; then
    #     echo  -e  '〔调试〕：────────────────────────────────────────────────────────────────────────────────'
    #     echo  -e  "〔调试〕： 行数： ${ResultReceiver_TheLinesCount} 。"
    #     echo  -e  '〔调试〕：────────────────────────────────────────────────────────────────────────────────'
    # fi

    IFS='' # 很关键。

    local line=''
    for line in ${ResultReceiver_TheLinesArray[@]}; do
        if [ "$line" == '\n' ]; then
            echo
        else
            echo "$line"
        fi
    done

    # echo  -e  '〔调试〕：────────────────────────────────────────────────────────────────────────────────'

    IFS="$_IFS_BACKUP_"
}

function ConvertTo-吴乐川将文本转换为多行文本_须采用接收器变量 {
    local HAN_CHARACTER_PER_LINE_DEFAULT_MAX_COUNT=30
    local SHOULD_DEBUG=0





    # --用以接收排好版的文本的全文的变量名                                       变量名。
    # --用以接收排好版的文本的逐行文本列表的变量名                                变量名。
    #
    #   以上两个参数，必须至少出现一个。可以同时出现。且任何一个参数均不可多次出现。
    #
    #
    # --用以接收排好版的文本的行数的变量名                      至多出现 1 次。    变量名。
    #
    # --单行等效汉字字数上限                                  至多出现 1 次。    正整数。
    # --英语单词在行尾时其后应保留一个空格                      至多出现 1 次。    1 | 0 | true | false
    # --原文本中的每个换行符在产生的内容中应改作两个换行符        至多出现 1 次。    1 | 0 | true | false





    function Write-_吴乐川打印针对当前处理的参数的错误信息 {
        echo -e "\e[0;31m在命令参数表中的 “ \e[0;97m${_ProcessingArgumentName}\e[0;31m ” 参数：\n    \e[0;33m${1}\e[0;0m"
    }





    local ResultReceiverVarName_FullText='*|undefined|*'
    local ResultReceiverVarName_TextLinesArray='*|undefined|*'
    local ResultReceiverVarName_CountOfLines='*|undefined|*'

    local OriginalText=''
    local HanCharacterPerLineMaxCount='undefined'
    local ShouldAddASpaceAfterLastEnglishWordPerLine='undefined' # 'true' 或其它值。
    local ShouldDoubleOriginalLineBreaks='undefined' # 'true' 或其它值。



    local _TemporaryArgumentValue
    local _ProcessingArgumentName
    local _ProcessedArgumentsCount=0
    local _CurrentArgumentOrArgumentPairHaveRecognized=0

    while [[ ! -z "$1" && $_ProcessedArgumentsCount -lt 2048 ]]; do
        # if [ $SHOULD_DEBUG -eq 1 ]; then
        #     echo "〔调试〕： arg[${_ProcessedArgumentsCount}]='$1'"
        # fi

        _ProcessedArgumentsCount=$((_ProcessedArgumentsCount+1))
        _CurrentArgumentOrArgumentPairHaveRecognized=0

        # ---------------------------------------------------------------

        _ProcessingArgumentName='--用以接收排好版的文本的全文的变量名'
        _TemporaryArgumentValue=''

        if [ "$1" == "${_ProcessingArgumentName}" ]; then
            _CurrentArgumentOrArgumentPairHaveRecognized=1
            shift

            # echo  -e  "已经遇到 “ \e[0;91m${_ProcessingArgumentName}\e[0;0m ”。其后还有 \e[0;96m$#\e[0;0m 个参数未处理。"

            if [ "${ResultReceiverVarName_FullText}" != '*|undefined|*' ]; then
                Write-_吴乐川打印针对当前处理的参数的错误信息  '不应重复出现。〔1〕。'
                return
            fi

            if [[ "$1" =~ ^- ]]; then
                Write-_吴乐川打印针对当前处理的参数的错误信息  '后面没有给出值。〔1〕。'
                return
            fi

            if [ -z "$1" ]; then
                Write-_吴乐川打印针对当前处理的参数的错误信息  '后面没有给出值。〔2〕。'
                return
            fi

            _TemporaryArgumentValue="$1"
            shift
        elif [[ "$1" =~ ^"${_ProcessingArgumentName}"= ]]; then
            _CurrentArgumentOrArgumentPairHaveRecognized=1

            if [ "${ResultReceiverVarName_FullText}" != '*|undefined|*' ]; then
                Write-_吴乐川打印针对当前处理的参数的错误信息  '不应重复出现。〔2〕。'
                shift
                return
            fi

            _TemporaryArgumentValue=${1:${#_ProcessingArgumentName}+1}
            shift

            if [ -z "${_TemporaryArgumentValue}" ]; then
                Write-_吴乐川打印针对当前处理的参数的错误信息  '等号（=）后面没有给出值。〔3〕。'
                return
            fi
        fi

        if [ ! -z "${_TemporaryArgumentValue}" ]; then
            if [[ ! "${_TemporaryArgumentValue}" =~ ^[a-zA-Z_-][0-9a-zA-Z_-]*$ ]]; then
                Write-_吴乐川打印针对当前处理的参数的错误信息  "给出值不合规。给出的值为 “ \e[0;33m${_TemporaryArgumentValue}\e[0;0m ” 。〔2〕。"
                return
            else
                ResultReceiverVarName_FullText=$_TemporaryArgumentValue
            fi
        fi

        # ---------------------------------------------------------------

        _ProcessingArgumentName='--用以接收排好版的文本的逐行文本列表的变量名'
        _TemporaryArgumentValue=''

        if [ "$1" == "${_ProcessingArgumentName}" ]; then
            _CurrentArgumentOrArgumentPairHaveRecognized=1
            shift

            # echo  -e  "已经遇到 “ \e[0;91m${_ProcessingArgumentName}\e[0;0m ”。其后还有 \e[0;96m$#\e[0;0m 个参数未处理。"

            if [ "${ResultReceiverVarName_TextLinesArray}" != '*|undefined|*' ]; then
                Write-_吴乐川打印针对当前处理的参数的错误信息  '不应重复出现。〔1〕。'
                return
            fi

            if [[ "$1" =~ ^- ]]; then
                Write-_吴乐川打印针对当前处理的参数的错误信息  '后面没有给出值。〔1〕。'
                return
            fi

            if [ -z "$1" ]; then
                Write-_吴乐川打印针对当前处理的参数的错误信息  '后面没有给出值。〔2〕。'
                return
            fi

            _TemporaryArgumentValue="$1"
            shift
        elif [[ "$1" =~ ^"${_ProcessingArgumentName}"= ]]; then
            _CurrentArgumentOrArgumentPairHaveRecognized=1

            if [ "${ResultReceiverVarName_TextLinesArray}" != '*|undefined|*' ]; then
                Write-_吴乐川打印针对当前处理的参数的错误信息  '不应重复出现。〔2〕。'
                shift
                return
            fi

            _TemporaryArgumentValue=${1:${#_ProcessingArgumentName}+1}
            shift

            if [ -z "${_TemporaryArgumentValue}" ]; then
                Write-_吴乐川打印针对当前处理的参数的错误信息  '等号（=）后面没有给出值。〔3〕。'
                return
            fi
        fi

        if [ ! -z "${_TemporaryArgumentValue}" ]; then
            if [[ ! "${_TemporaryArgumentValue}" =~ ^[a-zA-Z_-][0-9a-zA-Z_-]*$ ]]; then
                Write-_吴乐川打印针对当前处理的参数的错误信息  "给出值不合规。给出的值为 “ \e[0;33m${_TemporaryArgumentValue}\e[0;0m ” 。〔2〕。"
                return
            else
                ResultReceiverVarName_TextLinesArray=$_TemporaryArgumentValue
            fi
        fi

        # ---------------------------------------------------------------

        _ProcessingArgumentName='--用以接收排好版的文本的行数的变量名'
        _TemporaryArgumentValue=''

        if [ "$1" == "${_ProcessingArgumentName}" ]; then
            _CurrentArgumentOrArgumentPairHaveRecognized=1
            shift

            # echo  -e  "已经遇到 “ \e[0;91m${_ProcessingArgumentName}\e[0;0m ”。其后还有 \e[0;96m$#\e[0;0m 个参数未处理。"

            if [ "${ResultReceiverVarName_CountOfLines}" != '*|undefined|*' ]; then
                Write-_吴乐川打印针对当前处理的参数的错误信息  '不应重复出现。〔1〕。'
                return
            fi

            if [[ "$1" =~ ^- ]]; then
                Write-_吴乐川打印针对当前处理的参数的错误信息  '后面没有给出值。〔1〕。'
                return
            fi

            if [ -z "$1" ]; then
                Write-_吴乐川打印针对当前处理的参数的错误信息  '后面没有给出值。〔2〕。'
                return
            fi

            _TemporaryArgumentValue="$1"
            shift
        elif [[ "$1" =~ ^"${_ProcessingArgumentName}"= ]]; then
            _CurrentArgumentOrArgumentPairHaveRecognized=1

            if [ "${ResultReceiverVarName_CountOfLines}" != '*|undefined|*' ]; then
                Write-_吴乐川打印针对当前处理的参数的错误信息  '不应重复出现。〔2〕。'
                shift
                return
            fi

            _TemporaryArgumentValue=${1:${#_ProcessingArgumentName}+1}
            shift

            if [ -z "${_TemporaryArgumentValue}" ]; then
                Write-_吴乐川打印针对当前处理的参数的错误信息  '等号（=）后面没有给出值。〔3〕。'
                return
            fi
        fi

        if [ ! -z "${_TemporaryArgumentValue}" ]; then
            if [[ ! "${_TemporaryArgumentValue}" =~ ^[a-zA-Z_-][0-9a-zA-Z_-]*$ ]]; then
                Write-_吴乐川打印针对当前处理的参数的错误信息  "给出值不合规。给出的值为 “ \e[0;33m${_TemporaryArgumentValue}\e[0;0m ” 。〔2〕。"
                return
            else
                ResultReceiverVarName_CountOfLines=$_TemporaryArgumentValue
            fi
        fi

        # ---------------------------------------------------------------

        _ProcessingArgumentName='--单行等效汉字字数上限'
        _TemporaryArgumentValue=''

        if [ "$1" == "${_ProcessingArgumentName}" ]; then
            _CurrentArgumentOrArgumentPairHaveRecognized=1
            shift

            if [ "${HanCharacterPerLineMaxCount}" != 'undefined' ]; then
                Write-_吴乐川打印针对当前处理的参数的错误信息  '不应重复出现。〔1〕。'
                return
            fi

            if [[ "$1" =~ ^- ]]; then
                Write-_吴乐川打印针对当前处理的参数的错误信息  '后面没有给出值。〔1〕。'
                return
            fi

            if [ -z "$1" ]; then
                Write-_吴乐川打印针对当前处理的参数的错误信息  '后面没有给出值。〔2〕。'
                return
            fi

            _TemporaryArgumentValue="$1"
            shift
        elif [[ "$1" =~ ^"${_ProcessingArgumentName}"= ]]; then
            _CurrentArgumentOrArgumentPairHaveRecognized=1

            if [ "${HanCharacterPerLineMaxCount}" != 'undefined' ]; then
                Write-_吴乐川打印针对当前处理的参数的错误信息  '不应重复出现。〔2〕。'
                shift
                return
            fi

            _TemporaryArgumentValue=${1:${#_ProcessingArgumentName}+1}
            shift

            if [ "$_TemporaryArgumentValue" == '0' ]; then
                HanCharacterPerLineMaxCount=0
            elif [ -z "${_TemporaryArgumentValue}" ]; then
                Write-_吴乐川打印针对当前处理的参数的错误信息  '等号（=）后面没有给出值。〔3〕。'
                return
            fi
        fi

        if [ ! -z "$_TemporaryArgumentValue" ]; then
            if [[ ! "${_TemporaryArgumentValue}" =~ ^[1-9][0-9]*$ ]]; then
                Write-_吴乐川打印针对当前处理的参数的错误信息  "给出值不合规。给出的值为 “ \e[0;33m${_TemporaryArgumentValue}\e[0;0m ” 。〔2〕。"
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
                Write-_吴乐川打印针对当前处理的参数的错误信息  "不应重复出现。〔1〕。已有参数将其配置为 “ \e[0;32m${ShouldAddASpaceAfterLastEnglishWordPerLine}\e[0;33m ” 。"
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
                Write-_吴乐川打印针对当前处理的参数的错误信息  '不应重复出现。〔2〕。'
                shift
                return
            fi

            _TemporaryArgumentValue=${1:${#_ProcessingArgumentName}+1}
            shift

            if [ "$_TemporaryArgumentValue" == '0' ]; then
                _TemporaryArgumentValue='false'
            elif [ -z "$_TemporaryArgumentValue" ]; then
                Write-_吴乐川打印针对当前处理的参数的错误信息  '等号（=）后面没有给出值。〔1〕。'
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
                Write-_吴乐川打印针对当前处理的参数的错误信息  "不应重复出现。〔1〕。已有参数将其配置为 “ \e[0;32m${ShouldDoubleOriginalLineBreaks}\e[0;33m ” 。"
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
                Write-_吴乐川打印针对当前处理的参数的错误信息  '不应重复出现。〔2〕。'
                shift
                return
            fi

            _TemporaryArgumentValue=${1:${#_ProcessingArgumentName}+1}
            shift

            if [ "${_TemporaryArgumentValue}" == '0' ]; then
                _TemporaryArgumentValue='false'
            elif [ -z "${_TemporaryArgumentValue}" ]; then
                Write-_吴乐川打印针对当前处理的参数的错误信息  '等号（=）后面没有给出值。〔1〕。'
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
            if [ -z "${OriginalText}" ]; then
                OriginalText+="$1"
            else
                OriginalText+=" $1" # 很关键。但暂不理解其原理。
            fi

            shift
        fi
    done

    _ProcessingArgumentName=''
    _TemporaryArgumentValue=''

    if [ "${ResultReceiverVarName_FullText}" == '*|undefined|*' ] && [ "${ResultReceiverVarName_TextLinesArray}" == '*|undefined|*' ]; then
        echo -e "\e[0;31m在命令参数表中缺少必要参数。以下 2 个参数，至少给出一个。可以同时给出。\e[0;0m"
        echo -e "    \e[0;31m“ \e[0;97m--用以接收排好版的文本的全文的变量名\e[0;31m ”\e[0;0m"
        echo -e "    \e[0;31m“ \e[0;97m--用以接收排好版的文本的逐行文本列表的变量名\e[0;31m ”\e[0;0m"
        echo -e "另，二者均不可出现多次。"
        return
    fi

    if [ "${ResultReceiverVarName_FullText}" == '*|undefined|*' ]; then
        ResultReceiverVarName_FullText=''
    fi

    if [ "${ResultReceiverVarName_TextLinesArray}" == '*|undefined|*' ]; then
        ResultReceiverVarName_TextLinesArray=''
    fi

    if [ "${ResultReceiverVarName_CountOfLines}" == '*|undefined|*' ]; then
        ResultReceiverVarName_CountOfLines=''
    fi

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
        echo  -e  "〔调试〕： 用以接收排好版的文本的逐行文本列表的变量名：\n           \e[0;33m${ResultReceiverVarName_TextLinesArray}\e[0;0m"
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





    local _IFS_BACKUP_="$IFS"
    IFS=''
    # local LINE_BREAK="\\$(echo -n n)"
    local LINE_BREAK="\n"





    local OriginalCharCount=${#OriginalText}

    local LoopIndex=0

    local Char=''
    local TemporaryWord=''
    local WordList=()
    local WordIndex=0
    local TemporaryWordIsHanCharacter=0
    local LastCharWasBackSlash='false'
    local ThisCharIsBackSlash='false'

    for ((LoopIndex=0; LoopIndex<$OriginalCharCount; LoopIndex++)); do
        Char=${OriginalText:${LoopIndex}:1}



        if [ "$LastCharWasBackSlash" == 'true' ]; then
            # if [ $SHOULD_DEBUG -eq 1 ]; then
            #     if [ "$Char" == '\' ]; then
            #         echo  -e  "〔调试〕： 第 $((LoopIndex+1)) 字的前面一个字是反斜杠。第 $((LoopIndex+1)) 字本身是 \e[0;91m'\e[0;33m${Char}${Char}\e[0;91m'\e[0;0m"
            #     else
            #         echo  -e  "〔调试〕： 第 $((LoopIndex+1)) 字的前面一个字是反斜杠。第 $((LoopIndex+1)) 字本身是 \e[0;91m'\e[0;33m${Char}\e[0;91m'\e[0;0m"
            #     fi
            # fi

            Char="\\${Char}"
            ThisCharIsBackSlash='false'
        else
            if [ "$Char" == '\' ]; then
                Char="\\"
                ThisCharIsBackSlash='true'
                # if [ $SHOULD_DEBUG -eq 1 ]; then echo  -e  "〔调试〕： 第 $((LoopIndex+1)) 字是反斜杠。 \e[0;91m'\e[0;33m${Char}${Char}\e[0;91m'\e[0;0m"; fi
                LastCharWasBackSlash="$ThisCharIsBackSlash"
                continue
            else
                ThisCharIsBackSlash='false'
            fi
        fi

        LastCharWasBackSlash="$ThisCharIsBackSlash"



        # TemporaryWordIsHanCharacter=`Assert-吴乐川判断字符系中日韩文字_直接回显结论  "$Char"`
        Assert-吴乐川判断字符系中日韩文字_须采用接收器变量  TemporaryWordIsHanCharacter  "$Char"

        # if [ $SHOULD_DEBUG -eq 1 ]; then
        #     if [ "$TemporaryWordIsHanCharacter" == 'true' ]; then
        #         echo  -e  "〔调试〕： 第 $((LoopIndex+1)) 字： \e[0;91m'\e[0;33m${Char}\e[0;91m'\e[0;0m （是汉字）"
        #     else
        #         echo  -e  "〔调试〕： 第 $((LoopIndex+1)) 字： \e[0;94m'\e[0;92m${Char}\e[0;94m'\e[0;0m"
        #     fi
        # fi



        if [ "$Char" == $LINE_BREAK ] || [ "$Char" == ' ' ] || [ "$TemporaryWordIsHanCharacter" == 'true' ]; then
            if [[ "$TemporaryWord" =~ [^\s] ]]; then
                read TemporaryWord <<< $TemporaryWord # 掐头去尾。等效于其他编程语言的 trim() 。
                # TemporaryWord=$(echo $TemporaryWord) # 掐头去尾。等效于其他编程语言的 trim() 。
                WordIndex=$((WordIndex+1));
                # if [ $SHOULD_DEBUG -eq 1 ]; then echo  -e  "〔调试〕： 第 ${WordIndex} 词： \e[0;91m'\e[0;33m${TemporaryWord}\e[0;91m'\e[0;0m"; fi
                WordList+=( "$TemporaryWord" )
            fi

            TemporaryWord=''

            # if [ $SHOULD_DEBUG -eq 1 ] && [ "$Char" == $LINE_BREAK ]; then
            #     echo  -e  "〔调试〕： \e[0;91m'遇到了换行符 “${Char}”\e[0;0m"
            # fi

            if [ "$Char" != ' ' ]; then
                WordIndex=$((WordIndex+1));
                # if [ $SHOULD_DEBUG -eq 1 ]; then echo  -e  "〔调试〕： 第 ${WordIndex} 词： \e[0;91m'\e[0;33m${Char}\e[0;91m'\e[0;0m"; fi
                WordList+=( "$Char" ) # 汉字、日本字、朝鲜字、汉语标点或换行符。
            fi
        else
            TemporaryWord+="$Char"
        fi
    done

    if [ ! -z "$TemporaryWord" ]; then
        if [[ "$TemporaryWord" =~ [^\s] ]]; then
            read TemporaryWord <<< $TemporaryWord # 掐头去尾。等效于其他编程语言的 trim() 。
            # TemporaryWord=$(echo $TemporaryWord) # 掐头去尾。等效于其他编程语言的 trim() 。
            WordIndex=$((WordIndex+1));
            # if [ $SHOULD_DEBUG -eq 1 ]; then echo  -e  "〔调试〕： 第 ${WordIndex} 词： \e[0;91m'\e[0;33m${TemporaryWord}\e[0;91m'\e[0;0m"; fi
            WordList+=( "$TemporaryWord" )
        fi

        TemporaryWord=''
    fi



    # local CountOfWords=${#WordList[@]} # 这样取词数不可靠！原因不明。



    # if [ $SHOULD_DEBUG -eq 1 ]; then echo  -e  "〔调试〕： 临时字词表："; fi

    local CountOfWords=0
    for TemporaryWord in ${WordList[@]}; do
        CountOfWords=$((CountOfWords+1))

        # if [ $SHOULD_DEBUG -eq 1 ]; then
        #     echo  -e  "    〔调试〕： 第 ${CountOfWords} 词： '${TemporaryWord}'"
        # fi
    done

    # if [ $SHOULD_DEBUG -eq 1 ]; then echo  -e  "〔调试〕： 共计 \e[0;91m${CountOfWords}\e[0;0m 词（字）。"; fi





    local CountOfLines=0
    local MaxEnglishCharCountPerLine=$((HanCharacterPerLineMaxCount*2))

    local IndexOfProcessingWord=0
    local TextOfProcessingLine=''
    local WidthOfProcessingLine=0
    local WidthOfProcessingLineIfAddOneMoreOrTwoWords=0
    local WordCountOfProcessingLine=0
    local LineEndedBecauseOfLineBreakSign='false'

    local ProcessingWord=''
    local WidthOfProcessingWord=0
    local ProcessingWordIsHanCharacter='false'
    local ShouldNotBreakLineBeforeProcessingWord='false'
    local LastWordWasHanCharacter='false'

    local NextWord=''
    local ShouldNotBreakLineBeforeNextWord='false'
    local WidthOfNextWord=0

    local FORMATTED_FULL_TEXT=''





    if [ ! -z "${ResultReceiverVarName_TextLinesArray}" ]; then
        eval "$ResultReceiverVarName_TextLinesArray=()"
    fi





    while [ $IndexOfProcessingWord -lt $CountOfWords ]; do

        TextOfProcessingLine=''
        WidthOfProcessingLine=0
        WordCountOfProcessingLine=0
        LastWordWasHanCharacter='false'

        while [ $WidthOfProcessingLine -lt $MaxEnglishCharCountPerLine ] && [ $IndexOfProcessingWord -lt $CountOfWords ]; do

            # ────────────────────────────────────────────────────────────────────────────────
            # 取词。
            # ────────────────────────────────────────────────────────────────────────────────

            ProcessingWord="${WordList[$IndexOfProcessingWord]}"

            # if [ "$(Assert-吴乐川判断排版时该字词之前不宜换行_直接回显结论  "$ProcessingWord")" == 'true' ]; then
            #     ShouldNotBreakLineBeforeProcessingWord='true'
            # else
            #     ShouldNotBreakLineBeforeProcessingWord='false'
            # fi

            Assert-吴乐川判断排版时该字词之前不宜换行_须采用接收器变量  ShouldNotBreakLineBeforeProcessingWord  "$ProcessingWord"

            # if [ $SHOULD_DEBUG -eq 1 ]; then
            #     if [ "$ShouldNotBreakLineBeforeProcessingWord" == 'true' ]; then
            #         echo  -e  "〔调试〕： \e[0;91m取到的字前面不宜换行。\e[0;0m 取到的第 \e[0;96m$((IndexOfProcessingWord+1))\e[0;0m 字： \e[0;33m'${ProcessingWord}'\e[0;0m"
            #     else
            #         echo  -e  "〔调试〕： \e[0;92m取到的字前面允许换行。\e[0;0m 取到的第 \e[0;96m$((IndexOfProcessingWord+1))\e[0;0m 字： \e[0;94m'${ProcessingWord}'\e[0;0m"
            #     fi
            # fi



            IndexOfProcessingWord=$((IndexOfProcessingWord+1))



            # ────────────────────────────────────────────────────────────────────────────────
            # 尽量再取一词。
            # ────────────────────────────────────────────────────────────────────────────────

            ShouldNotBreakLineBeforeNextWord='false'

            if [ $IndexOfProcessingWord -lt $CountOfWords ]; then
                NextWord="${WordList[$IndexOfProcessingWord]}"

                # if [ "$(Assert-吴乐川判断排版时该字词之前不宜换行_直接回显结论  "$NextWord")" == 'true' ]; then
                #     ShouldNotBreakLineBeforeNextWord='true'
                # else
                #     ShouldNotBreakLineBeforeNextWord='false'
                # fi

                Assert-吴乐川判断排版时该字词之前不宜换行_须采用接收器变量  ShouldNotBreakLineBeforeNextWord  "$NextWord"
            fi



            # ────────────────────────────────────────────────────────────────────────────────
            # 如果遭遇原文自带的换行符，则尽量换行。
            # 所谓“尽量”，是指当发现后面一个符号之前不宜换行时，
            # 则应舍弃原文中的这一换行符。以免出现不适宜的排版换行。
            # ────────────────────────────────────────────────────────────────────────────────

            if [ "$ProcessingWord" == $LINE_BREAK ]; then
                # if [ $SHOULD_DEBUG -eq 1 ]; then echo  -e  "〔调试〕： \e[0;91m~~ 遇到换行符 ~~。\e[0;0m"; fi
                LineEndedBecauseOfLineBreakSign='true'
            else
                LineEndedBecauseOfLineBreakSign='false'
            fi

            if [ "$LineEndedBecauseOfLineBreakSign" == 'true' ]; then
                if [ "$ShouldNotBreakLineBeforeNextWord" == 'true' ]; then
                    ProcessingWord=''
                    LineEndedBecauseOfLineBreakSign='false'
                else
                    # if [ $SHOULD_DEBUG -eq 1 ]; then echo  -e  "〔调试〕： \e[0;91m~~ 遇到的该换行符确实应换行。 ~~。\e[0;0m"; fi
                    break
                fi
            fi



            # ────────────────────────────────────────────────────────────────────────────────
            # 为统计做准备。
            # ────────────────────────────────────────────────────────────────────────────────

            # WidthOfProcessingWord=`Get-吴乐川求一行文本视觉宽度等效英语字母数_直接回显结论  "$ProcessingWord"`

            Get-吴乐川求一行文本视觉宽度等效英语字母数_须采用接收器变量  WidthOfProcessingWord  "$ProcessingWord"

            ProcessingWordIsHanCharacter='false'

            if [ ${#ProcessingWord} -eq 1 ]; then
                # if [ "`Assert-吴乐川判断字符系中日韩文字_直接回显结论  "$ProcessingWord"`" == 'true' ]; then
                #     ProcessingWordIsHanCharacter='true'
                # fi

                Assert-吴乐川判断字符系中日韩文字_须采用接收器变量  ProcessingWordIsHanCharacter  "$ProcessingWord"
            fi

            if [ "$LastWordWasHanCharacter" == 'false' ] && [ $WordCountOfProcessingLine -gt 0 ]; then
                ProcessingWord=" $ProcessingWord"
                WidthOfProcessingWord=$((WidthOfProcessingWord+1))
            fi



            # ────────────────────────────────────────────────────────────────────────────────
            # 如果本行现有内容再加一词或两词会满溢，则提前结束本行。
            # ────────────────────────────────────────────────────────────────────────────────

            if [ "$ShouldNotBreakLineBeforeProcessingWord" == 'false' ]; then

                if [ "$LastWordWasHanCharacter" == 'true' ] && [ "$ProcessingWordIsHanCharacter" == 'false' ]; then
                    ProcessingWord=" ${ProcessingWord}"
                    WidthOfProcessingWord=$((WidthOfProcessingWord+1))
                fi

                WidthOfProcessingLineIfAddOneMoreOrTwoWords=$((WidthOfProcessingLine+WidthOfProcessingWord))

                if [ "$ShouldNotBreakLineBeforeNextWord" == 'true' ]; then
                    # WidthOfNextWord=`Get-吴乐川求一行文本视觉宽度等效英语字母数_直接回显结论  "$NextWord"`

                    Get-吴乐川求一行文本视觉宽度等效英语字母数_须采用接收器变量  WidthOfNextWord  "$NextWord"

                    WidthOfProcessingLineIfAddOneMoreOrTwoWords=$((WidthOfProcessingLineIfAddOneMoreOrTwoWords+WidthOfNextWord))
                fi

                if [ $WidthOfProcessingLineIfAddOneMoreOrTwoWords -gt $MaxEnglishCharCountPerLine ]; then
                    if [ $WordCountOfProcessingLine -gt 0 ]; then
                        IndexOfProcessingWord=$((IndexOfProcessingWord-1))
                        break
                    fi
                fi
            fi



            TextOfProcessingLine+="$ProcessingWord"
            WidthOfProcessingLine=$((WidthOfProcessingLine+WidthOfProcessingWord))
            WordCountOfProcessingLine=$((WordCountOfProcessingLine+1))
            LastWordWasHanCharacter="$ProcessingWordIsHanCharacter"

        done



        TextOfProcessingLine=`echo $TextOfProcessingLine` # 掐头去尾。等效于其他编程语言的 trim() 。

        if [ "$LastWordWasHanCharacter" == 'false' ] && [ "$ShouldAddASpaceAfterLastEnglishWordPerLine" == 'true' ]; then
            TextOfProcessingLine+=' '
        fi



        if [ $CountOfLines -gt 0 ]; then
            FORMATTED_FULL_TEXT+="\n"
        fi



        FORMATTED_FULL_TEXT+="$TextOfProcessingLine"
        CountOfLines=$((CountOfLines+1))

        if [ ! -z "${ResultReceiverVarName_TextLinesArray}" ]; then
            eval "$ResultReceiverVarName_TextLinesArray+=( \"$TextOfProcessingLine\" )"
        fi




        if [ "$LineEndedBecauseOfLineBreakSign" == 'true' ] && [ "$ShouldDoubleOriginalLineBreaks" == 'true' ]; then
            FORMATTED_FULL_TEXT+="\n"
            CountOfLines=$((CountOfLines+1))
            if [ ! -z "${ResultReceiverVarName_TextLinesArray}" ]; then
                eval "$ResultReceiverVarName_TextLinesArray+=( '\n' )"
            fi
        fi



    done





    # if [ $SHOULD_DEBUG -eq 1 ]; then
    #     echo
    #     echo  -e  '〔调试〕：────────────────────────────────────────────────────────────────────────────────'
    #     echo  -e  "〔调试〕： 行数： ${CountOfLines} 。       单行换算成汉字的字数上限： ${HanCharacterPerLineMaxCount} 字"
    #     echo  -e  '〔调试〕：────────────────────────────────────────────────────────────────────────────────'
    #     echo  -e  "${FORMATTED_FULL_TEXT}"
    #     echo  -e  '〔调试〕：────────────────────────────────────────────────────────────────────────────────'
    #     echo
    #     echo
    #     echo
    #     echo
    #     echo
    # fi





    if [ ! -z "${ResultReceiverVarName_FullText}" ]; then
        eval  "$ResultReceiverVarName_FullText=$FORMATTED_FULL_TEXT"
    fi

    if [ ! -z "${ResultReceiverVarName_CountOfLines}" ]; then
        eval  "$ResultReceiverVarName_CountOfLines=$CountOfLines"
    fi





    IFS="$_IFS_BACKUP_"
}
