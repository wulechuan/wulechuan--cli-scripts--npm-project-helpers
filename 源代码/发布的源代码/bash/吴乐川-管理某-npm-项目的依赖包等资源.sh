function Write-Line-without-line-break {
    local Count=72

    if [[ "$1" =~ ^[0-9]{1,4}$ ]]; then
        Count=$1
    fi

    # local LoopIndex=0
    # while [ $LoopIndex -lt $Count ]; do
    #     echo -n '─';
    #     LoopIndex=$((LoopIndex+1))
    # done

    for Index in `seq $Count`; do echo -n '─'; done
}

function Write-Line {
    Write-Line-without-line-break $1
    echo
}



function Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同 {
    if false; then
        echo -en  "\e[0;30m"
        Write-Line-without-line-break
        echo -e   "\e[0;0m"
    fi
}



function Write-_吴乐川打印足够的的空白行_在某任务开始前 {
    for i in {1..2}; do echo; done
}



function Write-_吴乐川打印足够的的空白行_在某任务结束后 {
    for i in {1..7}; do echo; done
}





function Read-_吴乐川管理某_npm_项目__读取公共参数 {
    local ShouldDebug=0
    if [ "$1" == '--debug' ]; then
        ShouldDebug=1
        shift
    fi



    local LoopIndex=0
    while [[ ! -z "$1" && $LoopIndex -lt 32 ]]; do
        LoopIndex=$((LoopIndex+1))
        if [ $ShouldDebug -eq 1 ]; then
            echo "[DEBUG] 读取公共参数 [$LoopIndex]\$1='$1'"
        fi



        # ───────────────────────────────────────────────

        if [ "$1" == '--remove-node-modules-first' ]; then
            if [ $ShouldDebug -eq 1 ]; then
                echo "[DEBUG] 读取公共参数 ShouldRemoveNodeModulesFirst [nothing1] '$ShouldRemoveNodeModulesFirst'"
            fi

            ShouldRemoveNodeModulesFirst=1
            shift


            if [ ! -z "$1" ]; then
                if [[ "$1" =~ ^- ]]; then
                    if [ $ShouldDebug -eq 1 ]; then
                        echo "[DEBUG] 读取公共参数 ShouldRemoveNodeModulesFirst [nothing2] '$ShouldRemoveNodeModulesFirst'"
                    fi
                    continue
                else
                    ShouldRemoveNodeModulesFirst="$1"
                    if [ $ShouldDebug -eq 1 ]; then
                        echo "[DEBUG] 读取公共参数 ShouldRemoveNodeModulesFirst [space] '$ShouldRemoveNodeModulesFirst'"
                    fi

                    shift
                    continue
                fi
            fi

        elif [[ "$1" =~ ^--remove-node-modules-first= ]]; then
            if [ $ShouldDebug -eq 1 ]; then
                echo "[DEBUG] 读取公共参数 ShouldRemoveNodeModulesFirst [=] '$ShouldRemoveNodeModulesFirst'"
            fi

            ShouldRemoveNodeModulesFirst="${1:28}"
            shift
            continue
        fi

        # ───────────────────────────────────────────────

        if [ "$1" == '--remove-packa-lock-json-first' ]; then
            if [ $ShouldDebug -eq 1 ]; then
                echo "[DEBUG] 读取公共参数 ShouldRemovePackageLockJSONFirst [nothing1] '$ShouldRemovePackageLockJSONFirst'"
            fi

            ShouldRemovePackageLockJSONFirst=1
            shift


            if [ ! -z "$1" ]; then
                if [[ "$1" =~ ^- ]]; then
                    if [ $ShouldDebug -eq 1 ]; then
                        echo "[DEBUG] 读取公共参数 ShouldRemovePackageLockJSONFirst [nothing2] '$ShouldRemovePackageLockJSONFirst'"
                    fi
                    continue
                else
                    ShouldRemovePackageLockJSONFirst="$1"
                    if [ $ShouldDebug -eq 1 ]; then
                        echo "[DEBUG] 读取公共参数 ShouldRemovePackageLockJSONFirst [space] '$ShouldRemovePackageLockJSONFirst'"
                    fi

                    shift
                    continue
                fi
            fi

        elif [[ "$1" =~ ^--remove-packa-lock-json-first= ]]; then
            if [ $ShouldDebug -eq 1 ]; then
                echo "[DEBUG] 读取公共参数 ShouldRemovePackageLockJSONFirst [=] '$ShouldRemovePackageLockJSONFirst'"
            fi

            ShouldRemovePackageLockJSONFirst="${1:31}"
            shift
            continue
        fi

        # ───────────────────────────────────────────────

        if [ "$1" == '--should-run-this-task' ]; then
            if [ $ShouldDebug -eq 1 ]; then
                echo "[DEBUG] 读取公共参数 ShouldRunThisTask [nothing1] '$ShouldRunThisTask'"
            fi

            ShouldRunThisTask=1
            shift


            if [ ! -z "$1" ]; then
                if [[ "$1" =~ ^- ]]; then
                    if [ $ShouldDebug -eq 1 ]; then
                        echo "[DEBUG] 读取公共参数 ShouldRunThisTask [nothing2] '$ShouldRunThisTask'"
                    fi
                    continue
                else
                    ShouldRunThisTask="$1"
                    if [ $ShouldDebug -eq 1 ]; then
                        echo "[DEBUG] 读取公共参数 ShouldRunThisTask [space] '$ShouldRunThisTask'"
                    fi

                    shift
                    continue
                fi
            fi

        elif [[ "$1" =~ ^--should-run-this-task= ]]; then
            if [ $ShouldDebug -eq 1 ]; then
                echo "[DEBUG] 读取公共参数 ShouldRunThisTask [=] '$ShouldRunThisTask'"
            fi

            ShouldRunThisTask="${1:23}"
            shift
            continue
        fi

        # ───────────────────────────────────────────────

        if [ "$1" == '--dry-run' ]; then
            if [ $ShouldDebug -eq 1 ]; then
                echo "[DEBUG] 读取公共参数 ShouldDryRun [nothing1] '$ShouldDryRun'"
            fi

            ShouldDryRun=1
            shift

            if [ ! -z "$1" ]; then
                if [[ "$1" =~ ^- ]]; then
                    if [ $ShouldDebug -eq 1 ]; then
                        echo "[DEBUG] 读取公共参数 ShouldDryRun [nothing2] '$ShouldDryRun'"
                    fi
                    continue
                else
                    ShouldDryRun="$1"
                    if [ $ShouldDebug -eq 1 ]; then
                        echo "[DEBUG] 读取公共参数 ShouldDryRun [space] '$ShouldDryRun'"
                    fi

                    shift
                    continue
                fi
            fi

        elif [[ "$1" =~ ^--dry-run= ]]; then
            if [ $ShouldDebug -eq 1 ]; then
                echo "[DEBUG] 读取公共参数 ShouldDryRun [=] '$ShouldDryRun'"
            fi

            ShouldDryRun="${1:10}"
            shift
            continue
        fi

        # ───────────────────────────────────────────────

        if [ "$1" == '--is-ending' ]; then
            if [ $ShouldDebug -eq 1 ]; then
                echo "[DEBUG] 读取公共参数 IsEnding [nothing1] '$IsEnding'"
            fi

            IsEnding=1
            shift

            if [ ! -z "$1" ]; then
                if [[ "$1" =~ ^- ]]; then
                    if [ $ShouldDebug -eq 1 ]; then
                        echo "[DEBUG] 读取公共参数 IsEnding [nothing2] '$IsEnding'"
                    fi
                    continue
                else
                    IsEnding="$1"
                    if [ $ShouldDebug -eq 1 ]; then
                        echo "[DEBUG] 读取公共参数 IsEnding [space] '$IsEnding'"
                    fi

                    shift
                    continue
                fi
            fi

        elif [[ "$1" =~ ^--is-ending= ]]; then
            if [ $ShouldDebug -eq 1 ]; then
                echo "[DEBUG] 读取公共参数 IsEnding [=] '$IsEnding'"
            fi

            IsEnding="${1:11}"
            shift
            continue
        fi

        # ───────────────────────────────────────────────
    done



    if [[ ! "$ShouldRemoveNodeModulesFirst" =~ ^[01]$ ]]; then
        if [ "$ShouldRemoveNodeModulesFirst" == 'true' ]; then
            ShouldRemoveNodeModulesFirst=1
        else
            ShouldRemoveNodeModulesFirst=0
    fi
    fi
    if [ $ShouldDebug -eq 1 ]; then
        echo "[DEBUG] 读取公共参数 ShouldRemoveNodeModulesFirst : '$ShouldRemoveNodeModulesFirst'"
    fi



    if [[ ! "$ShouldRemovePackageLockJSONFirst" =~ ^[01]$ ]]; then
        if [ "$ShouldRemovePackageLockJSONFirst" == 'true' ]; then
            ShouldRemovePackageLockJSONFirst=1
        else
            ShouldRemovePackageLockJSONFirst=0
    fi
    fi
    if [ $ShouldDebug -eq 1 ]; then
        echo "[DEBUG] 读取公共参数 ShouldRemovePackageLockJSONFirst : '$ShouldRemovePackageLockJSONFirst'"
    fi



    if [[ ! "$ShouldRunThisTask" =~ ^[01]$ ]]; then
        if [ "$ShouldRunThisTask" == 'true' ]; then
            ShouldRunThisTask=1
        else
            ShouldRunThisTask=0
    fi
    fi
    if [ $ShouldDebug -eq 1 ]; then
        echo "[DEBUG] 读取公共参数 ShouldRunThisTask : '$ShouldRunThisTask'"
    fi



    if [[ ! "$ShouldDryRun" =~ ^[01]$ ]]; then
        if [ "$ShouldDryRun" == 'true' ]; then
            ShouldDryRun=1
        else
            ShouldDryRun=0
        fi
    fi
    if [ $ShouldDebug -eq 1 ]; then
        echo "[DEBUG] 读取公共参数 ShouldDryRun : '$ShouldDryRun'"
    fi



    if [[ ! "$IsEnding" =~ ^[01]$ ]]; then
        if [ "$IsEnding" == 'true' ]; then
            IsEnding=1
        else
            IsEnding=0
        fi
    fi
    if [ $ShouldDebug -eq 1 ]; then
        echo "[DEBUG] 读取公共参数 IsEnding : '$IsEnding'"
    fi
}





