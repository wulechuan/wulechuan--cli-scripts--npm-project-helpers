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
    local SHOULD_DEBUG=1



    function _打印针对当前处理的参数的错误信息 {
        local ErrorMessage=$1

        echo -e "\e[0;31m在命令参数表中的 “ \e[0;97m${_ProcessingArgumentName}\e[0;31m ” 参数：\n    \e[0;33m${ErrorMessage}\e[0;0m"
    }

    function _打印针对当前处理的依赖包原始配置参数的错误信息 {
        local ErrorMessage=$1

        echo -e "\e[0;31m在命令参数表中第 \e[0;96m${_IndexOfProcessingConfiguration}\e[0;31m 次出现的 “ \e[0;97m${_ProcessingArgumentName}\e[0;31m ” 参数：\n    \e[0;33m${ErrorMessage}\e[0;0m"
    }



    local DependenciesAreOfCateogryOfProduction='undefined' # 'true' 或其它值。
    local ShouldDryRun='undefined' # 'true' 或其它值。
    local DependencyVersionConfigurations=()



    local _TemporaryArgumentValue
    local _ProcessingArgumentName
    local _IndexOfProcessingConfiguration=0
    local _ProcessedArgumentsCount=0
    local _CurrentArgumentOrArgumentPairHaveRecognized=0

    while [[ ! -z "$1" && $_ProcessedArgumentsCount -lt 2048 ]]; do
        if [ $SHOULD_DEBUG -eq 1 ]; then
            echo "〔调试〕： arg[${_ProcessedArgumentsCount}]='$1'"
        fi

        _ProcessedArgumentsCount=$((_ProcessedArgumentsCount+1))
        _CurrentArgumentOrArgumentPairHaveRecognized=0

        # ---------------------------------------------------------------

        _ProcessingArgumentName='--这批依赖包之依赖类别'
        _TemporaryArgumentValue=''

        if [ "$1" == "${_ProcessingArgumentName}" ]; then
            _CurrentArgumentOrArgumentPairHaveRecognized=1

            if [ "$DependenciesAreOfCateogryOfProduction" != 'undefined' ]; then
                _打印针对当前处理的参数的错误信息  '不应重复出现。〔1〕。'
                shift
                return
            fi

            shift

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
        elif [[ "$1" =~ ^--这批依赖包之依赖类别= ]]; then
            _CurrentArgumentOrArgumentPairHaveRecognized=1

            if [ "$DependenciesAreOfCateogryOfProduction" != 'undefined' ]; then
                _打印针对当前处理的参数的错误信息  '不应重复出现。〔2〕。'
                shift
                return
            fi

            _TemporaryArgumentValue=${1:13}
            shift

            if [ "$_TemporaryArgumentValue" == '0' ]; then
                _TemporaryArgumentValue='false'
            elif [ -z "${_TemporaryArgumentValue}" ]; then
                _打印针对当前处理的参数的错误信息  '等号（=）后面没有给出值。〔3〕。'
                return
            fi
        fi

        if [ ! -z "${_TemporaryArgumentValue}" ]; then
            if [ "${_TemporaryArgumentValue}" == '本产品拟囊括这些软件之整体或部分' ]; then
                DependenciesAreOfCateogryOfProduction='true'
            elif [ "${_TemporaryArgumentValue}" == '本产品仅会在研发阶段借助这些软件' ]; then
                DependenciesAreOfCateogryOfProduction='false'
            else
                _打印针对当前处理的参数的错误信息  '取值只能是下列之一：'
                echo -e "        '本产品拟囊括这些软件之整体或部分'"
                echo -e "        '本产品仅会在研发阶段借助这些软件'"
                echo

                return
            fi
        fi

        # ---------------------------------------------------------------

        _ProcessingArgumentName='--应仅作仿真演练'
        _TemporaryArgumentValue=''

        if [ "$1" == "${_ProcessingArgumentName}" ]; then
            _CurrentArgumentOrArgumentPairHaveRecognized=1

            if [ "$ShouldDryRun" != 'undefined' ]; then
                _打印针对当前处理的参数的错误信息  "不应重复出现。〔1〕。已有参数将其配置为 “ \e[0;32m${ShouldDryRun}\e[0;33m ” 。"
                shift
                return
            fi

            ShouldDryRun='true'
            shift

            if [[ "$1" =~ ^- ]]; then continue; fi

            if [[ -z "$1" ]]; then continue; fi

            _TemporaryArgumentValue="$1"
            shift
        elif [[ "$1" =~ ^"${_ProcessingArgumentName}"= ]]; then
            _CurrentArgumentOrArgumentPairHaveRecognized=1

            if [ "$ShouldDryRun" != 'undefined' ]; then
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
                ShouldDryRun='true'
            else
                ShouldDryRun='false'
            fi
        fi

        # ---------------------------------------------------------------

        _ProcessingArgumentName='--某依赖包之版本配置'
        _TemporaryArgumentValue=''

        if [ "$1" == "${_ProcessingArgumentName}" ]; then
            _CurrentArgumentOrArgumentPairHaveRecognized=1
            _IndexOfProcessingConfiguration=$((_IndexOfProcessingConfiguration+1))

            shift

            if [[ "$1" =~ ^- ]]; then
                _打印针对当前处理的依赖包原始配置参数的错误信息  '其后面没有给出值。〔1〕。'
                return
            fi

            if [ -z "$1" ]; then
                _打印针对当前处理的依赖包原始配置参数的错误信息  '其后面没有给出值。〔2〕。'
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
                _打印针对当前处理的依赖包原始配置参数的错误信息  '等号（=）后面没有给出值。〔1〕。'
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



    if [ $SHOULD_DEBUG -eq 1 ]; then
        echo
        echo "〔调试〕： 应仅作仿真演练:   ${ShouldDryRun}"
        echo "〔调试〕： 依赖包均为产品级: ${DependenciesAreOfCateogryOfProduction}"
        echo "〔调试〕： 依赖包配置的总数: ${#DependencyVersionConfigurations[@]}"
        echo
    fi


    function _打印一条红线 {
        echo  -en  "\e[0;31m";  Write-Line-without-line-break 66;  echo  -e "\e[0;0m"
    }


    local PackageGroupA_PackageNames=()
    local PackageGroupA_PackageVersionConfigs=()
    local PackageGroupA_PackageVersionLockReasons=()
    local PackageGroupA_LongestPackageNameLength=0

    local PackageGroupB_PackageNames=()
    local PackageGroupB_PackageVersionConfigs=()
    local PackageGroupB_PackageVersionLockReasons=()
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
            echo -e "〔调试〕： Processing Conifg [$_IndexOfProcessingConfiguration]:\n    \"\e[0;30;42m${_ProcessingPackageConfig}\e[0;0m\""
            Write-Line
        fi



        read _RestPartOfProcessingPackageConfig <<< "${_ProcessingPackageConfig}" # 可截去剩余部分的首尾空白。

        _ProcessingPackageName="${_RestPartOfProcessingPackageConfig%% ||| *}"

        read _RestPartOfProcessingPackageConfig <<< "${_RestPartOfProcessingPackageConfig:${#_ProcessingPackageName}+5}" # 可截去剩余部分的首尾空白。

        _ProcessingPackageVerionConfig="${_RestPartOfProcessingPackageConfig%% ||| *}"

        read _RestPartOfProcessingPackageConfig <<< "${_RestPartOfProcessingPackageConfig:${#_ProcessingPackageVerionConfig}+5}" # 可截去剩余部分的首尾空白。

        read _ProcessingPackageName             <<< "${_ProcessingPackageName}"             # 可截去【包名】的首尾空白。
        read _ProcessingPackageVerionConfig     <<< "${_ProcessingPackageVerionConfig}"     # 可截去【版本配置】的首尾空白。
        read _ProcessingPackageVerionLockReason <<< "${_RestPartOfProcessingPackageConfig}" # 可截去【版本设限之原因】的首尾空白。




        if [[ ! "$_ProcessingPackageName" =~ ^(@[a-z][a-z0-9_-]*\/)?[a-z][a-z0-9_-]*$ ]]; then
            echo
            _打印一条红线
            echo -e "\e[0;31m第 \e[0;96m${_IndexOfProcessingConfiguration}\e[0;31m 个依赖包的名称不合规。该名称为 \"\e[0;97m${_ProcessingPackageName}\e[0;31m\" 。\e[0;0m"
            _打印一条红线
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
            _打印一条红线
            echo  -e  "\e[0;31m解析【npm 软件包版本配置】时，发行某配置有误。\e[0;0m"
            _打印一条红线

            echo  -e  "  \e[0;31m依赖包\e[0;0m"
            echo  -e  "      \e[0;31m“ \e[0;33m${_ProcessingPackageName}\e[0;31m ”\e[0;0m"
            echo  -e  "  \e[0;31m并未锁定安装版本之范围，却给出了相关原因。这不合规。\e[0;0m"
            echo  -e  "  \e[0;31m凡不锁定版本的软件无所谓“版本锁定之原因”。\e[0;0m"
            echo

            echo  -e  "  \e[0;31m给出的所谓“原因”如下：\e[0;0m"
            echo  -e  "      \"\e[0;33m${_ProcessingPackageVerionLockReason}\e[0;0m\""

            echo  -e
            echo  -e  "  \e[0;31m务必删去这一讲述“原因”的措辞。\e[0;0m"

            _打印一条红线
            echo

            return
        fi





        if [ $SHOULD_DEBUG -eq 1 ]; then
            echo -e "〔调试〕：               \e[0;92m包名\e[0;0m： \e[0;91m\"\e[0;93m${_ProcessingPackageName}\e[0;91m\"\e[0;0m"
            echo -e "〔调试〕：           \e[0;92m版本配置\e[0;0m： \e[0;91m\"\e[0;93m${_ProcessingPackageVerionConfig}\e[0;91m\"\e[0;0m"
            echo -e "〔调试〕：     \e[0;92m版本设限之原因\e[0;0m： \e[0;91m\"\e[0;93m${_ProcessingPackageVerionLockReason}\e[0;91m\"\e[0;0m"
        fi





        _ProcessingPackageNameLength=${#_ProcessingPackageName}

        if [ $_ProcessingPackageHasLockedVersionRange -eq 0 ]; then
            PackageGroupA_PackageNames+=( "$_ProcessingPackageName" )
            PackageGroupA_PackageVersionConfigs+=( "$_ProcessingPackageVerionConfig" )
            PackageGroupA_PackageVersionLockReasons+=( "$_ProcessingPackageVerionLockReason" )

            if [ $_ProcessingPackageNameLength -gt $PackageGroupA_LongestPackageNameLength ]; then
                PackageGroupA_LongestPackageNameLength=$_ProcessingPackageNameLength
            fi
        else
            PackageGroupB_PackageNames+=( "$_ProcessingPackageName" )
            PackageGroupB_PackageVersionConfigs+=( "$_ProcessingPackageVerionConfig" )
            PackageGroupB_PackageVersionLockReasons+=( "版本并未设限。故谈不上什么原因。" )

            if [ $_ProcessingPackageNameLength -gt $PackageGroupB_LongestPackageNameLength ]; then
                PackageGroupB_LongestPackageNameLength=$_ProcessingPackageNameLength
            fi
        fi



        if [ $SHOULD_DEBUG -eq 1 ]; then
            Write-Line
            echo
            echo
        fi
    done



    if [ $SHOULD_DEBUG -eq 1 ]; then
        echo
        echo "〔调试〕： PackageGroupA_LongestPackageNameLength ${PackageGroupA_LongestPackageNameLength}"
        echo "〔调试〕： PackageGroupB_LongestPackageNameLength ${PackageGroupB_LongestPackageNameLength}"
        echo
    fi





    local PackageGroupA_Descriptions_PerPackage=()
    local PackageGroupA_CommandLineSnippet_PerPackage=()

    local PackageGroupB_Descriptions_PerPackage=()
    local PackageGroupB_CommandLineSnippet_PerPackage=()


    return





    if [ "$DependenciesAreOfCateogryOfProduction" == 'true' ]; then
        Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_产品级_均为最晚版本  --dry-run $ShouldDryRun
    else
        Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_研发级_均为最晚版本  --dry-run $ShouldDryRun
    fi

    echo -e "\e[41;97m 该功能尚未实现！\e[0;0m" # TODO





    if [ "$DependenciesAreOfCateogryOfProduction" == 'true' ]; then
        Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_产品级_均为特定版本  --dry-run $ShouldDryRun
    else
        Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_研发级_均为特定版本  --dry-run $ShouldDryRun
    fi





    if [ "$DependenciesAreOfCateogryOfProduction" == 'true' ]; then
        Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_产品级_均为最晚版本  --dry-run $ShouldDryRun  --is-ending
    else
        Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_研发级_均为最晚版本  --dry-run $ShouldDryRun  --is-ending
    fi

    echo -e "\e[41;97m 该功能尚未实现！\e[0;0m" # TODO





    if [ "$DependenciesAreOfCateogryOfProduction" == 'true' ]; then
        Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_产品级_均为特定版本  --dry-run $ShouldDryRun  --is-ending
    else
        Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_研发级_均为特定版本  --dry-run $ShouldDryRun  --is-ending
    fi

    echo -e "\e[41;97m 该功能尚未实现！\e[0;0m" # TODO
}
