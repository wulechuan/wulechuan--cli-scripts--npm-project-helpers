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
                echo  -e  "\e[0;31m正在删除 node_modules 文件夹。\e[0;0m"
                echo

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





function Update-吴乐川更新当前_npm_项目的某批依赖包 {
    local PACKAGE_CONFIG_CONTENT_DEFAULT_SEPARATOR='|||'
    local SHOULD_DEBUG=0





    # --内容分割记号          至多出现 1 次。    非空白文本。
    # --这批依赖包之依赖类别   至多出现 1 次。    '本产品拟囊括这些软件之整体或部分' | '本产品仅会在研发阶段借助这些软件'
    # --应仅作仿真演练        至多出现 1 次。    1 | 0 | true | false
    # --某依赖包之版本配置    可多次出现。        非空白文本。





    function Write-_吴乐川打印针对当前处理的参数的错误信息 {
        echo -e "\e[0;31m在命令参数表中的 “ \e[0;97m${_ProcessingArgumentName}\e[0;31m ” 参数：\n    \e[0;33m${1}\e[0;0m"
    }

    function Write-_吴乐川打印针对当前处理的依赖包原始配置参数的错误信息 {
        echo -e "\e[0;31m在命令参数表中第 \e[0;96m${_IndexOfProcessingConfiguration}\e[0;31m 次出现的 “ \e[0;97m${_ProcessingArgumentName}\e[0;31m ” 参数：\n    \e[0;33m${1}\e[0;0m"
    }





    local PackageConfigContentSeparator='undefined'
    local DependenciesAreOfCateogryOfProduction='undefined' # 'true' 或其它值。
    local ShouldDryRun='undefined' # 'true' 或其它值。
    local DependencyVersionConfigurations=()



    local _TemporaryArgumentValue
    local _ProcessingArgumentName
    local _ProcessedArgumentsCount=0
    local _CurrentArgumentOrArgumentPairHaveRecognized=0

    local _IndexOfProcessingConfiguration=0

    while [[ ! -z "$1" && $_ProcessedArgumentsCount -lt 2048 ]]; do
        if [ $SHOULD_DEBUG -eq 1 ]; then
            echo "〔调试〕： arg[${_ProcessedArgumentsCount}]='$1'"
        fi

        _ProcessedArgumentsCount=$((_ProcessedArgumentsCount+1))
        _CurrentArgumentOrArgumentPairHaveRecognized=0

        # ────────────────────────────────────────────────────────────────────────────────

        _ProcessingArgumentName='--内容分割记号'
        _TemporaryArgumentValue=''

         if [ "$1" == "${_ProcessingArgumentName}" ]; then
            _CurrentArgumentOrArgumentPairHaveRecognized=1
            shift

            if [ "$PackageConfigContentSeparator" != 'undefined' ]; then
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

            if [ "$PackageConfigContentSeparator" != 'undefined' ]; then
                Write-_吴乐川打印针对当前处理的参数的错误信息  '不应重复出现。〔2〕。'
                shift
                return
            fi

            _TemporaryArgumentValue=${1:${#_ProcessingArgumentName}+1}
            shift

            if [ "$_TemporaryArgumentValue" == '0' ]; then
                Write-_吴乐川打印针对当前处理的参数的错误信息  "给出值不合规。给出的值为 “ \e[0;33m${_TemporaryArgumentValue}\e[0;0m ” 。〔1〕。"
                return
            elif [ -z "${_TemporaryArgumentValue}" ]; then
                Write-_吴乐川打印针对当前处理的参数的错误信息  '等号（=）后面没有给出值。〔3〕。'
                return
            fi
        fi

        if [ ! -z "$_TemporaryArgumentValue" ]; then
            if [[ "${_TemporaryArgumentValue}" =~ "^[ \n\t]*$" ]]; then
                Write-_吴乐川打印针对当前处理的参数的错误信息  "给出值不合规。给出的值为 “ \e[0;33m${_TemporaryArgumentValue}\e[0;0m ” 。〔2〕。"
                return
            else
                PackageConfigContentSeparator="${_TemporaryArgumentValue}"
            fi
        fi

        # ────────────────────────────────────────────────────────────────────────────────

        _ProcessingArgumentName='--这批依赖包之依赖类别'
        _TemporaryArgumentValue=''

        if [ "$1" == "${_ProcessingArgumentName}" ]; then
            _CurrentArgumentOrArgumentPairHaveRecognized=1
            shift

            if [ "$DependenciesAreOfCateogryOfProduction" != 'undefined' ]; then
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

            if [ "$DependenciesAreOfCateogryOfProduction" != 'undefined' ]; then
                Write-_吴乐川打印针对当前处理的参数的错误信息  '不应重复出现。〔2〕。'
                shift
                return
            fi

            _TemporaryArgumentValue=${1:${#_ProcessingArgumentName}+1}
            shift

            if [ "$_TemporaryArgumentValue" == '0' ]; then
                _TemporaryArgumentValue='false'
            elif [ -z "${_TemporaryArgumentValue}" ]; then
                Write-_吴乐川打印针对当前处理的参数的错误信息  '等号（=）后面没有给出值。〔3〕。'
                return
            fi
        fi

        if [ ! -z "${_TemporaryArgumentValue}" ]; then
            if [ "${_TemporaryArgumentValue}" == '本产品拟囊括这些软件之整体或部分' ]; then
                DependenciesAreOfCateogryOfProduction='true'
            elif [ "${_TemporaryArgumentValue}" == '本产品仅会在研发阶段借助这些软件' ]; then
                DependenciesAreOfCateogryOfProduction='false'
            else
                Write-_吴乐川打印针对当前处理的参数的错误信息  '取值只能是下列之一：'
                echo -e "        '本产品拟囊括这些软件之整体或部分'"
                echo -e "        '本产品仅会在研发阶段借助这些软件'"
                echo

                return
            fi
        fi

        # ────────────────────────────────────────────────────────────────────────────────

        _ProcessingArgumentName='--应仅作仿真演练'
        _TemporaryArgumentValue=''

        if [ "$1" == "${_ProcessingArgumentName}" ]; then
            _CurrentArgumentOrArgumentPairHaveRecognized=1
            shift

            if [ "$ShouldDryRun" != 'undefined' ]; then
                Write-_吴乐川打印针对当前处理的参数的错误信息  "不应重复出现。〔1〕。已有参数将其配置为 “ \e[0;32m${ShouldDryRun}\e[0;33m ” 。"
                return
            fi

            ShouldDryRun='true'

            if [[ "$1" =~ ^- ]]; then continue; fi

            if [[ -z "$1" ]]; then continue; fi

            _TemporaryArgumentValue="$1"
            shift
        elif [[ "$1" =~ ^"${_ProcessingArgumentName}"= ]]; then
            _CurrentArgumentOrArgumentPairHaveRecognized=1

            if [ "$ShouldDryRun" != 'undefined' ]; then
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
                ShouldDryRun='true'
            else
                ShouldDryRun='false'
            fi
        fi

        # ────────────────────────────────────────────────────────────────────────────────

        _ProcessingArgumentName='--某依赖包之版本配置'
        _TemporaryArgumentValue=''

        if [ "$1" == "${_ProcessingArgumentName}" ]; then
            _CurrentArgumentOrArgumentPairHaveRecognized=1
            _IndexOfProcessingConfiguration=$((_IndexOfProcessingConfiguration+1))

            shift

            if [[ "$1" =~ ^- ]]; then
                Write-_吴乐川打印针对当前处理的依赖包原始配置参数的错误信息  '其后面没有给出值。〔1〕。'
                return
            fi

            if [ -z "$1" ]; then
                Write-_吴乐川打印针对当前处理的依赖包原始配置参数的错误信息  '其后面没有给出值。〔2〕。'
                return
            fi

            _TemporaryArgumentValue="$1"
            shift
        elif [[ "$1" =~ ^"${_ProcessingArgumentName}"= ]]; then
            _CurrentArgumentOrArgumentPairHaveRecognized=1
            _IndexOfProcessingConfiguration=$((_IndexOfProcessingConfiguration+1))

            _TemporaryArgumentValue=${1:${#_ProcessingArgumentName}+1}
            shift

            if [ -z "${_TemporaryArgumentValue}" ]; then
                Write-_吴乐川打印针对当前处理的依赖包原始配置参数的错误信息  '等号（=）后面没有给出值。〔1〕。'
                return
            fi
        fi

        if [ ! -z "${_TemporaryArgumentValue}" ]; then
            DependencyVersionConfigurations+=( "${_TemporaryArgumentValue}" )
        fi

        if [ $_CurrentArgumentOrArgumentPairHaveRecognized -eq 0 ]; then
            # echo -e "〔调试〕： while 语句循环体末尾准备 shift，\e[0;31m丢弃该参数'\e[0;97m$1\e[0;31m'\e[0;0m。"
            shift
        fi
    done

    _ProcessingArgumentName=''
    _TemporaryArgumentValue=''

    if [ "${PackageConfigContentSeparator}" == 'undefined' ]; then
        PackageConfigContentSeparator="${PACKAGE_CONFIG_CONTENT_DEFAULT_SEPARATOR}"
    fi

    if [ "${ShouldDryRun}" == 'undefined' ]; then
        ShouldDryRun='false'
    fi



    if [ $SHOULD_DEBUG -eq 1 ]; then
        echo
        echo "〔调试〕： 应仅作仿真演练：   \e[0;33m${ShouldDryRun}\e[0;0m"
        echo "〔调试〕： 依赖包均为产品级： \e[0;33m${DependenciesAreOfCateogryOfProduction}\e[0;0m"
        echo "〔调试〕： 依赖包配置的总数： \e[0;33m${#DependencyVersionConfigurations[@]}\e[0;0m"
        echo "〔调试〕： 内容分割记号：     \e[0;33m'${PackageConfigContentSeparator}'\e[0;0m"
        echo
    fi



    function Write-_吴乐川打印一条红线 {
        echo  -en  "\e[0;31m";  Write-Line-without-line-break 66;  echo  -e "\e[0;0m"
    }





    local PackageGroupA_PackageNames=()
    local PackageGroupA_PackageVersionConfigs=()
    local PackageGroupA_PackageVersionLockReasons=()
    local PackageGroupA_PackagesCount=0
    local PackageGroupA_LongestPackageNameLength=0

    local PackageGroupB_PackageNames=()
    local PackageGroupB_PackageVersionConfigs=()
    local PackageGroupB_PackageVersionLockReasons=()
    local PackageGroupB_PackagesCount=0
    local PackageGroupB_LongestPackageNameLength=0



    local _ProcessingPackageName=''
    local _ProcessingPackageVerionConfig=''
    local _ProcessingPackageVerionLockReason=''
    local _RestPartOfProcessingPackageConfig=''
    local _ProcessingPackageNameLength=0
    local _ProcessingPackageHasLockedVersionRange=0

    _IndexOfProcessingConfiguration=0

    for _ProcessingPackageConfig in "${DependencyVersionConfigurations[@]}"; do
        _IndexOfProcessingConfiguration=$((_IndexOfProcessingConfiguration+1))

        if [ $SHOULD_DEBUG -eq 1 ]; then
            echo
            Write-Line
            echo  -en "〔调试〕： 依赖包 [$_IndexOfProcessingConfiguration] 之配置：  "
            echo  -e  "\"\e[0;30;42m${_ProcessingPackageConfig}\e[0;0m\""
            Write-Line
        fi



        read _RestPartOfProcessingPackageConfig <<< "${_ProcessingPackageConfig}" # 可截去剩余部分的首尾空白。

        _ProcessingPackageName="${_RestPartOfProcessingPackageConfig%%${PackageConfigContentSeparator}*}"

        read _RestPartOfProcessingPackageConfig <<< "${_RestPartOfProcessingPackageConfig:${#_ProcessingPackageName}+${#PackageConfigContentSeparator}}" # 可截去剩余部分的首尾空白。

        _ProcessingPackageVerionConfig="${_RestPartOfProcessingPackageConfig%%${PackageConfigContentSeparator}*}"

        read _RestPartOfProcessingPackageConfig <<< "${_RestPartOfProcessingPackageConfig:${#_ProcessingPackageVerionConfig}+${#PackageConfigContentSeparator}}" # 可截去剩余部分的首尾空白。

        read _ProcessingPackageName             <<< "${_ProcessingPackageName}"             # 可截去【包名】的首尾空白。
        read _ProcessingPackageVerionConfig     <<< "${_ProcessingPackageVerionConfig}"     # 可截去【版本配置】的首尾空白。
        read _ProcessingPackageVerionLockReason <<< "${_RestPartOfProcessingPackageConfig}" # 可截去【版本设限之原因】的首尾空白。




        if [[ ! "$_ProcessingPackageName" =~ ^(@[a-z][a-z0-9_-]*\/)?[a-z][a-z0-9_-]*$ ]]; then
            echo
            Write-_吴乐川打印一条红线
            echo -e "\e[0;31m第 \e[0;96m${_IndexOfProcessingConfiguration}\e[0;31m 个依赖包的名称不合规。该名称为 \"\e[0;97m${_ProcessingPackageName}\e[0;31m\" 。\e[0;0m"
            Write-_吴乐川打印一条红线
            echo

            return
        fi



        if [ "$_ProcessingPackageVerionConfig" == '0' ]; then

            _ProcessingPackageVerionConfig='^0'

        elif [ -z "${_ProcessingPackageVerionConfig}" ] || [[ "${_ProcessingPackageVerionConfig}" =~ ^\$?null$ ]]; then

            _ProcessingPackageVerionConfig='latest'

        fi

        _ProcessingPackageHasLockedVersionRange=1
        if [ "${_ProcessingPackageVerionConfig}" == 'latest' ]; then
            _ProcessingPackageHasLockedVersionRange=0
        fi





        if [ $_ProcessingPackageHasLockedVersionRange -eq 0 ] && [ ! -z "$_ProcessingPackageVerionLockReason" ]; then
            echo
            Write-_吴乐川打印一条红线
            echo  -e  "\e[0;31m解析【npm 软件包版本配置】时，发行某配置有误。\e[0;0m"
            Write-_吴乐川打印一条红线

            echo  -e  "  \e[0;31m依赖包\e[0;0m"
            echo  -e  "      \e[0;31m“ \e[0;33m${_ProcessingPackageName}\e[0;31m ”\e[0;0m"
            echo  -e  "  \e[0;31m并未锁定安装版本之范围，却给出了相关原因。这不合规。\e[0;0m"
            echo  -e  "  \e[0;31m凡不锁定版本的软件无所谓“版本锁定之原因”。\e[0;0m"
            echo

            echo  -e  "  \e[0;31m给出的所谓“原因”如下：\e[0;0m"
            echo  -e  "      \"\e[0;33m${_ProcessingPackageVerionLockReason}\e[0;0m\""

            echo  -e
            echo  -e  "  \e[0;31m务必删去这一讲述“原因”的措辞。\e[0;0m"

            Write-_吴乐川打印一条红线
            echo

            return
        fi

        if [ $_ProcessingPackageHasLockedVersionRange -eq 0 ]; then
            _ProcessingPackageVerionLockReason='版本并未设限。故谈不上什么原因。'
        fi





        _ProcessingPackageNameLength=${#_ProcessingPackageName}

        if [ $_ProcessingPackageHasLockedVersionRange -eq 0 ]; then
            PackageGroupA_PackageNames+=( "${_ProcessingPackageName}" )
            PackageGroupA_PackageVersionConfigs+=( "${_ProcessingPackageVerionConfig}" )
            PackageGroupA_PackageVersionLockReasons+=( "${_ProcessingPackageVerionLockReason}" )

            if [ $_ProcessingPackageNameLength -gt $PackageGroupA_LongestPackageNameLength ]; then
                PackageGroupA_LongestPackageNameLength=$_ProcessingPackageNameLength
            fi
        else
            PackageGroupB_PackageNames+=( "${_ProcessingPackageName}" )
            PackageGroupB_PackageVersionConfigs+=( "${_ProcessingPackageVerionConfig}" )
            PackageGroupB_PackageVersionLockReasons+=( "${_ProcessingPackageVerionLockReason}" )

            if [ $_ProcessingPackageNameLength -gt $PackageGroupB_LongestPackageNameLength ]; then
                PackageGroupB_LongestPackageNameLength=$_ProcessingPackageNameLength
            fi
        fi





        if [ $SHOULD_DEBUG -eq 1 ]; then
            echo  -e   "〔调试〕：               \e[0;92m包名\e[0;0m： \e[0;91m\"\e[0;93m${_ProcessingPackageName}\e[0;91m\"\e[0;0m"
            echo  -e   "〔调试〕：           \e[0;92m版本配置\e[0;0m： \e[0;91m\"\e[0;93m${_ProcessingPackageVerionConfig}\e[0;91m\"\e[0;0m"
            echo  -e   "〔调试〕：     \e[0;92m版本设限之原因\e[0;0m： \e[0;91m\"\e[0;93m${_ProcessingPackageVerionLockReason}\e[0;91m\"\e[0;0m"

            echo  -en  "〔调试〕：               \e[0;92m归类\e[0;0m： \e[0;91m\"\e[0;0m"
            if [ $_ProcessingPackageHasLockedVersionRange -eq 0 ]; then
                echo  -en  "\e[0;93m甲类\e[0;0m"
            else
                echo  -en  "\e[0;93m乙类\e[0;0m"
            fi
            echo  -e   "\e[0;91m\"\e[0;0m"

            Write-Line
            echo
            echo
        fi
    done



    PackageGroupA_PackagesCount=${#PackageGroupA_PackageNames[@]}
    PackageGroupB_PackagesCount=${#PackageGroupB_PackageNames[@]}



    if [ $SHOULD_DEBUG -eq 1 ]; then
        echo
        echo  -e  "〔调试〕： 甲类依赖包共计 \e[0;33m${PackageGroupA_PackagesCount}\e[0;0m 个。"
        echo  -e  "〔调试〕： 乙类依赖包共计 \e[0;33m${PackageGroupB_PackagesCount}\e[0;0m 个。"
        echo
        echo  -e  "〔调试〕： 甲类依赖包名称最长者，名称长度为 \e[0;33m${PackageGroupA_LongestPackageNameLength}\e[0;0m"
        echo  -e  "〔调试〕： 乙类依赖包名称最长者，名称长度为 \e[0;33m${PackageGroupB_LongestPackageNameLength}\e[0;0m"
        echo
    fi





    local _LONG_ENOUGH_WHITE_SPACES_TEXT=''
    local _temp_looping_index

    for _temp_looping_index in {1..319}; do _LONG_ENOUGH_WHITE_SPACES_TEXT+=' '; done
    # if [ $SHOULD_DEBUG -eq 1 ]; then
    #     echo
    #     echo  -e  "〔调试〕： 够长够用的全空白文本：\"\e[0;43m${_LONG_ENOUGH_WHITE_SPACES_TEXT}\e[0;0m\""
    #     echo
    # fi

    local _GlobalIndentation="${_LONG_ENOUGH_WHITE_SPACES_TEXT:0:4}"





    local PackageGroupA_CommandLineSnippet_PerPackage=()
    local PackageGroupA_Descriptions_PerPackage=()

    local PackageGroupB_CommandLineSnippet_PerPackage=()
    local PackageGroupB_Descriptions_PerPackage=()





    local _ColorOf_PacakgeName=''
    local _ColorOf_AtSign=''
    local _ColorOf_VersionConfig=''

    local _ProcessingPackageIsLastOneInTheGroup=0
    local _ProcessingPackageNamePaddingLength=0
    local _ProcessingPackageNamePaddingText=''
    local _ProcessingPackageDescription=''
    local _ProcessingPackageCommandLineSnippet=''
    local _ProcessingPackageCommandLineSnippet_Colorful=''



    function Write-_吴乐川为方框打印一段水平边线 {
        if [[ ! "$1" =~ ^[1-9][0-9]*$ ]]; then
            return
        fi

        local _temp_looping_index=0
        for ((_temp_looping_index=0; _temp_looping_index<$1; _temp_looping_index++)); do
            echo -n '═'
        done
    }



    _ColorOf_PacakgeName='\e[0;42;30m'
    _ColorOf_AtSign='\e[0;46;30m'
    _ColorOf_VersionConfig='\e[0;44;30m'

    _IndexOfProcessingConfiguration=0

    for _ProcessingPackageName in "${PackageGroupA_PackageNames[@]}"; do
        if [ $((PackageGroupA_PackagesCount-_IndexOfProcessingConfiguration)) -gt 1 ]; then
            _ProcessingPackageIsLastOneInTheGroup=0
        else
            _ProcessingPackageIsLastOneInTheGroup=1
        fi

        _ProcessingPackageNameLength=${#_ProcessingPackageName}

        _ProcessingPackageVerionConfig=${PackageGroupA_PackageVersionConfigs[${_IndexOfProcessingConfiguration}]}
        # _ProcessingPackageVerionLockReason=${PackageGroupA_PackageVersionLockReasons[${_IndexOfProcessingConfiguration}]}

        _ProcessingPackageNamePaddingLength=$((PackageGroupA_LongestPackageNameLength-_ProcessingPackageNameLength))
        _ProcessingPackageNamePaddingText="${_LONG_ENOUGH_WHITE_SPACES_TEXT:0:$_ProcessingPackageNamePaddingLength}"

        _ProcessingPackageCommandLineSnippet="${_ProcessingPackageName}@${_ProcessingPackageVerionConfig}"
        _ProcessingPackageCommandLineSnippet_Colorful="${_ProcessingPackageNamePaddingText}${_ColorOf_PacakgeName}${_ProcessingPackageName}${_ColorOf_AtSign}@${_ColorOf_VersionConfig}${_ProcessingPackageVerionConfig}\e[0;0m"

        _ProcessingPackageDescription=''

        _ProcessingPackageDescription+="${_GlobalIndentation}${_ProcessingPackageCommandLineSnippet_Colorful}"

        if [ $_ProcessingPackageIsLastOneInTheGroup -eq 0 ]; then
            _ProcessingPackageDescription+=' \'
        else
            _ProcessingPackageDescription+=';'
        fi

        PackageGroupA_CommandLineSnippet_PerPackage+=( "${_ProcessingPackageCommandLineSnippet}" )
        PackageGroupA_Descriptions_PerPackage+=( "${_ProcessingPackageDescription}" )

        if [ $SHOULD_DEBUG -eq 1 ]; then
            echo  -e  "〔调试〕： 甲类包的命令行片段： ${_ProcessingPackageCommandLineSnippet_Colorful}"
        fi

        _IndexOfProcessingConfiguration=$((_IndexOfProcessingConfiguration+1))
    done





    if [ $SHOULD_DEBUG -eq 1 ]; then
        echo
    fi





    _ColorOf_PacakgeName='\e[0;103;30m'
    _ColorOf_AtSign='\e[0;43;30m'
    _ColorOf_VersionConfig='\e[0;101;30m'

    _IndexOfProcessingConfiguration=0

    local _DescriptionFrameWidthInHanCharsCount=30
    local _DescriptionContentLineMaxHanCharsCount=$((_DescriptionFrameWidthInHanCharsCount-1-1-2-1))
    local _DescriptionFrameWidthInEnglishCharsCount=$((_DescriptionFrameWidthInHanCharsCount*2))
    local _DescriptionFrameInnerWidth1=$((PackageGroupB_LongestPackageNameLength-3))
    local _DescriptionFrameInnerWidth2=$((_DescriptionFrameWidthInEnglishCharsCount-3-$_DescriptionFrameInnerWidth1))
    local _DescriptionContentPerLineTextsArray
    local _DescriptionContentProcessingLineText=''
    local _DescriptionContentProcessingLineLength=0
    local _DescriptionContentProcessingLinePaddingCount=0
    local _DescriptionContentProcessingLinePaddingTextAndTailFrame=''

    local _IFS_BACKUP_="$IFS"

    for _ProcessingPackageName in "${PackageGroupB_PackageNames[@]}"; do
        if [ $((PackageGroupB_PackagesCount-_IndexOfProcessingConfiguration)) -gt 1 ]; then
            _ProcessingPackageIsLastOneInTheGroup=0
        else
            _ProcessingPackageIsLastOneInTheGroup=1
        fi

        _ProcessingPackageNameLength=${#_ProcessingPackageName}

        _ProcessingPackageVerionConfig=${PackageGroupB_PackageVersionConfigs[${_IndexOfProcessingConfiguration}]}
        _ProcessingPackageVerionLockReason=${PackageGroupB_PackageVersionLockReasons[${_IndexOfProcessingConfiguration}]}

        _ProcessingPackageNamePaddingLength=$((PackageGroupB_LongestPackageNameLength-_ProcessingPackageNameLength))
        _ProcessingPackageNamePaddingText="${_LONG_ENOUGH_WHITE_SPACES_TEXT:0:$_ProcessingPackageNamePaddingLength}"

        _ProcessingPackageCommandLineSnippet="${_ProcessingPackageName}@${_ProcessingPackageVerionConfig}"
        _ProcessingPackageCommandLineSnippet_Colorful="${_ProcessingPackageNamePaddingText}${_ColorOf_PacakgeName}${_ProcessingPackageName}${_ColorOf_AtSign}@${_ColorOf_VersionConfig}${_ProcessingPackageVerionConfig}\e[0;0m"

        # ╔╦╗═╬╚╩╝║

        _ProcessingPackageDescription=''

        _ProcessingPackageDescription+="\n${_GlobalIndentation}\e[0;36m# ╔$(Write-_吴乐川为方框打印一段水平边线 ${_DescriptionFrameInnerWidth1})╦$(Write-_吴乐川为方框打印一段水平边线 ${_DescriptionFrameInnerWidth2})╗\e[0;0m"

        for _temp_looping_index in {1..2}; do
            _ProcessingPackageDescription+="\n${_GlobalIndentation}\e[0;36m# ║${_LONG_ENOUGH_WHITE_SPACES_TEXT:0:${_DescriptionFrameInnerWidth1}}║${_LONG_ENOUGH_WHITE_SPACES_TEXT:0:${_DescriptionFrameInnerWidth2}}║\e[0;0m"
        done

        for _temp_looping_index in {1..1}; do
            _ProcessingPackageDescription+="\n${_GlobalIndentation}\e[0;36m# ║${_LONG_ENOUGH_WHITE_SPACES_TEXT:0:${_DescriptionFrameInnerWidth1}} ${_LONG_ENOUGH_WHITE_SPACES_TEXT:0:${_DescriptionFrameInnerWidth2}}║\e[0;0m"
        done

        _ProcessingPackageDescription+="\n${_GlobalIndentation}\e[0;36m# ║ 该软件锁定版本范围之原因：${_LONG_ENOUGH_WHITE_SPACES_TEXT:0:${_DescriptionFrameWidthInEnglishCharsCount}-29}║\e[0;0m"

        # ────────────────────────────────────────────────────────────────────────────────

        if false; then
            _ProcessingPackageDescription+="\n${_GlobalIndentation}\e[0;36m# ║     ${_ProcessingPackageVerionLockReason}\e[0;0m"
        else
            # _DescriptionContentPerLineTextsArray=()

            ConvertTo-吴乐川将文本转换为多行文本_须采用接收器变量 \
                --单行等效汉字字数上限 $((_DescriptionContentLineMaxHanCharsCount)) \
                --用以接收排好版的文本的逐行文本列表的变量名 _DescriptionContentPerLineTextsArray \
                "${_ProcessingPackageVerionLockReason}"

            IFS='' # 很关键。

            for _DescriptionContentProcessingLineText in ${_DescriptionContentPerLineTextsArray[@]}; do
                if [ "$_DescriptionContentProcessingLineText" == '\n' ]; then
                    _DescriptionContentProcessingLineLength=0
                else
                    Get-吴乐川求一行文本视觉宽度等效英语字母数_须采用接收器变量  _DescriptionContentProcessingLineLength  "$_DescriptionContentProcessingLineText"
                fi

                _DescriptionContentProcessingLinePaddingCount=$((_DescriptionFrameWidthInEnglishCharsCount-2-5-1-_DescriptionContentProcessingLineLength))
                _DescriptionContentProcessingLinePaddingTextAndTailFrame=''
                if [ $_DescriptionContentProcessingLinePaddingCount -gt 0 ]; then
                    _DescriptionContentProcessingLinePaddingTextAndTailFrame="${_LONG_ENOUGH_WHITE_SPACES_TEXT:0:$_DescriptionContentProcessingLinePaddingCount} ║"
                fi

                _ProcessingPackageDescription+="\n${_GlobalIndentation}\e[0;36m# ║     ${_DescriptionContentProcessingLineText}${_DescriptionContentProcessingLinePaddingTextAndTailFrame}"
            done

            IFS="$_IFS_BACKUP_"
        fi

        # ────────────────────────────────────────────────────────────────────────────────

        _ProcessingPackageDescription+="\n${_GlobalIndentation}\e[0;36m# ╚$(Write-_吴乐川为方框打印一段水平边线 ${_DescriptionFrameInnerWidth1})╦$(Write-_吴乐川为方框打印一段水平边线 ${_DescriptionFrameInnerWidth2})╝\e[0;0m"

        _ProcessingPackageDescription+="\n${_GlobalIndentation}${_ProcessingPackageCommandLineSnippet_Colorful}"

        if [ $_ProcessingPackageIsLastOneInTheGroup -eq 0 ]; then
            _ProcessingPackageDescription+=' \'
        else
            _ProcessingPackageDescription+=';'
        fi

        PackageGroupB_CommandLineSnippet_PerPackage+=( "${_ProcessingPackageCommandLineSnippet}" )
        PackageGroupB_Descriptions_PerPackage+=( "${_ProcessingPackageDescription}" )

        if [ $SHOULD_DEBUG -eq 1 ]; then
            echo
            Write-Line
            # echo  -e  "〔调试〕： 乙类包的命令行片段： ${_ProcessingPackageCommandLineSnippet_Colorful}"
            echo  -e  "〔调试〕： 乙类包的描述片段： "
            Write-Line
            echo  -e  "${_ProcessingPackageDescription}"
        fi

        _IndexOfProcessingConfiguration=$((_IndexOfProcessingConfiguration+1))
    done





    local NPMCommand='npm'

    local NPMSubCommand=''
    local NPMFullCommandLine=''





    if [ "$DependenciesAreOfCateogryOfProduction" == 'true' ]; then
        Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_产品级_均为最晚版本  --dry-run $ShouldDryRun
    else
        Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_研发级_均为最晚版本  --dry-run $ShouldDryRun
    fi

    if [ $PackageGroupA_PackagesCount -eq 0 ]; then
        echo  -e  "暂无。"
    else
        NPMSubCommand=''
        NPMFullCommandLine=''

        if [ "$DependenciesAreOfCateogryOfProduction" == 'true' ]; then
            NPMSubCommand='i'
        else
            NPMSubCommand='i  -D'
        fi

        NPMFullCommandLine="${NPMCommand}  ${NPMSubCommand}"
        echo  -e  "\e[0;92m${NPMFullCommandLine} \\ \e[0;0m"



        _IndexOfProcessingConfiguration=0
        for _ProcessingPackageCommandLineSnippet in "${PackageGroupA_CommandLineSnippet_PerPackage[@]}"; do
            _ProcessingPackageDescription=${PackageGroupA_Descriptions_PerPackage[$_IndexOfProcessingConfiguration]}

            NPMFullCommandLine+="  ${_ProcessingPackageCommandLineSnippet}"
            echo  -e  "${_ProcessingPackageDescription}"

            _IndexOfProcessingConfiguration=$((_IndexOfProcessingConfiguration+1))
        done



        echo
        if [ "$DependenciesAreOfCateogryOfProduction" == 'true' ]; then
            echo  -e  "\e[0;31m`Write-Line`\e[0;0m"
        else
            echo  -e  "\e[0;32m`Write-Line`\e[0;0m"
        fi
        echo



        if [ $ShouldDryRun -eq 1 ]; then
            echo  -e  "   \e[0;33m【仿真演练】\e[0;0m"
            echo  -e  "    \e[0;97m${NPMFullCommandLine}\e[0;0m"
        else
            echo  "TODO 执行命令： ${NPMFullCommandLine}"
        fi
    fi



    if [ "$DependenciesAreOfCateogryOfProduction" == 'true' ]; then
        Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_产品级_均为最晚版本  --dry-run $ShouldDryRun  --is-ending
    else
        Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_研发级_均为最晚版本  --dry-run $ShouldDryRun  --is-ending
    fi

    echo -e "\e[41;97m 该功能尚未实现！\e[0;0m" # TODO





    if [ "$DependenciesAreOfCateogryOfProduction" == 'true' ]; then
        Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_产品级_均为特定版本  --dry-run $ShouldDryRun
    else
        Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_研发级_均为特定版本  --dry-run $ShouldDryRun
    fi

    if [ $PackageGroupB_PackagesCount -eq 0 ]; then
        echo  -e  "暂无。"
    else
        NPMSubCommand=''
        NPMFullCommandLine=''

        if [ "$DependenciesAreOfCateogryOfProduction" == 'true' ]; then
            NPMSubCommand='i'
        else
            NPMSubCommand='i  -D'
        fi

        NPMFullCommandLine="${NPMCommand}  ${NPMSubCommand}"
        echo  -e  "\e[0;92m${NPMFullCommandLine} \\ \e[0;0m"



        _IndexOfProcessingConfiguration=0
        for _ProcessingPackageCommandLineSnippet in "${PackageGroupB_CommandLineSnippet_PerPackage[@]}"; do
            _ProcessingPackageDescription=${PackageGroupB_Descriptions_PerPackage[$_IndexOfProcessingConfiguration]}

            NPMFullCommandLine+="  ${_ProcessingPackageCommandLineSnippet}"
            echo  -e  "${_ProcessingPackageDescription}"

            _IndexOfProcessingConfiguration=$((_IndexOfProcessingConfiguration+1))
        done



        echo
        if [ "$DependenciesAreOfCateogryOfProduction" == 'true' ]; then
            echo  -e  "\e[0;31m`Write-Line`\e[0;0m"
        else
            echo  -e  "\e[0;32m`Write-Line`\e[0;0m"
        fi
        echo



        if [ $ShouldDryRun -eq 1 ]; then
            echo  -e  "   \e[0;33m【仿真演练】\e[0;0m"
            echo  -e  "    \e[0;97m${NPMFullCommandLine}\e[0;0m"
        else
            echo  "TODO 执行命令： ${NPMFullCommandLine}"
        fi
    fi

    if [ "$DependenciesAreOfCateogryOfProduction" == 'true' ]; then
        Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_产品级_均为特定版本  --dry-run $ShouldDryRun  --is-ending
    else
        Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_研发级_均为特定版本  --dry-run $ShouldDryRun  --is-ending
    fi
}