function Remove-吴乐川管理某_npm_项目__删除当前文件夹下的_node_modules {
    local DisplayName='node_modules 文件夹'



    Read-_吴乐川管理某_npm_项目__读取公共参数  $*



    Write-_吴乐川打印足够的的空白行_在某任务开始前
    Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同
    if [ "$ShouldDryRun" -eq 0 ]; then
        echo  -e "\e[0;96m══════════════════ 删除 ${DisplayName} ════════════════════════════\e[0;0m"
    else
        echo  -e "\e[0;96m═══【仿真演练】═══ 删除 ${DisplayName} ════════════════════════════\e[0;0m"
    fi
    echo



    if [ $ShouldRunThisTask -eq 1 ]; then
        if [ -d .'/node_modules' ]; then
            if [ "$ShouldDryRun" -eq 0 ]; then
                rm  -rf  .'/node_modules'

                if [ $? -gt 0 ]; then
                    exit $?
                fi

                echo  -e  "\e[0;97m${DisplayName}已删除。\e[0;0m"
            else
                echo  -e  "   \e[0;93m【仿真演练】\e[0;0m"
                echo  -e  "    \e[0;97m${DisplayName}已\e[0;93m（视为）\e[0;97m删除。\e[0;0m"
            fi
        else
            echo  -e  "${DisplayName}并不存在。不必执行。"
        fi
    else
        echo  -e  "已略过。 ${DisplayName}并未删除。"
    fi



    echo
    if [ "$ShouldDryRun" -eq 0 ]; then
        echo  -e "\e[0;96m══════════════════ 删除 ${DisplayName} ══════════════ 已结束 ══════\e[0;0m"
    else
        echo  -e "\e[0;96m═══【仿真演练】═══ 删除 ${DisplayName} ══════════════ 已结束 ══════\e[0;0m"
    fi
    Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同
    Write-_吴乐川打印足够的的空白行_在某任务结束后
}



