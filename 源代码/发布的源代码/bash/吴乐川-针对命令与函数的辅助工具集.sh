
function Read-吴乐川读取并处理某函数的参数表 {
    local ARGUMENT_ID_OF_ANONYMOUSE_VALUES_LIST='〈匿名值之汇总列表〉'

    # 外界应预备好以下两个变量：
    #
    #     NameOfThisFunction
    #
    #     ArgumentConfigsArray
    #
    # 但上述两个变量不应通过本函数的参数（ arguments ）给出。
    #
    # 示例：
    #     local NameOfThisFunction='某某函数'
    #
    #     local ArgumentConfigsArray=(
    #         '--应仅作仿真演练 | ShouldDryRun | 标准类型_布尔   | true'
    #         '--n1           | Number1      | 标准类型_整数   | -3'
    #         '--n2           | N2           | 标准类型_正整数 | 19'
    #     )
    #
    # ArgumentConfigsArray 的成员的统一结构为 “ 命令行参数名 | 变量名 | 类型 | 默认值 ”。





    local ShouldDebug=0

    if   [  "$1" == '--should-debug'  ]; then
        ShouldDebug=1
        shift

        if   [[ "$1" == '1' || "$1" == 'true'  || "$1" == '$true'  ]]; then
            ShouldDebug=1
            shift
        elif [[ "$1" == '0' || "$1" == 'false' || "$1" == '$false' ]]; then
            ShouldDebug=0
            shift
        fi
    elif [[ "$1" =~ ^--should-debug= ]]; then
        ShouldDebug=${1:15}
        shift

        if [ -z "$ShouldDebug" ]; then
            ShouldDebug=0
        elif [[ "$ShouldDebug" =~ 1|true|$true ]]; then
            ShouldDebug=1
        else
            ShouldDebug=0
        fi
    fi





    local NoColor="\e[0;0m"

    local ColorOfErrorMessage="\e[0;91m"
    local ColorOfTermInErrorMessage="\e[0;97m"

    local ColorOfWarningMessage="\e[0;33m"
    local ColorOfTermWarningMessage="\e[0;97m"



    function Write-_吴乐川打印针对当前处理的参数配置的错误信息 {
        local IndexOfInvolvedConfig="$1"
        local NameOfInvolvedConfigItem="$2"
        local InvalidValueOfInvolvedConfigItem="$3"

        local ColorOfItemName="\e[0;97m"
        local ColorOfInvalidValue="\e[0;33m"

        echo -e "${ColorOfErrorMessage}在函数${NoColor}"
        echo -e "    ${ColorOfErrorMessage}“ ${ColorOfTermInErrorMessage}${NameOfThisFunction}${ColorOfErrorMessage} ”${NoColor}"
        echo -e "${ColorOfErrorMessage}的参数配置表出现如下问题：${NoColor}"
        echo -e "    ${ColorOfErrorMessage}第 \e[0;96m${IndexOfInvolvedConfig}${ColorOfErrorMessage} 个参数配置中的〈${ColorOfItemName}${NameOfInvolvedConfigItem}${ColorOfErrorMessage}〉配置了无效的值。${NoColor}"
        echo -e "    ${ColorOfErrorMessage}该〈${ColorOfItemName}${NameOfInvolvedConfigItem}${ColorOfErrorMessage}〉的无效值为 “ ${ColorOfInvalidValue}${InvalidValueOfInvolvedConfigItem}${ColorOfErrorMessage} ”。${NoColor}"

        if [ "$StandardTypeName" ]; then
            echo  -e  "    ${ColorOfErrorMessage}合规的值须为 “ ${ColorOfTermInErrorMessage}${StandardTypeName}${ColorOfErrorMessage} ” ${NoColor}"
        fi

        echo
        echo
    }

    function Write-_吴乐川打印针对当前处理的参数的错误信息_通用版 {
        local ErrorMessage="$1"
        local ShouldShowTipOfValueType="$2"

        echo -e "${ColorOfErrorMessage}在函数${NoColor}"
        echo -e "    ${ColorOfErrorMessage}“ ${ColorOfTermInErrorMessage}${NameOfThisFunction}${ColorOfErrorMessage} ”${NoColor}"
        echo -e "${ColorOfErrorMessage}的参数表中，名为${NoColor}"
        echo -e "    ${ColorOfErrorMessage}“ ${ColorOfTermInErrorMessage}${_ProcessingArgumentName}${ColorOfErrorMessage} ”${NoColor}"
        echo -e "${ColorOfErrorMessage}的参数出现如下问题：${NoColor}"
        echo -e "    ${ColorOfErrorMessage}${ErrorMessage}${NoColor}"

        if [ "$ShouldShowTipOfValueType" == 'true' ] && [ ! -z "$_ProcessingArgumentTypeStandardName" ]; then
            echo  -e  "    ${ColorOfErrorMessage}合规的值须为 “ ${ColorOfTermInErrorMessage}${_ProcessingArgumentTypeStandardName}${ColorOfErrorMessage} ” ${NoColor}"
        fi

        echo
        echo
    }

    function Write-_吴乐川打印针对当前处理的参数的错误信息_参数不应重复出现 {
        local ErrorVariationCode="$1"
        local ErrorMessage="重复出现。\e[0;0m    〔源代码相关位置 ${ErrorVariationCode}〕\n    ${ColorOfErrorMessage}已另有参数将该变量配置为 “ \e[0;32m${_ExistingValueOfProcessingVar}${ColorOfErrorMessage} ” 。\n    \e[0;94m另注：上述已配置的值为等效后的标准值，并非命令行中的原始值。${ColorOfErrorMessage} "

        Write-_吴乐川打印针对当前处理的参数的错误信息_通用版  "$ErrorMessage"
    }

    function Write-_吴乐川打印针对当前处理的参数的错误信息_参数未给出值 {
        local ErrorVariationCode="$1"
        local LeadingArgumentNameHasEqualSign="$2"

        local ErrorMessageSnippet1="参数名后未跟随给出值。"
        if [ "$LeadingArgumentNameHasEqualSign" == 'true' ]; then
            ErrorMessageSnippet1="参数名在等号（=）后未跟随给出值。"
        fi

        local ErrorMessage="${ErrorMessageSnippet1}\e[0;0m    〔源代码相关位置 ${ErrorVariationCode}〕\n    ${ColorOfErrorMessage}已另有参数将该变量配置为 “ \e[0;32m${_ExistingValueOfProcessingVar}${ColorOfErrorMessage} ” 。\n    \e[0;94m另注：上述已配置的值为等效后的标准值，并非命令行中的原始值。${ColorOfErrorMessage} "

        Write-_吴乐川打印针对当前处理的参数的错误信息_通用版  "$ErrorMessage"  true
    }

    function Write-_吴乐川打印针对当前处理的参数的错误信息_参数值不合规 {
        local ErrorVariationCode="$1"

        local ErrorMessage="给出的值不合规。\e[0;0m    〔源代码相关位置 ${ErrorVariationCode}〕\n    ${ColorOfErrorMessage}给出的值为 “ \e[0;93m${_TemporaryArgumentValue}${ColorOfErrorMessage} ” 。"

        Write-_吴乐川打印针对当前处理的参数的错误信息_通用版  "$ErrorMessage"  true
    }





    local _OriginalArgumentsCount=$#
    # echo  -e  "_OriginalArgumentsCount=${_OriginalArgumentsCount}\n"

    local _ProcessedArgumentsCount=0

    local ResultRecievingVarName_AnonymousValuesArray
    local AnonymouseValuesArrayAddedByThisTool=()
    local AnonymouseValuesCountAddedByThisTool=0

    local _ProcessingArgumentName
    local _ProcessingVariableName
    local _ProcessingArgumentType
    local _ProcessingArgumentTypeStandardName
    local _ProcessingArgumentDefaultValue

    local _ExistingValueOfProcessingVar

    local _TemporaryArgumentValue
    local _TemporaryArgumentValueIsInvalid
    local _TemporaryArgumentValueIsAfterEqualSign
    local _TemporaryArgumentValueHasTaken

    local _CurrentArgumentOrArgumentPairHaveRecognized=0

    local _ArgumentConfigsLoopIndex=0

    local _ArgumentConfigsCount=${#ArgumentConfigsArray[@]}
    # echo  -e  "_ArgumentConfigsCount=${_ArgumentConfigsCount}\n"

    local _ProcessingArgumentConfig

    local VALUE_OF_UNDEFINED='*|未给出|*'

    for ((_ArgumentConfigsLoopIndex=0; _ArgumentConfigsLoopIndex<_ArgumentConfigsCount; _ArgumentConfigsLoopIndex++)); do
        _ProcessingArgumentConfig=${ArgumentConfigsArray[$_ArgumentConfigsLoopIndex]}

        _ProcessingArgumentName=${_ProcessingArgumentConfig%%|*}
        _ProcessingArgumentConfig=${_ProcessingArgumentConfig:${#_ProcessingArgumentName}+1}
        read  -r  _ProcessingArgumentName <<< $_ProcessingArgumentName
        # echo "剩余的 _ProcessingArgumentConfig='$_ProcessingArgumentConfig'"

        if [ "$_ProcessingArgumentName" != "$ARGUMENT_ID_OF_ANONYMOUSE_VALUES_LIST" ]; then
            if [ "$_ProcessingArgumentName" == '--' ] || [[ ! "$_ProcessingArgumentName" =~ ^- ]]; then
                Write-_吴乐川打印针对当前处理的参数配置的错误信息  "$((_ArgumentConfigsLoopIndex+1))"  "命令行参数名"  "${_ProcessingArgumentName}"
                return 92
            fi
        fi

        _ProcessingVariableName=${_ProcessingArgumentConfig%%|*}
        _ProcessingArgumentConfig=${_ProcessingArgumentConfig:${#_ProcessingVariableName}+1}
        read  -r  _ProcessingVariableName <<< $_ProcessingVariableName
        # echo "剩余的 _ProcessingArgumentConfig='$_ProcessingArgumentConfig'"

        if [ -z "$_ProcessingVariableName" ] || [[ ! "$_ProcessingVariableName" =~ ^[a-zA-Z_-][0-9a-zA-Z_-]*$ ]]; then
            Write-_吴乐川打印针对当前处理的参数配置的错误信息  "$((_ArgumentConfigsLoopIndex+1))"  "变量名"  "${_ProcessingVariableName}"
            return 92
        fi

        # _ProcessingArgumentType=${_ProcessingArgumentConfig%%|*}
        # _ProcessingArgumentConfig=${_ProcessingArgumentConfig:${#_ProcessingArgumentType}+1}
        # read  -r  _ProcessingArgumentType <<< $_ProcessingArgumentType
        # # echo "剩余的 _ProcessingArgumentConfig='$_ProcessingArgumentConfig'"

        # _ProcessingArgumentDefaultValue=${_ProcessingArgumentConfig%%|*}
        # _ProcessingArgumentConfig=${_ProcessingArgumentConfig:${#_ProcessingArgumentDefaultValue}+1}
        # read  -r  _ProcessingArgumentDefaultValue <<< $_ProcessingArgumentDefaultValue
        # # echo "剩余的 _ProcessingArgumentConfig='$_ProcessingArgumentConfig'"

        if [ "$_ProcessingArgumentName" == "$ARGUMENT_ID_OF_ANONYMOUSE_VALUES_LIST" ]; then
            ResultRecievingVarName_AnonymousValuesArray="$_ProcessingVariableName"
        fi



        # if true; then
        #     echo "_ProcessingArgumentName='$_ProcessingArgumentName'"
        #     echo "_ProcessingVariableName='$_ProcessingVariableName'"
        #     echo "_ProcessingArgumentType='$_ProcessingArgumentType'"
        #     echo "_ProcessingArgumentDefaultValue='$_ProcessingArgumentDefaultValue'"
        #     echo "_ExistingValueOfProcessingVar='$_ExistingValueOfProcessingVar'"

        #     echo
        #     echo '────────────────────────────────────────────────────────────────'
        #     echo
        # fi



        if [ "$_ProcessingArgumentName" != "$ARGUMENT_ID_OF_ANONYMOUSE_VALUES_LIST" ]; then
            eval "${_ProcessingVariableName}='${VALUE_OF_UNDEFINED}'" # 这里不要用 local 。
        fi
    done



    # if [ ! -z "$ResultRecievingVarName_AnonymousValuesArray" ]; then
    #     echo "〔调试〕： $ResultRecievingVarName_AnonymousValuesArray"
    #     eval "echo \"〔调试〕： \$$ResultRecievingVarName_AnonymousValuesArray\""
    # fi



    while [[ $# -gt 0 && $_ProcessedArgumentsCount -lt $_OriginalArgumentsCount ]]; do

        _ProcessedArgumentsCount=$((_ProcessedArgumentsCount+1))
        _CurrentArgumentOrArgumentPairHaveRecognized=0

        if [ ! -z "$_ArgumentConfigsCount" ]; then
            for ((_ArgumentConfigsLoopIndex=0; _ArgumentConfigsLoopIndex<_ArgumentConfigsCount; _ArgumentConfigsLoopIndex++)); do
                _ProcessingArgumentConfig=${ArgumentConfigsArray[$_ArgumentConfigsLoopIndex]}

                _ProcessingArgumentName=${_ProcessingArgumentConfig%%|*}
                _ProcessingArgumentConfig=${_ProcessingArgumentConfig:${#_ProcessingArgumentName}+1}
                read  -r  _ProcessingArgumentName <<< $_ProcessingArgumentName
                # echo "剩余的 _ProcessingArgumentConfig='$_ProcessingArgumentConfig'"

                if [ "$_ProcessingArgumentName" == "$ARGUMENT_ID_OF_ANONYMOUSE_VALUES_LIST" ]; then
                    continue
                fi

                _ProcessingVariableName=${_ProcessingArgumentConfig%%|*}
                _ProcessingArgumentConfig=${_ProcessingArgumentConfig:${#_ProcessingVariableName}+1}
                read  -r  _ProcessingVariableName <<< $_ProcessingVariableName
                # echo "剩余的 _ProcessingArgumentConfig='$_ProcessingArgumentConfig'"

                # if [ "$_ProcessingVariableName" == "$ResultRecievingVarName_AnonymousValuesArray" ]; then
                #     continue
                # fi

                _ProcessingArgumentType=${_ProcessingArgumentConfig%%|*}
                _ProcessingArgumentConfig=${_ProcessingArgumentConfig:${#_ProcessingArgumentType}+1}
                read  -r  _ProcessingArgumentType <<< $_ProcessingArgumentType
                # echo "剩余的 _ProcessingArgumentConfig='$_ProcessingArgumentConfig'"

                _ProcessingArgumentDefaultValue=${_ProcessingArgumentConfig%%|*}
                _ProcessingArgumentConfig=${_ProcessingArgumentConfig:${#_ProcessingArgumentDefaultValue}+1}
                read  -r  _ProcessingArgumentDefaultValue <<< $_ProcessingArgumentDefaultValue
                # echo "剩余的 _ProcessingArgumentConfig='$_ProcessingArgumentConfig'"



                if [[ "$_ProcessingArgumentType" =~ ^标准类型_ ]]; then
                    _ProcessingArgumentTypeStandardName=${_ProcessingArgumentType:5}
                else
                    _ProcessingArgumentTypeStandardName=''
                fi



                eval "_ExistingValueOfProcessingVar=\"\$${_ProcessingVariableName}\""





                # if true; then
                #     echo
                #     echo '────────────────────────────────────────────────────────────────'
                #     echo "_ProcessingArgumentName='$_ProcessingArgumentName'"
                #     echo "_ProcessingVariableName='$_ProcessingVariableName'"
                #     echo "_ProcessingArgumentType='$_ProcessingArgumentType'"
                #     echo "_ProcessingArgumentTypeStandardName='$_ProcessingArgumentTypeStandardName'"
                #     echo "_ProcessingArgumentDefaultValue='$_ProcessingArgumentDefaultValue'"
                #     echo "_ExistingValueOfProcessingVar='$_ExistingValueOfProcessingVar'"
                #     echo '────────────────────────────────────────────────────────────────'
                #     echo
                # fi





                _TemporaryArgumentValueIsAfterEqualSign=0
                _TemporaryArgumentValueIsInvalid=0
                _TemporaryArgumentValueHasTaken=0
                _TemporaryArgumentValue=





                if [ "$1" == "${_ProcessingArgumentName}" ]; then
                    # if [ $ShouldDebug -eq 1 ]; then
                    #     echo  -e  "〔调试〕： 遇到参数 '\e[0;96m${_ProcessingArgumentName}\e[0;0m' 。"
                    # fi

                    _CurrentArgumentOrArgumentPairHaveRecognized=1
                    shift

                    if [ "${_ExistingValueOfProcessingVar}" != "${VALUE_OF_UNDEFINED}" ]; then
                        Write-_吴乐川打印针对当前处理的参数的错误信息_参数不应重复出现  '1'
                        return 1
                    fi

                    if [[ "$1" =~ ^-[^0-9].*$ ]] || [ "$1" == '-' ]; then
                        if   [ "$_ProcessingArgumentType" != '标准类型_布尔' ]; then
                            Write-_吴乐川打印针对当前处理的参数的错误信息_参数未给出值  '1'
                            return 2
                        fi
                    fi

                    if [ -z "$1" ]; then
                        if   [ "$_ProcessingArgumentType" != '标准类型_布尔' ]; then
                            Write-_吴乐川打印针对当前处理的参数的错误信息_参数未给出值  '2'
                            return 2
                        fi
                    fi

                    _TemporaryArgumentValue="$1"
                elif [[ "$1" =~ ^"${_ProcessingArgumentName}"= ]]; then
                    # if [ $ShouldDebug -eq 1 ]; then
                    #     echo  -e  "〔调试〕： 遇到参数 '\e[0;96m${_ProcessingArgumentName}=\e[0;0m' 。"
                    # fi

                    _CurrentArgumentOrArgumentPairHaveRecognized=1

                    if [ "${_ExistingValueOfProcessingVar}" != "${VALUE_OF_UNDEFINED}" ]; then
                        Write-_吴乐川打印针对当前处理的参数的错误信息_参数不应重复出现  '2'
                        shift
                        return 1
                    fi

                    _TemporaryArgumentValue=${1:${#_ProcessingArgumentName}+1}
                    _TemporaryArgumentValueIsAfterEqualSign=1
                    shift

                    if [ -z "${_TemporaryArgumentValue}" ]; then
                        Write-_吴乐川打印针对当前处理的参数的错误信息_参数未给出值  '3'  true
                        return 2
                    fi
                fi



                if [ $_CurrentArgumentOrArgumentPairHaveRecognized -eq 1 ]; then

                    # if [ $ShouldDebug -eq 1 ]; then
                    #     echo  -e  "〔调试〕： 考察参数值 '\e[0;91m${_TemporaryArgumentValue}\e[0;0m' 。"
                    # fi

                    if   [ "$_ProcessingArgumentType" == '标准类型_布尔' ]; then

                        if   [ "${_TemporaryArgumentValue}" == '$true'  ] || [ "${_TemporaryArgumentValue}" == 'true'  ] || [ "${_TemporaryArgumentValue}" == '1' ]; then
                            _TemporaryArgumentValue='true'
                            _TemporaryArgumentValueHasTaken=1
                        elif [ "${_TemporaryArgumentValue}" == '$false' ] || [ "${_TemporaryArgumentValue}" == 'false' ] || [ "${_TemporaryArgumentValue}" == '0' ]; then
                            _TemporaryArgumentValue='false'
                            _TemporaryArgumentValueHasTaken=1
                        else
                            if [ $_TemporaryArgumentValueIsAfterEqualSign -eq 0 ]; then
                                _TemporaryArgumentValue='true'
                                _TemporaryArgumentValueHasTaken=0
                            else
                                _TemporaryArgumentValue='true'
                                _TemporaryArgumentValueHasTaken=1
                            fi
                        fi

                    elif [ "$_ProcessingArgumentType" == '标准类型_整数' ]; then

                        if [[ "${_TemporaryArgumentValue}" =~ ^[+-]?0$ ]] || [[ "${_TemporaryArgumentValue}" =~ ^[+-]?[1-9][0-9]*$ ]]; then
                            _TemporaryArgumentValueHasTaken=1
                        else
                            _TemporaryArgumentValueIsInvalid=1
                        fi

                    elif [ "$_ProcessingArgumentType" == '标准类型_非负整数' ]; then

                        if [[ "${_TemporaryArgumentValue}" =~ ^[+-]?0$ ]] || [[ "${_TemporaryArgumentValue}" =~ ^[+]?[1-9][0-9]*$ ]]; then
                            _TemporaryArgumentValueHasTaken=1
                        else
                            _TemporaryArgumentValueIsInvalid=1
                        fi

                    elif [ "$_ProcessingArgumentType" == '标准类型_正整数' ]; then

                        if [[ "${_TemporaryArgumentValue}" =~ ^[+]?[1-9][0-9]*$ ]]; then
                            _TemporaryArgumentValueHasTaken=1
                        else
                            _TemporaryArgumentValueIsInvalid=1
                        fi

                    elif [ "$_ProcessingArgumentType" == '标准类型_变量名' ]; then

                        if [[ "${_TemporaryArgumentValue}" =~ ^[a-zA-Z_-][0-9a-zA-Z_-]*$ ]]; then
                            _TemporaryArgumentValueHasTaken=1
                        else
                            _TemporaryArgumentValueIsInvalid=1
                        fi

                    # elif [ "$_ProcessingArgumentType" == "SomeVarName" ]; then

                    #     if [[ "${_TemporaryArgumentValue}" =~ ^这个古怪的变量的取值必须以这句话开头 ]]; then
                    #         _TemporaryArgumentValueHasTaken=1
                    #     else
                    #         _TemporaryArgumentValueIsInvalid=1
                    #     fi

                    fi



                    if [ $_TemporaryArgumentValueIsInvalid -eq 0 ]; then
                        eval "$_ProcessingVariableName=\$_TemporaryArgumentValue"
                    else
                        Write-_吴乐川打印针对当前处理的参数的错误信息_参数值不合规
                        return 3
                    fi



                    if [ $_TemporaryArgumentValueIsAfterEqualSign -eq 0 ]; then
                        if [ $_TemporaryArgumentValueHasTaken -eq 1 ]; then
                            shift
                        fi
                    fi



                    break
                fi
            done
        fi



        if [ $_CurrentArgumentOrArgumentPairHaveRecognized -eq 0 ]; then

            eval "AnonymouseValuesArrayAddedByThisTool+=( \"\${1}\" )"
            # AnonymouseValuesArrayAddedByThisTool+=( \"${1}\" ) # 这种写法反而不可靠。
            ((AnonymouseValuesCountAddedByThisTool++))

            if [ ! -z "$ResultRecievingVarName_AnonymousValuesArray" ]; then
                eval "$ResultRecievingVarName_AnonymousValuesArray+=( \"\${1}\" )"
            fi

            shift
        fi
    done



    for ((_ArgumentConfigsLoopIndex=0; _ArgumentConfigsLoopIndex<_ArgumentConfigsCount; _ArgumentConfigsLoopIndex++)); do
        _ProcessingArgumentConfig=${ArgumentConfigsArray[$_ArgumentConfigsLoopIndex]}

        _ProcessingArgumentName=${_ProcessingArgumentConfig%%|*}
        _ProcessingArgumentConfig=${_ProcessingArgumentConfig:${#_ProcessingArgumentName}+1}
        read  -r  _ProcessingArgumentName <<< $_ProcessingArgumentName
        # echo "剩余的 _ProcessingArgumentConfig='$_ProcessingArgumentConfig'"

        _ProcessingVariableName=${_ProcessingArgumentConfig%%|*}
        _ProcessingArgumentConfig=${_ProcessingArgumentConfig:${#_ProcessingVariableName}+1}
        read  -r  _ProcessingVariableName <<< $_ProcessingVariableName
        # echo "剩余的 _ProcessingArgumentConfig='$_ProcessingArgumentConfig'"

        _ProcessingArgumentType=${_ProcessingArgumentConfig%%|*}
        _ProcessingArgumentConfig=${_ProcessingArgumentConfig:${#_ProcessingArgumentType}+1}
        read  -r  _ProcessingArgumentType <<< $_ProcessingArgumentType
        # echo "剩余的 _ProcessingArgumentConfig='$_ProcessingArgumentConfig'"

        _ProcessingArgumentDefaultValue=${_ProcessingArgumentConfig%%|*}
        _ProcessingArgumentConfig=${_ProcessingArgumentConfig:${#_ProcessingArgumentDefaultValue}+1}
        read  -r  _ProcessingArgumentDefaultValue <<< $_ProcessingArgumentDefaultValue
        # echo "剩余的 _ProcessingArgumentConfig='$_ProcessingArgumentConfig'"



        eval "_ExistingValueOfProcessingVar=\"\$${_ProcessingVariableName}\""



        # if true; then
        #     echo
        #     echo '────────────────────────────────────────────────────────────────'
        #     echo "_ProcessingArgumentName='$_ProcessingArgumentName'"
        #     echo "_ProcessingVariableName='$_ProcessingVariableName'"
        #     echo "_ProcessingArgumentType='$_ProcessingArgumentType'"
        #     echo "_ProcessingArgumentTypeStandardName='$_ProcessingArgumentTypeStandardName'"
        #     echo "_ProcessingArgumentDefaultValue='$_ProcessingArgumentDefaultValue'"
        #     echo "_ExistingValueOfProcessingVar='$_ExistingValueOfProcessingVar'"
        #     echo '────────────────────────────────────────────────────────────────'
        #     echo
        # fi



        if [ "${_ExistingValueOfProcessingVar}" == "${VALUE_OF_UNDEFINED}" ]; then
            _ExistingValueOfProcessingVar=$_ProcessingArgumentDefaultValue
            eval "${_ProcessingVariableName}=\$_ExistingValueOfProcessingVar"
        fi
    done





    # 最后，按需打印结论性的调试信息。

    if [ $ShouldDebug -eq 1 ]; then
        echo
        echo
        echo
        echo      '〔调试〕： ────────────────────────────────────────────────────────────────'
        echo  -e  "〔调试〕： \e[0;32m函数${NoColor}"
        echo  -e  "〔调试〕：     \e[0;32m“ ${ColorOfTermInErrorMessage}${NameOfThisFunction}\e[0;32m ”${NoColor}"
        echo  -e  "〔调试〕： \e[0;32m的各变量：${NoColor}"
        echo

        local ColorOfArgumentNames="\e[0;96m"
        local ColorOfVarNames="\e[0;33m"
        local ColorOfVarValueTypes="\e[0;32m"
        local ColorOfValues="\e[0;91m"
        local ColorOfExpressionParts="\e[0;97m"

        for ((_ArgumentConfigsLoopIndex=0; _ArgumentConfigsLoopIndex<_ArgumentConfigsCount; _ArgumentConfigsLoopIndex++)); do
            _ProcessingArgumentConfig=${ArgumentConfigsArray[$_ArgumentConfigsLoopIndex]}

            _ProcessingArgumentName=${_ProcessingArgumentConfig%%|*}
            _ProcessingArgumentConfig=${_ProcessingArgumentConfig:${#_ProcessingArgumentName}+1}
            read _ProcessingArgumentName <<< $_ProcessingArgumentName
            # echo "剩余的 _ProcessingArgumentConfig='$_ProcessingArgumentConfig'"

            if [ "$_ProcessingArgumentName" == "$ARGUMENT_ID_OF_ANONYMOUSE_VALUES_LIST" ]; then
                continue
            fi

            _ProcessingVariableName=${_ProcessingArgumentConfig%%|*}
            _ProcessingArgumentConfig=${_ProcessingArgumentConfig:${#_ProcessingVariableName}+1}
            read _ProcessingVariableName <<< $_ProcessingVariableName
            # echo "剩余的 _ProcessingArgumentConfig='$_ProcessingArgumentConfig'"

            _ProcessingArgumentType=${_ProcessingArgumentConfig%%|*}
            _ProcessingArgumentConfig=${_ProcessingArgumentConfig:${#_ProcessingArgumentType}+1}
            read _ProcessingArgumentType <<< $_ProcessingArgumentType
            # echo "剩余的 _ProcessingArgumentConfig='$_ProcessingArgumentConfig'"

            _ProcessingArgumentDefaultValue=${_ProcessingArgumentConfig%%|*}
            _ProcessingArgumentConfig=${_ProcessingArgumentConfig:${#_ProcessingArgumentDefaultValue}+1}
            read _ProcessingArgumentDefaultValue <<< $_ProcessingArgumentDefaultValue
            # echo "剩余的 _ProcessingArgumentConfig='$_ProcessingArgumentConfig'"



            if [[ "$_ProcessingArgumentType" =~ ^标准类型_ ]]; then
                _ProcessingArgumentTypeStandardName=${_ProcessingArgumentType:5}
            else
                _ProcessingArgumentTypeStandardName=''
            fi



            eval "_ExistingValueOfProcessingVar=\"\$${_ProcessingVariableName}\""



            echo      '〔调试〕： ──────────────────────────────────────'

            if [ -z "$_ProcessingArgumentTypeStandardName" ]; then
            echo  -e  "〔调试〕： ${ColorOfArgumentNames}${_ProcessingArgumentName}${NoColor}"
            else
            echo  -e  "〔调试〕： ${ColorOfArgumentNames}${_ProcessingArgumentName}${NoColor} （${ColorOfVarValueTypes}${_ProcessingArgumentTypeStandardName}${NoColor}）"
            fi

            echo  -e  "〔调试〕：     ${ColorOfVarNames}${_ProcessingVariableName}${ColorOfExpressionParts}=${ColorOfValues}${_ExistingValueOfProcessingVar}${NoColor}"
            echo

        done

        if [ $AnonymouseValuesCountAddedByThisTool -gt 0 ]; then
            echo      '〔调试〕： ──────────────────────────────────────'
            echo  -e  "〔调试〕： ${ColorOfArgumentNames}${ARGUMENT_ID_OF_ANONYMOUSE_VALUES_LIST}${NoColor}"
            echo  -e  "〔调试〕：     ${ColorOfVarNames}${ResultRecievingVarName_AnonymousValuesArray}${ColorOfExpressionParts}+=(${NoColor}"

            local AnonymouseValue=
            local AnonymouseValueIndex=0
            local AnonymouseValueNumberWithPadding=''
            local AnonymouseValuesCountAddedByThisToolIsGreaterThan9=0
            local AnonymouseValuesCountAddedByThisToolIsGreaterThan99=0

            if [ $AnonymouseValuesCountAddedByThisTool -gt 9 ]; then
                AnonymouseValuesCountAddedByThisToolIsGreaterThan9=1
            fi

            if [ $AnonymouseValuesCountAddedByThisTool -gt 99 ]; then
                AnonymouseValuesCountAddedByThisToolIsGreaterThan99=1
            fi

            for ((AnonymouseValueIndex=0; AnonymouseValueIndex<$AnonymouseValuesCountAddedByThisTool; AnonymouseValueIndex++)); do

                AnonymouseValue=${AnonymouseValuesArrayAddedByThisTool[$AnonymouseValueIndex]}

                # ──────────────────────────────────────

                AnonymouseValueNumberWithPadding=$((AnonymouseValueIndex+1))
                if [ $AnonymouseValueNumberWithPadding -lt 10 ]; then
                    if [ $AnonymouseValuesCountAddedByThisToolIsGreaterThan99 -eq 1 ]; then
                        AnonymouseValueNumberWithPadding="  ${AnonymouseValueNumberWithPadding}"
                    elif [ $AnonymouseValuesCountAddedByThisToolIsGreaterThan9 -eq 1 ]; then
                        AnonymouseValueNumberWithPadding=" ${AnonymouseValueNumberWithPadding}"
                    fi
                elif [ $AnonymouseValueNumberWithPadding -lt 100 ]; then
                    if [ $AnonymouseValuesCountAddedByThisToolIsGreaterThan99 -eq 1 ]; then
                        AnonymouseValueNumberWithPadding=" ${AnonymouseValueNumberWithPadding}"
                    fi
                fi
                AnonymouseValueNumberWithPadding="[+${AnonymouseValueNumberWithPadding}]"

                # ──────────────────────────────────────

                echo  -e  "〔调试〕：        ${AnonymouseValueNumberWithPadding}： ${ColorOfExpressionParts}\"${ColorOfValues}${AnonymouseValue}${ColorOfExpressionParts}\"${NoColor}"

            done

            echo  -e  "〔调试〕：     ${ColorOfExpressionParts})${NoColor}"
            echo
        fi
    fi
}