function Remove-吴乐川管理某_npm_项目__删除当前文件夹下的_package_lock_json {
    local DisplayName='package-lock.json 文件'



    Read-_吴乐川管理某_npm_项目__读取公共参数  $*



    Write-_吴乐川打印足够的的空白行_在某任务开始前
    Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同
    if [ "$ShouldDryRun" -eq 0 ]; then
        echo  -e "\e[0;92m══════════════════ 删除 ${DisplayName} ═════════════════════════\e[0;0m"
    else
        echo  -e "\e[0;92m═══【仿真演练】═══ 删除 ${DisplayName} ═════════════════════════\e[0;0m"
    fi
    echo



    if [ $ShouldRunThisTask -eq 1 ]; then
        if [ -d .'/package-lock.json' ]; then
            if [ "$ShouldDryRun" -eq 0 ]; then
                rm  -rf  .'/package-lock.json'

                if [ $? -gt 0 ]; then
                    exit $?
                fi

                echo  -e  "\e[0;97m${DisplayName}已删除。\e[0;0m"
            else
                echo  -e  "   \e[0;93m【仿真演练】\e[0;0m"
                echo  -e  "    \e[0;97m${DisplayName}已\e[0;93m（视为）\e[0;97m删除。\e[0;0m"
            fi
        else
            echo  -e  "${DisplayName}并不存在。不必执行。"
        fi
    else
        echo  -e  "已略过。 ${DisplayName}并未删除。"
    fi



    echo
    if [ "$ShouldDryRun" -eq 0 ]; then
        echo  -e "\e[0;92m══════════════════ 删除 ${DisplayName} ═══════════ 已结束 ══════\e[0;0m"
    else
        echo  -e "\e[0;92m═══【仿真演练】═══ 删除 ${DisplayName} ═══════════ 已结束 ══════\e[0;0m"
    fi
    Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同
    Write-_吴乐川打印足够的的空白行_在某任务结束后
}



function Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_产品级_均为最晚版本 {
    local IsEnding=0
    Read-_吴乐川管理某_npm_项目__读取公共参数  $*
    # echo "[DEBUG] 产品级_均为最晚版本 IsEnding='$IsEnding'"



    if [ "$IsEnding" -eq 0 ]; then
        Write-_吴乐川打印足够的的空白行_在某任务开始前
        Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同
        if [ "$ShouldDryRun" -eq 0 ]; then
            echo  -e  "\e[0;31m══════════════════ npm i    最晚版本之【产品依赖包】════════════════════\e[0;0m"
        else
            echo  -e  "\e[0;31m═══【仿真演练】═══ npm i    最晚版本之【产品依赖包】════════════════════\e[0;0m"
        fi
        echo
    else
        echo
        if [ "$ShouldDryRun" -eq 0 ]; then
            echo  -e  "\e[0;31m══════════════════ npm i    最晚版本之【产品依赖包】 ══════ 已结束 ══════\e[0;0m"
        else
            echo  -e  "\e[0;31m═══【仿真演练】═══ npm i    最晚版本之【产品依赖包】 ══════ 已结束 ══════\e[0;0m"
        fi
        Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同
        Write-_吴乐川打印足够的的空白行_在某任务结束后
    fi
}



function Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_产品级_均为特定版本 {
    local IsEnding=0
    Read-_吴乐川管理某_npm_项目__读取公共参数  $*
    # echo "[DEBUG] 产品级_均为特定版本 IsEnding='$IsEnding'"



    if [ "$IsEnding" -eq 0 ]; then
        Write-_吴乐川打印足够的的空白行_在某任务开始前
        Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同
        if [ "$ShouldDryRun" -eq 0 ]; then
            echo  -e  "\e[0;31m══════════════════ npm i    \e[97;41m特定版本\e[0;31m之【产品依赖包】════════════════════\e[0;0m"
        else
            echo  -e  "\e[0;31m═══【仿真演练】═══ npm i    \e[97;41m特定版本\e[0;31m之【产品依赖包】════════════════════\e[0;0m"
        fi
        echo
    else
        echo
        if [ "$ShouldDryRun" -eq 0 ]; then
            echo  -e  "\e[0;31m══════════════════ npm i    \e[97;41m特定版本\e[0;31m之【产品依赖包】══════ 已结束 ══════\e[0;0m"
        else
            echo  -e  "\e[0;31m═══【仿真演练】═══ npm i    \e[97;41m特定版本\e[0;31m之【产品依赖包】══════ 已结束 ══════\e[0;0m"
        fi
        Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同
        Write-_吴乐川打印足够的的空白行_在某任务结束后
    fi
}



function Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_研发级_均为最晚版本 {
    local IsEnding=0
    Read-_吴乐川管理某_npm_项目__读取公共参数  $*
    # echo "[DEBUG] 研发级_均为最晚版本 IsEnding='$IsEnding'"



    if [ "$IsEnding" -eq 0 ]; then
        Write-_吴乐川打印足够的的空白行_在某任务开始前
        Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同
        if [ "$ShouldDryRun" -eq 0 ]; then
            echo  -e  "\e[0;32m══════════════════ npm i -D 最晚版本之【研发依赖包】════════════════════\e[0;0m"
        else
            echo  -e  "\e[0;32m═══【仿真演练】═══ npm i -D 最晚版本之【研发依赖包】════════════════════\e[0;0m"
        fi
        echo
    else
        echo
        if [ "$ShouldDryRun" -eq 0 ]; then
            echo  -e  "\e[0;32m══════════════════ npm i -D 最晚版本之【研发依赖包】══════ 已结束 ══════\e[0;0m"
        else
            echo  -e  "\e[0;32m═══【仿真演练】═══ npm i -D 最晚版本之【研发依赖包】══════ 已结束 ══════\e[0;0m"
        fi
        Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同
        Write-_吴乐川打印足够的的空白行_在某任务结束后
    fi
}



function Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_研发级_均为特定版本 {
    local IsEnding=0
    Read-_吴乐川管理某_npm_项目__读取公共参数  $*
    # echo "[DEBUG] 研发级_均为特定版本 IsEnding='$IsEnding'"



    if [ "$IsEnding" -eq 0 ]; then
        Write-_吴乐川打印足够的的空白行_在某任务开始前
        Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同
        if [ "$ShouldDryRun" -eq 0 ]; then
            echo  -e  "\e[0;32m══════════════════ npm i -D \e[30;102m特定版本\e[0;32m之【研发依赖包】════════════════════\e[0;0m"
        else
            echo  -e  "\e[0;32m═══【仿真演练】═══ npm i -D \e[30;102m特定版本\e[0;32m之【研发依赖包】════════════════════\e[0;0m"
        fi
        echo
    else
        echo
        if [ "$ShouldDryRun" -eq 0 ]; then
            echo  -e  "\e[0;32m══════════════════ npm i -D \e[30;102m特定版本\e[0;32m之【研发依赖包】══════ 已结束 ══════\e[0;0m"
        else
            echo  -e  "\e[0;32m═══【仿真演练】═══ npm i -D \e[30;102m特定版本\e[0;32m之【研发依赖包】══════ 已结束 ══════\e[0;0m"
        fi
        Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同
        Write-_吴乐川打印足够的的空白行_在某任务结束后
    fi
}



function Write-吴乐川管理某_npm_项目__打印提示语__更新与研发相关的数据库 {
    local IsEnding=0
    Read-_吴乐川管理某_npm_项目__读取公共参数  $*
    # echo "[DEBUG] 研发相关的数据库 IsEnding='$IsEnding'"



    if [ "$IsEnding" -eq 0 ]; then
        Write-_吴乐川打印足够的的空白行_在某任务开始前
        Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同
        if [ "$ShouldDryRun" -eq 0 ]; then
            echo  -e  "\e[0;33m══════════════════ 更新与研发相关的数据库 ══════════════════════════════\e[0;0m"
        else
            echo  -e  "\e[0;33m═══【仿真演练】═══ 更新与研发相关的数据库 ══════════════════════════════\e[0;0m"
        fi
        echo
    else
        echo
        if [ "$ShouldDryRun" -eq 0 ]; then
            echo  -e  "\e[0;33m══════════════════ 更新与研发相关的数据库 ════════════════ 已结束 ══════\e[0;0m"
        else
            echo  -e  "\e[0;33m═══【仿真演练】═══ 更新与研发相关的数据库 ════════════════ 已结束 ══════\e[0;0m"
        fi
        Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同
        Write-_吴乐川打印足够的的空白行_在某任务结束后
    fi
}



function Write-吴乐川管理某_npm_项目__打印提示语__其他交代 {
    local IsEnding=0
    Read-_吴乐川管理某_npm_项目__读取公共参数  $*
    # echo "[DEBUG] 其他交代 IsEnding='$IsEnding'"



    if [ "$IsEnding" -eq 0 ]; then
        Write-_吴乐川打印足够的的空白行_在某任务开始前
        Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同
        if [ "$ShouldDryRun" -eq 0 ]; then
            echo  -e  "\e[0;94m══════════════════ 其他交代 ════════════════════════════════════════════\e[0;0m"
        else
            echo  -e  "\e[0;94m═══【仿真演练】═══ 其他交代 ════════════════════════════════════════════\e[0;0m"
        fi
        echo
    else
        echo
        if [ "$ShouldDryRun" -eq 0 ]; then
            echo  -e  "\e[0;94m══════════════════ 其他交代 ══════════════════════════════ 已结束 ══════\e[0;0m"
        else
            echo  -e  "\e[0;94m═══【仿真演练】═══ 其他交代 ══════════════════════════════ 已结束 ══════\e[0;0m"
        fi
        Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同
        Write-_吴乐川打印足够的的空白行_在某任务结束后
    fi
}





# function Update-吴乐川更新当前_npm_项目的某批依赖包 {
#     local depsAreOfProductionLevel=0

#     if [ "$1" == '--这批依赖包之依赖类别' ]; then
#         shift

#         if [ "$1" == '本产品拟囊括这些软件之整体或部分' ]; then
#             depsAreOfProductionLevel=1
#             shift
#         elif [ "$1" == '本产品仅会在研发阶段借助这些软件' ]; then
#             depsAreOfProductionLevel=0
#             shift
#         else
#             echo -e "\e[0;31m参数“\e[0;97m--这批依赖包之依赖类别\e[31m”的取值只能是下列之一：\e[0;0m"
#             echo -e "    '本产品拟囊括这些软件之整体或部分'"
#             echo -e "    '本产品仅会在研发阶段借助这些软件'"
#             echo

#             exit 21
#         fi
#     fi





#     if [ $depsAreOfProductionLevel -eq 1 ]; then
#         Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_产品级_均为最晚版本
#     else
#         Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_研发级_均为最晚版本
#     fi

#     echo -e "\e[41;97m 该功能尚未实现！\e[0;0m" # TODO





#     if [ $depsAreOfProductionLevel -eq 1 ]; then
#         Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_产品级_均为特定版本
#     else
#         Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_研发级_均为特定版本
#     fi

#     echo -e "\e[41;97m 该功能尚未实现！\e[0;0m" # TODO
# }
