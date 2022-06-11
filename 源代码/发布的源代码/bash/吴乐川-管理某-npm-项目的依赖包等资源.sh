#!/bin/bash

# if   [ -f './吴乐川-针对命令与函数的辅助工具集.sh' ]; then
#     source  './吴乐川-针对命令与函数的辅助工具集.sh'
# elif [ -f './源代码/发布的源代码/bash/吴乐川-针对命令与函数的辅助工具集.sh' ]; then
#     source  './源代码/发布的源代码/bash/吴乐川-针对命令与函数的辅助工具集.sh'
# fi

# if   [ -f './吴乐川-数据处理-文本.sh' ]; then
#     source  './吴乐川-数据处理-文本.sh'
# elif [ -f './源代码/发布的源代码/bash/吴乐川-数据处理-文本.sh' ]; then
#     source  './源代码/发布的源代码/bash/吴乐川-数据处理-文本.sh'
# fi





function Write-Line-without-line-break {
    local Count=72

    if [[ "$1" =~ ^[0-9]{1,4}$ ]]; then
        Count=$1
    fi

    local LoopIndex=0
    for ((LoopIndex=0; LoopIndex<$Count; LoopIndex++)); do echo -n '─'; done
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





function Remove-吴乐川管理某_npm_项目__删除当前文件夹下的_node_modules {
    local DisplayName='node_modules 文件夹'



    local ShouldRunThisTask
    local ShouldDryRun

    local ArgumentConfigsArray=(
        # 命令行参数名    | 变量名             | 取值之类型   | 默认值
        # ----------------------------------------------------------
        "--确应运行该任务 | ShouldRunThisTask | 标准类型_布尔 | false"
        "--应仅作仿真演练 | ShouldDryRun      | 标准类型_布尔 | false"
    )

    Read-吴乐川读取并处理某函数的参数表  --调试功能之级别 0  $*



    Write-_吴乐川打印足够的的空白行_在某任务开始前
    Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同
    if [ "$ShouldDryRun" == false ]; then
        echo  -e "\e[0;96m══════════════════ 删除 ${DisplayName} ════════════════════════════\e[0;0m"
    else
        echo  -e "\e[0;96m═══【仿真演练】═══ 删除 ${DisplayName} ════════════════════════════\e[0;0m"
    fi
    echo



    if [ "$ShouldRunThisTask" == true ]; then
        if [ -d .'/node_modules' ]; then
            if [ "$ShouldDryRun" == false ]; then
                echo  -e  "\e[0;91m正在删除 node_modules 文件夹。\e[0;0m"
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
    if [ "$ShouldDryRun" == false ]; then
        echo  -e "\e[0;96m══════════════════ 删除 ${DisplayName} ══════════════ 已结束 ══════\e[0;0m"
    else
        echo  -e "\e[0;96m═══【仿真演练】═══ 删除 ${DisplayName} ══════════════ 已结束 ══════\e[0;0m"
    fi
    Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同
    Write-_吴乐川打印足够的的空白行_在某任务结束后
}



function Remove-吴乐川管理某_npm_项目__删除当前文件夹下的_package_lock_json {
    local DisplayName='package-lock.json 文件'



    local ShouldRunThisTask
    local ShouldDryRun

    local ArgumentConfigsArray=(
        # 命令行参数名    | 变量名             | 取值之类型   | 默认值
        # ----------------------------------------------------------
        "--确应运行该任务 | ShouldRunThisTask | 标准类型_布尔 | false"
        "--应仅作仿真演练 | ShouldDryRun      | 标准类型_布尔 | false"
    )

    Read-吴乐川读取并处理某函数的参数表  --调试功能之级别 0  $*



    Write-_吴乐川打印足够的的空白行_在某任务开始前
    Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同
    if [ "$ShouldDryRun" == false ]; then
        echo  -e "\e[0;92m══════════════════ 删除 ${DisplayName} ═════════════════════════\e[0;0m"
    else
        echo  -e "\e[0;92m═══【仿真演练】═══ 删除 ${DisplayName} ═════════════════════════\e[0;0m"
    fi
    echo



    if [ "$ShouldRunThisTask" == true ]; then
        if [ -d .'/package-lock.json' ]; then
            if [ "$ShouldDryRun" == false ]; then
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
    if [ "$ShouldDryRun" == false ]; then
        echo  -e "\e[0;92m══════════════════ 删除 ${DisplayName} ═══════════ 已结束 ══════\e[0;0m"
    else
        echo  -e "\e[0;92m═══【仿真演练】═══ 删除 ${DisplayName} ═══════════ 已结束 ══════\e[0;0m"
    fi
    Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同
    Write-_吴乐川打印足够的的空白行_在某任务结束后
}



function Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_产品级_均为最晚版本 {
    local IsEnding
    local ShouldDryRun

    local ArgumentConfigsArray=(
        # 命令行参数名            | 变量名        | 取值之类型   | 默认值
        # -------------------------------------------------------------
        "--系作为该任务之结束提示语 | IsEnding     | 标准类型_布尔 | false"
        "--应仅作仿真演练          | ShouldDryRun | 标准类型_布尔 | false"
    )

    Read-吴乐川读取并处理某函数的参数表  --调试功能之级别 0  $*



    if [ "$IsEnding" == false ]; then
        Write-_吴乐川打印足够的的空白行_在某任务开始前
        Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同
        if [ "$ShouldDryRun" == false ]; then
            echo  -e  "\e[0;31m══════════════════ npm i -P 最晚版本之【产品依赖包】════════════════════\e[0;0m"
        else
            echo  -e  "\e[0;31m═══【仿真演练】═══ npm i -P 最晚版本之【产品依赖包】════════════════════\e[0;0m"
        fi
        echo
    else
        echo
        if [ "$ShouldDryRun" == false ]; then
            echo  -e  "\e[0;31m══════════════════ npm i -P 最晚版本之【产品依赖包】 ══════ 已结束 ══════\e[0;0m"
        else
            echo  -e  "\e[0;31m═══【仿真演练】═══ npm i -P 最晚版本之【产品依赖包】 ══════ 已结束 ══════\e[0;0m"
        fi
        Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同
        Write-_吴乐川打印足够的的空白行_在某任务结束后
    fi
}



function Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_产品级_均为特定版本 {
    local IsEnding
    local ShouldDryRun

    local ArgumentConfigsArray=(
        # 命令行参数名            | 变量名        | 取值之类型   | 默认值
        # -------------------------------------------------------------
        "--系作为该任务之结束提示语 | IsEnding     | 标准类型_布尔 | false"
        "--应仅作仿真演练          | ShouldDryRun | 标准类型_布尔 | false"
    )

    Read-吴乐川读取并处理某函数的参数表  --调试功能之级别 0  $*



    if [ "$IsEnding" == false ]; then
        Write-_吴乐川打印足够的的空白行_在某任务开始前
        Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同
        if [ "$ShouldDryRun" == false ]; then
            echo  -e  "\e[0;31m══════════════════ npm i -P \e[0;97;41m特定版本\e[0;31m之【产品依赖包】════════════════════\e[0;0m"
        else
            echo  -e  "\e[0;31m═══【仿真演练】═══ npm i -P \e[0;97;41m特定版本\e[0;31m之【产品依赖包】════════════════════\e[0;0m"
        fi
        echo
    else
        echo
        if [ "$ShouldDryRun" == false ]; then
            echo  -e  "\e[0;31m══════════════════ npm i -P \e[0;97;41m特定版本\e[0;31m之【产品依赖包】══════ 已结束 ══════\e[0;0m"
        else
            echo  -e  "\e[0;31m═══【仿真演练】═══ npm i -P \e[0;97;41m特定版本\e[0;31m之【产品依赖包】══════ 已结束 ══════\e[0;0m"
        fi
        Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同
        Write-_吴乐川打印足够的的空白行_在某任务结束后
    fi
}



function Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_研发级_均为最晚版本 {
    local IsEnding
    local ShouldDryRun

    local ArgumentConfigsArray=(
        # 命令行参数名            | 变量名        | 取值之类型   | 默认值
        # -------------------------------------------------------------
        "--系作为该任务之结束提示语 | IsEnding     | 标准类型_布尔 | false"
        "--应仅作仿真演练          | ShouldDryRun | 标准类型_布尔 | false"
    )

    Read-吴乐川读取并处理某函数的参数表  --调试功能之级别 0  $*



    if [ "$IsEnding" == false ]; then
        Write-_吴乐川打印足够的的空白行_在某任务开始前
        Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同
        if [ "$ShouldDryRun" == false ]; then
            echo  -e  "\e[0;32m══════════════════ npm i -D 最晚版本之【研发依赖包】════════════════════\e[0;0m"
        else
            echo  -e  "\e[0;32m═══【仿真演练】═══ npm i -D 最晚版本之【研发依赖包】════════════════════\e[0;0m"
        fi
        echo
    else
        echo
        if [ "$ShouldDryRun" == false ]; then
            echo  -e  "\e[0;32m══════════════════ npm i -D 最晚版本之【研发依赖包】══════ 已结束 ══════\e[0;0m"
        else
            echo  -e  "\e[0;32m═══【仿真演练】═══ npm i -D 最晚版本之【研发依赖包】══════ 已结束 ══════\e[0;0m"
        fi
        Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同
        Write-_吴乐川打印足够的的空白行_在某任务结束后
    fi
}



function Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_研发级_均为特定版本 {
    local IsEnding
    local ShouldDryRun

    local ArgumentConfigsArray=(
        # 命令行参数名            | 变量名        | 取值之类型   | 默认值
        # -------------------------------------------------------------
        "--系作为该任务之结束提示语 | IsEnding     | 标准类型_布尔 | false"
        "--应仅作仿真演练          | ShouldDryRun | 标准类型_布尔 | false"
    )

    Read-吴乐川读取并处理某函数的参数表  --调试功能之级别 0  $*



    if [ "$IsEnding" == false ]; then
        Write-_吴乐川打印足够的的空白行_在某任务开始前
        Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同
        if [ "$ShouldDryRun" == false ]; then
            echo  -e  "\e[0;32m══════════════════ npm i -D \e[0;30;102m特定版本\e[0;32m之【研发依赖包】════════════════════\e[0;0m"
        else
            echo  -e  "\e[0;32m═══【仿真演练】═══ npm i -D \e[0;30;102m特定版本\e[0;32m之【研发依赖包】════════════════════\e[0;0m"
        fi
        echo
    else
        echo
        if [ "$ShouldDryRun" == false ]; then
            echo  -e  "\e[0;32m══════════════════ npm i -D \e[0;30;102m特定版本\e[0;32m之【研发依赖包】══════ 已结束 ══════\e[0;0m"
        else
            echo  -e  "\e[0;32m═══【仿真演练】═══ npm i -D \e[0;30;102m特定版本\e[0;32m之【研发依赖包】══════ 已结束 ══════\e[0;0m"
        fi
        Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同
        Write-_吴乐川打印足够的的空白行_在某任务结束后
    fi
}



function Write-吴乐川管理某_npm_项目__打印提示语__更新与研发相关的数据库 {
    local IsEnding
    local ShouldDryRun

    local ArgumentConfigsArray=(
        # 命令行参数名            | 变量名        | 取值之类型   | 默认值
        # -------------------------------------------------------------
        "--系作为该任务之结束提示语 | IsEnding     | 标准类型_布尔 | false"
        "--应仅作仿真演练          | ShouldDryRun | 标准类型_布尔 | false"
    )

    Read-吴乐川读取并处理某函数的参数表  --调试功能之级别 0  $*



    if [ "$IsEnding" == false ]; then
        Write-_吴乐川打印足够的的空白行_在某任务开始前
        Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同
        if [ "$ShouldDryRun" == false ]; then
            echo  -e  "\e[0;33m══════════════════ 更新与研发相关的数据库 ══════════════════════════════\e[0;0m"
        else
            echo  -e  "\e[0;33m═══【仿真演练】═══ 更新与研发相关的数据库 ══════════════════════════════\e[0;0m"
        fi
        echo
    else
        echo
        if [ "$ShouldDryRun" == false ]; then
            echo  -e  "\e[0;33m══════════════════ 更新与研发相关的数据库 ════════════════ 已结束 ══════\e[0;0m"
        else
            echo  -e  "\e[0;33m═══【仿真演练】═══ 更新与研发相关的数据库 ════════════════ 已结束 ══════\e[0;0m"
        fi
        Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同
        Write-_吴乐川打印足够的的空白行_在某任务结束后
    fi
}



function Write-吴乐川管理某_npm_项目__打印提示语__其他交代 {
    local IsEnding
    local ShouldDryRun

    local ArgumentConfigsArray=(
        # 命令行参数名            | 变量名        | 取值之类型   | 默认值
        # -------------------------------------------------------------
        "--系作为该任务之结束提示语 | IsEnding     | 标准类型_布尔 | false"
        "--应仅作仿真演练          | ShouldDryRun | 标准类型_布尔 | false"
    )

    Read-吴乐川读取并处理某函数的参数表  --调试功能之级别 0  $*



    if [ "$IsEnding" == false ]; then
        Write-_吴乐川打印足够的的空白行_在某任务开始前
        Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同
        if [ "$ShouldDryRun" == false ]; then
            echo  -e  "\e[0;94m══════════════════ 其他交代 ════════════════════════════════════════════\e[0;0m"
        else
            echo  -e  "\e[0;94m═══【仿真演练】═══ 其他交代 ════════════════════════════════════════════\e[0;0m"
        fi
        echo
    else
        echo
        if [ "$ShouldDryRun" == false ]; then
            echo  -e  "\e[0;94m══════════════════ 其他交代 ══════════════════════════════ 已结束 ══════\e[0;0m"
        else
            echo  -e  "\e[0;94m═══【仿真演练】═══ 其他交代 ══════════════════════════════ 已结束 ══════\e[0;0m"
        fi
        Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同
        Write-_吴乐川打印足够的的空白行_在某任务结束后
    fi
}





function Update-吴乐川更新当前_npm_项目的所有依赖包 {
    local PACKAGE_CONFIG_CONTENT_DEFAULT_SEPARATOR='|::|'
    local PACKAGE_DESCRIPTION_FRAME_WIDTH_IN_HAN_CHARS_COUNT=30

    local BY_DEFAULT__SHOULD_REMOVE_NODE_MODULES_FIRST='true'
    local BY_DEFAULT__SHOULD_REMOVE_PACKAGE_LOCK_JSON_FIRST='true'



    local DebuggingLevel
    local ShouldDryRun
    local PackageConfigContentSeparator
    local NpmExtraArguments
    local NPMDependencyVersionConfigs_Produ=()
    local NPMDependencyVersionConfigs_Devel=()

    local ArgumentConfigsArray=(
        #  命令行参数名                                         | 变量名                              | 取值之类型       | 默认值
        # ----------------------------------------------------------------------------------------------------------------------------------------------------
        "--调试功能之级别                                       | DebuggingLevel                     | 标准类型_非负整数  | 0"
        "--应仅作仿真演练                                       | ShouldDryRun                       | 标准类型_布尔     | false"
        "--在安装诸依赖包之前应先删除旧有的_node_modules_文件夹     | ShouldRemoveNodeModulesFirst      | 标准类型_布尔     | ${BY_DEFAULT__SHOULD_REMOVE_NODE_MODULES_FIRST}"
        "--在安装诸依赖包之前应先删除旧有的_package-lock点json_文件 | ShouldRemovePackageLockJSONFirst  | 标准类型_布尔     | ${BY_DEFAULT__SHOULD_REMOVE_PACKAGE_LOCK_JSON_FIRST}"
        "--内容分割记号                                         | PackageConfigContentSeparator     | 标准类型_文本     | ${PACKAGE_CONFIG_CONTENT_DEFAULT_SEPARATOR}"
        "--某产品级依赖包之版本配置                               | NPMDependencyVersionConfigs_Produ | 标准类型_列表"
        "--某研发级依赖包之版本配置                               | NPMDependencyVersionConfigs_Devel | 标准类型_列表"
        "--NPM安装依赖包时须额外带上的参数序列                     | NpmExtraArguments                 | 标准类型_文本"
    )

    local LastTaskReturnCode=0

    Read-吴乐川读取并处理某函数的参数表  --调试功能之级别 0  "$@"
    LastTaskReturnCode=$?; if [ $LastTaskReturnCode -ne 0 ]; then return $LastTaskReturnCode; fi





    local _temp_looping_index=0





    # ────────────────────────────────────────────────────────────────
    #  0) 检查所有类别的所有依赖包的配置，若任一违规，则退出。
    # ────────────────────────────────────────────────────────────────

    local -a NPMDependencyCategories=(
        '本产品拟囊括这些软件之整体或部分' # npm  install  --save-prod
        '本产品仅会在研发阶段借助这些软件' # npm  install  --save-dev
    )

    local -a NPMDepPackage_ProduGroupA_PackageNames=()
    local -a NPMDepPackage_ProduGroupA_PackageVersionConfigs=()
    local -a NPMDepPackage_ProduGroupA_PackageVersionLockReasons=()
    local -a NPMDepPackage_ProduGroupA_CommandLineSnippet_PerPackage=()
    local -a NPMDepPackage_ProduGroupA_Descriptions_PerPackage=()
    local    NPMDepPackage_ProduGroupA_PackagesCount=0
    local    NPMDepPackage_ProduGroupA_LongestPackageNameLength=0

    local -a NPMDepPackage_ProduGroupB_PackageNames=()
    local -a NPMDepPackage_ProduGroupB_PackageVersionConfigs=()
    local -a NPMDepPackage_ProduGroupB_PackageVersionLockReasons=()
    local -a NPMDepPackage_ProduGroupB_CommandLineSnippet_PerPackage=()
    local -a NPMDepPackage_ProduGroupB_Descriptions_PerPackage=()
    local    NPMDepPackage_ProduGroupB_PackagesCount=0
    local    NPMDepPackage_ProduGroupB_LongestPackageNameLength=0

    local -a NPMDepPackage_DevelGroupA_PackageNames=()
    local -a NPMDepPackage_DevelGroupA_PackageVersionConfigs=()
    local -a NPMDepPackage_DevelGroupA_PackageVersionLockReasons=()
    local -a NPMDepPackage_DevelGroupA_CommandLineSnippet_PerPackage=()
    local -a NPMDepPackage_DevelGroupA_Descriptions_PerPackage=()
    local    NPMDepPackage_DevelGroupA_PackagesCount=0
    local    NPMDepPackage_DevelGroupA_LongestPackageNameLength=0

    local -a NPMDepPackage_DevelGroupB_PackageNames=()
    local -a NPMDepPackage_DevelGroupB_PackageVersionConfigs=()
    local -a NPMDepPackage_DevelGroupB_PackageVersionLockReasons=()
    local -a NPMDepPackage_DevelGroupB_CommandLineSnippet_PerPackage=()
    local -a NPMDepPackage_DevelGroupB_Descriptions_PerPackage=()
    local    NPMDepPackage_DevelGroupB_PackagesCount=0
    local    NPMDepPackage_DevelGroupB_LongestPackageNameLength=0



    local    _PackagesCountOfProcessingCategory=0

    local    _ProcessingPackageConfig_Index=0
    local    _ProcessingPackageConfig=''
    local    _ProcessingPackageConfig_RestPart=''

    local    _ProcessingPackage_Name=''
    local    _ProcessingPackage_NameLength=0
    local    _ProcessingPackage_VerionConfig=''
    local    _ProcessingPackage_HasLockedVersionRange=0
    local    _ProcessingPackage_VerionLockReason=''

    function Write-_吴乐川打印一条红线 {
        echo  -en  "\e[0;31m";  Write-Line-without-line-break 66;  echo  -e "\e[0;0m"
    }

    for NPMDependencyCategory in ${NPMDependencyCategories[@]}; do
        _DependencyVersionConfigurations=()

        if   [ "$NPMDependencyCategory" == '本产品拟囊括这些软件之整体或部分' ]; then
            _PackagesCountOfProcessingCategory=${#NPMDependencyVersionConfigs_Produ[@]}
        elif [ "$NPMDependencyCategory" == '本产品仅会在研发阶段借助这些软件' ]; then
            _PackagesCountOfProcessingCategory=${#NPMDependencyVersionConfigs_Devel[@]}
        else
            _PackagesCountOfProcessingCategory=0
        fi

        for ((_ProcessingPackageConfig_Index=0; _ProcessingPackageConfig_Index<_PackagesCountOfProcessingCategory; _ProcessingPackageConfig_Index++)); do
            if   [ "$NPMDependencyCategory" == '本产品拟囊括这些软件之整体或部分' ]; then
                _ProcessingPackageConfig=${NPMDependencyVersionConfigs_Produ[$_ProcessingPackageConfig_Index]}
            elif [ "$NPMDependencyCategory" == '本产品仅会在研发阶段借助这些软件' ]; then
                _ProcessingPackageConfig=${NPMDependencyVersionConfigs_Devel[$_ProcessingPackageConfig_Index]}
            else
                break
            fi

            if [ $DebuggingLevel -ge 1 ]; then
                echo
                Write-Line
                echo  -en "〔调试〕： 依赖包 [$_ProcessingPackageConfig_Index] 之配置：  "
                echo  -e  "\"\e[0;30;42m${_ProcessingPackageConfig}\e[0;0m\""
                Write-Line
            fi



            read  -r  _ProcessingPackageConfig_RestPart <<< ${_ProcessingPackageConfig} # 此举可截去剩余部分的首尾空白。

            _ProcessingPackage_Name="${_ProcessingPackageConfig_RestPart%%${PackageConfigContentSeparator}*}"

            read  -r  _ProcessingPackageConfig_RestPart <<< ${_ProcessingPackageConfig_RestPart:${#_ProcessingPackage_Name}+${#PackageConfigContentSeparator}} # 此举可截去剩余部分的首尾空白。

            _ProcessingPackage_VerionConfig="${_ProcessingPackageConfig_RestPart%%${PackageConfigContentSeparator}*}"

            read  -r  _ProcessingPackageConfig_RestPart <<< ${_ProcessingPackageConfig_RestPart:${#_ProcessingPackage_VerionConfig}+${#PackageConfigContentSeparator}} # 此举可截去剩余部分的首尾空白。

            read  -r  _ProcessingPackage_Name             <<< ${_ProcessingPackage_Name}             # 此举可截去【包名】的首尾空白。
            read  -r  _ProcessingPackage_VerionConfig     <<< ${_ProcessingPackage_VerionConfig}     # 此举可截去【版本配置】的首尾空白。
            read  -r  _ProcessingPackage_VerionLockReason <<< ${_ProcessingPackageConfig_RestPart} # 此举可截去【版本设限之原因】的首尾空白。



            if [[ ! "$_ProcessingPackage_Name" =~ ^(@[a-z][a-z0-9_-]*\/)?[a-z][a-z0-9_-]*$ ]]; then
                echo
                Write-_吴乐川打印一条红线
                echo -e "\e[0;31m第 \e[0;96m${_ProcessingPackageConfig_Index}\e[0;31m 个依赖包的名称不合规。该名称为 \"\e[0;97m${_ProcessingPackage_Name}\e[0;31m\" 。\e[0;0m"
                Write-_吴乐川打印一条红线
                echo

                return 21
            fi



            if [ "$_ProcessingPackage_VerionConfig" == '0' ]; then

                _ProcessingPackage_VerionConfig='^0'

            elif [ -z "${_ProcessingPackage_VerionConfig}" ] || [[ "${_ProcessingPackage_VerionConfig}" =~ ^\$?null$ ]]; then

                _ProcessingPackage_VerionConfig='latest'

            fi

            _ProcessingPackage_HasLockedVersionRange=1
            if [ "${_ProcessingPackage_VerionConfig}" == 'latest' ]; then
                _ProcessingPackage_HasLockedVersionRange=0
            fi





            if [ $_ProcessingPackage_HasLockedVersionRange -eq 0 ]; then
                if [ ! -z "$_ProcessingPackage_VerionLockReason" ]; then
                    echo
                    Write-_吴乐川打印一条红线
                    echo  -e  "\e[0;31m解析【npm 软件包版本配置】时，发行某配置有误。\e[0;0m"
                    Write-_吴乐川打印一条红线

                    echo  -e  "  \e[0;31m依赖包\e[0;0m"
                    echo  -e  "      \e[0;31m“ \e[0;33m${_ProcessingPackage_Name}\e[0;31m ”\e[0;0m"
                    echo  -e  "  \e[0;31m并未锁定安装版本之范围，却给出了相关原因。这不合规。\e[0;0m"
                    echo  -e  "  \e[0;31m凡不锁定版本的软件无所谓“版本锁定之原因”。\e[0;0m"
                    echo

                    echo  -e  "  \e[0;31m给出的所谓“原因”如下：\e[0;0m"
                    echo  -e  "      \"\e[0;33m${_ProcessingPackage_VerionLockReason}\e[0;0m\""

                    echo  -e
                    echo  -e  "  \e[0;31m务必删去这一讲述“原因”的措辞。\e[0;0m"

                    Write-_吴乐川打印一条红线
                    echo

                    return 22
                fi

                _ProcessingPackage_VerionLockReason='~~~ 版本并未设限。故谈不上什么原因。 ~~~'
            fi





            _ProcessingPackage_NameLength=${#_ProcessingPackage_Name}

            if [ $_ProcessingPackage_HasLockedVersionRange -eq 0 ]; then
                if   [ "$NPMDependencyCategory" == '本产品拟囊括这些软件之整体或部分' ]; then
                    NPMDepPackage_ProduGroupA_PackageNames+=( "${_ProcessingPackage_Name}" )
                    NPMDepPackage_ProduGroupA_PackageVersionConfigs+=( "${_ProcessingPackage_VerionConfig}" )
                    NPMDepPackage_ProduGroupA_PackageVersionLockReasons+=( "${_ProcessingPackage_VerionLockReason}" )

                    if [ $_ProcessingPackage_NameLength -gt $NPMDepPackage_ProduGroupA_LongestPackageNameLength ]; then
                        NPMDepPackage_ProduGroupA_LongestPackageNameLength=$_ProcessingPackage_NameLength
                    fi
                elif [ "$NPMDependencyCategory" == '本产品仅会在研发阶段借助这些软件' ]; then
                    NPMDepPackage_DevelGroupA_PackageNames+=( "${_ProcessingPackage_Name}" )
                    NPMDepPackage_DevelGroupA_PackageVersionConfigs+=( "${_ProcessingPackage_VerionConfig}" )
                    NPMDepPackage_DevelGroupA_PackageVersionLockReasons+=( "${_ProcessingPackage_VerionLockReason}" )

                    if [ $_ProcessingPackage_NameLength -gt $NPMDepPackage_DevelGroupA_LongestPackageNameLength ]; then
                        NPMDepPackage_DevelGroupA_LongestPackageNameLength=$_ProcessingPackage_NameLength
                    fi
                fi
            else
                if   [ "$NPMDependencyCategory" == '本产品拟囊括这些软件之整体或部分' ]; then
                    NPMDepPackage_ProduGroupB_PackageNames+=( "${_ProcessingPackage_Name}" )
                    NPMDepPackage_ProduGroupB_PackageVersionConfigs+=( "${_ProcessingPackage_VerionConfig}" )
                    NPMDepPackage_ProduGroupB_PackageVersionLockReasons+=( "${_ProcessingPackage_VerionLockReason}" )

                    if [ $_ProcessingPackage_NameLength -gt $NPMDepPackage_ProduGroupB_LongestPackageNameLength ]; then
                        NPMDepPackage_ProduGroupB_LongestPackageNameLength=$_ProcessingPackage_NameLength
                    fi
                elif [ "$NPMDependencyCategory" == '本产品仅会在研发阶段借助这些软件' ]; then
                    NPMDepPackage_DevelGroupB_PackageNames+=( "${_ProcessingPackage_Name}" )
                    NPMDepPackage_DevelGroupB_PackageVersionConfigs+=( "${_ProcessingPackage_VerionConfig}" )
                    NPMDepPackage_DevelGroupB_PackageVersionLockReasons+=( "${_ProcessingPackage_VerionLockReason}" )

                    if [ $_ProcessingPackage_NameLength -gt $NPMDepPackage_DevelGroupB_LongestPackageNameLength ]; then
                        NPMDepPackage_DevelGroupB_LongestPackageNameLength=$_ProcessingPackage_NameLength
                    fi
                fi
            fi





            if [ $DebuggingLevel -ge 1 ]; then
                if   [ "$NPMDependencyCategory" == '本产品拟囊括这些软件之整体或部分' ]; then
                echo  -e   "〔调试〕： \e[0;92m依赖类别\e[0;0m： \e[0;91m\"\e[0;93m产品级\e[0;91m\"\e[0;0m"
                elif [ "$NPMDependencyCategory" == '本产品仅会在研发阶段借助这些软件' ]; then
                echo  -e   "〔调试〕： \e[0;92m依赖类别\e[0;0m： \e[0;91m\"\e[0;93m研发级\e[0;91m\"\e[0;0m"
                fi

                echo  -e   "〔调试〕：               \e[0;92m包名\e[0;0m： \e[0;91m\"\e[0;93m${_ProcessingPackage_Name}\e[0;91m\"\e[0;0m"
                echo  -e   "〔调试〕：           \e[0;92m版本配置\e[0;0m： \e[0;91m\"\e[0;93m${_ProcessingPackage_VerionConfig}\e[0;91m\"\e[0;0m"
                echo  -e   "〔调试〕：     \e[0;92m版本设限之原因\e[0;0m： \e[0;91m\"\e[0;93m${_ProcessingPackage_VerionLockReason}\e[0;91m\"\e[0;0m"

                echo  -en  "〔调试〕：               \e[0;92m归类\e[0;0m： \e[0;91m\"\e[0;0m"
                if [ $_ProcessingPackage_HasLockedVersionRange -eq 0 ]; then
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
    done
    LastTaskReturnCode=$?; if [ $LastTaskReturnCode -ne 0 ]; then return $LastTaskReturnCode; fi



    NPMDepPackage_ProduGroupA_PackagesCount=${#NPMDepPackage_ProduGroupA_PackageNames[@]}
    NPMDepPackage_ProduGroupB_PackagesCount=${#NPMDepPackage_ProduGroupB_PackageNames[@]}

    NPMDepPackage_DevelGroupA_PackagesCount=${#NPMDepPackage_DevelGroupA_PackageNames[@]}
    NPMDepPackage_DevelGroupB_PackagesCount=${#NPMDepPackage_DevelGroupB_PackageNames[@]}

    if [ $DebuggingLevel -ge 1 ]; then
        echo
        echo  -e  "〔调试〕： 产品级甲类依赖包共计 \e[0;33m${NPMDepPackage_ProduGroupA_PackagesCount}\e[0;0m 个。"
        echo  -e  "〔调试〕： 产品级乙类依赖包共计 \e[0;33m${NPMDepPackage_ProduGroupB_PackagesCount}\e[0;0m 个。"
        echo
        echo  -e  "〔调试〕： 产品级甲类依赖包名称最长者，名称长度为 \e[0;33m${NPMDepPackage_ProduGroupA_LongestPackageNameLength}\e[0;0m"
        echo  -e  "〔调试〕： 产品级乙类依赖包名称最长者，名称长度为 \e[0;33m${NPMDepPackage_ProduGroupB_LongestPackageNameLength}\e[0;0m"
        echo
        echo
        echo  -e  "〔调试〕： 研发级甲类依赖包共计 \e[0;33m${NPMDepPackage_DevelGroupA_PackagesCount}\e[0;0m 个。"
        echo  -e  "〔调试〕： 研发级乙类依赖包共计 \e[0;33m${NPMDepPackage_DevelGroupB_PackagesCount}\e[0;0m 个。"
        echo
        echo  -e  "〔调试〕： 研发级甲类依赖包名称最长者，名称长度为 \e[0;33m${NPMDepPackage_DevelGroupA_LongestPackageNameLength}\e[0;0m"
        echo  -e  "〔调试〕： 研发级乙类依赖包名称最长者，名称长度为 \e[0;33m${NPMDepPackage_DevelGroupB_LongestPackageNameLength}\e[0;0m"
        echo
    fi





    local _LONG_ENOUGH_WHITE_SPACES_TEXT=''

    for _temp_looping_index in {1..515}; do _LONG_ENOUGH_WHITE_SPACES_TEXT+=' '; done
    # if [ $DebuggingLevel -ge 2 ]; then
    #     echo
    #     echo  -e  "〔调试〕： 够长够用的全空白文本：\"\e[0;43m${_LONG_ENOUGH_WHITE_SPACES_TEXT}\e[0;0m\""
    #     echo
    # fi

    local GLOBAL_INDENTATION="${_LONG_ENOUGH_WHITE_SPACES_TEXT:0:4}"

    local PerPackageDescription_ContentLineMaxHanCharsCount=$((PACKAGE_DESCRIPTION_FRAME_WIDTH_IN_HAN_CHARS_COUNT-1-1-2-1))
    local PerPackageDescription_FrameWidthInEnglishCharsCount=$((PACKAGE_DESCRIPTION_FRAME_WIDTH_IN_HAN_CHARS_COUNT*2))

    local PerPackageDescription_ShouldUseArrayForReceiveingFormattedTexts='true'
    local PerPackageDescription_ContentPerLineTextVarsNamePrefix='_DescriptionContentTextOfLine_'
    local PerPackageDescription_ContentPerLineTextVarsCount=0 # 0 代表关闭该功能。也不会初始化一系列 local 变量。整数代表开启该功能，但为求稳妥，应令取值足够大，例如取 200 。拟取 319 。

    if [[ ! "$PerPackageDescription_ContentPerLineTextVarsCount" =~ ^[0-9]*$ ]]; then
        echo  -e  "\e[0;91m在函数\n    “ \e[0;97m${FUNCNAME[0]}\e[0;91m ”\n中：\e[0;0m"
        echo  -e  "\e[0;91m变量\n    “ \e[0;97mPerPackageDescription_ContentPerLineTextVarsCount\e[0;91m ”\n取值不合规。\n须取正整数。给出的值却是 “ \e[0;33m${PerPackageDescription_ContentPerLineTextVarsCount}\e[0;91m ”。\e[0;0m"
        echo
        echo
        return 41
    fi





    local -a NPMDepPackage_GroupIDs=(
        'A' # 不限定版本范围
        'B' # 限度了范本范围
    )

    function Write-_吴乐川为方框打印一段水平边线 {
        if [[ ! "$1" =~ ^[1-9][0-9]*$ ]]; then
            return 1
        fi

        local _temp_looping_index=0
        for ((_temp_looping_index=0; _temp_looping_index<$1; _temp_looping_index++)); do
            echo -n '═'
        done
    }



    local    _ProcessingGroupID=''

    local    _ProcessingGroup_PackagesCount=0
    local    _ProcessingGroup_LongestPackageNameLength=0
    local    _ProcessingGroup_DescriptionFrameInnerWidth1=0
    local    _ProcessingGroup_DescriptionFrameInnerWidth2=0

    local    _ProcessingPackage_Index=0
    local    _ProcessingPackage_IsLastOneInTheGroup='false'
    local    _ProcessingPackage_NamePaddingLength=0
    local    _ProcessingPackage_NamePaddingText=''
    local    _ProcessingPackage_Description=''
    local    _ProcessingPackage_CommandLineSnippet=''
    local    _ProcessingPackage_CommandLineSnippet_Colorful=''

    local    _ShouldBuildAndPrintDescriptionPerPacakge='false'

    local -a _ProcessingPackage_DescriptionContentPerLineTextsArray

    local    _PerPackageDescription_ContentLineLoopIndex=0
    local    _PerPackageDescription_ContentLinesCount=0

    local    _PerPackageDescription_ProcessingLineText=''
    local    _PerPackageDescription_ProcessingLineLength=0
    local    _PerPackageDescription_ProcessingLinePaddingCount=0
    local    _PerPackageDescription_ProcessingLinePaddingTextAndTailFrame=''

    local    _ColorOf_PacakgeName=''
    local    _ColorOf_AtSign=''
    local    _ColorOf_VersionConfig=''



    for NPMDependencyCategory in ${NPMDependencyCategories[@]}; do

        if   [ "$NPMDependencyCategory" == '本产品拟囊括这些软件之整体或部分' ]; then
            :
        elif [ "$NPMDependencyCategory" == '本产品仅会在研发阶段借助这些软件' ]; then
            :
        else
            continue
        fi



        for _ProcessingGroupID in ${NPMDepPackage_GroupIDs[@]}; do

            if   [ "$_ProcessingGroupID" == 'A' ]; then

                _ShouldBuildAndPrintDescriptionPerPacakge='false'

                _ColorOf_PacakgeName='\e[0;42;30m'
                _ColorOf_AtSign='\e[0;46;30m'
                _ColorOf_VersionConfig='\e[0;44;30m'

            elif [ "$_ProcessingGroupID" == 'B' ]; then

                _ShouldBuildAndPrintDescriptionPerPacakge='true'

                _ColorOf_PacakgeName='\e[0;103;30m'
                _ColorOf_AtSign='\e[0;43;30m'
                _ColorOf_VersionConfig='\e[0;101;30m'

            else

                continue

            fi



            if   [ "$NPMDependencyCategory" == '本产品拟囊括这些软件之整体或部分' ]; then

                if   [ "$_ProcessingGroupID" == 'A' ]; then

                    _ProcessingGroup_PackagesCount=$NPMDepPackage_ProduGroupA_PackagesCount
                    _ProcessingGroup_LongestPackageNameLength=$NPMDepPackage_ProduGroupA_LongestPackageNameLength

                elif [ "$_ProcessingGroupID" == 'B' ]; then

                    _ProcessingGroup_PackagesCount=$NPMDepPackage_ProduGroupB_PackagesCount
                    _ProcessingGroup_LongestPackageNameLength=$NPMDepPackage_ProduGroupB_LongestPackageNameLength

                fi

            elif [ "$NPMDependencyCategory" == '本产品仅会在研发阶段借助这些软件' ]; then

                if   [ "$_ProcessingGroupID" == 'A' ]; then

                    _ProcessingGroup_PackagesCount=$NPMDepPackage_DevelGroupA_PackagesCount
                    _ProcessingGroup_LongestPackageNameLength=$NPMDepPackage_DevelGroupA_LongestPackageNameLength

                elif [ "$_ProcessingGroupID" == 'B' ]; then

                    _ProcessingGroup_PackagesCount=$NPMDepPackage_DevelGroupB_PackagesCount
                    _ProcessingGroup_LongestPackageNameLength=$NPMDepPackage_DevelGroupB_LongestPackageNameLength

                fi

            fi



            for ((_ProcessingPackage_Index=0; _ProcessingPackage_Index<$_ProcessingGroup_PackagesCount; _ProcessingPackage_Index++)); do

                if [ $((_ProcessingGroup_PackagesCount-_ProcessingPackage_Index)) -gt 1 ]; then
                    _ProcessingPackage_IsLastOneInTheGroup='false'
                else
                    _ProcessingPackage_IsLastOneInTheGroup='true'
                fi



                _ProcessingPackage_VerionLockReason=''

                if   [ "$NPMDependencyCategory" == '本产品拟囊括这些软件之整体或部分' ]; then

                    if   [ "$_ProcessingGroupID" == 'A' ]; then

                        _ProcessingPackage_Name=${NPMDepPackage_ProduGroupA_PackageNames[$_ProcessingPackage_Index]}
                        _ProcessingPackage_VerionConfig=${NPMDepPackage_ProduGroupA_PackageVersionConfigs[${_ProcessingPackage_Index}]}

                        if [ "$_ShouldBuildAndPrintDescriptionPerPacakge" == true ]; then
                            _ProcessingPackage_VerionLockReason=${NPMDepPackage_ProduGroupA_PackageVersionLockReasons[${_ProcessingPackage_Index}]}
                        fi

                    elif [ "$_ProcessingGroupID" == 'B' ]; then

                        _ProcessingPackage_Name=${NPMDepPackage_ProduGroupB_PackageNames[$_ProcessingPackage_Index]}
                        _ProcessingPackage_VerionConfig=${NPMDepPackage_ProduGroupB_PackageVersionConfigs[${_ProcessingPackage_Index}]}

                        if [ "$_ShouldBuildAndPrintDescriptionPerPacakge" == true ]; then
                            _ProcessingPackage_VerionLockReason=${NPMDepPackage_ProduGroupB_PackageVersionLockReasons[${_ProcessingPackage_Index}]}
                        fi

                    fi

                elif [ "$NPMDependencyCategory" == '本产品仅会在研发阶段借助这些软件' ]; then

                    if   [ "$_ProcessingGroupID" == 'A' ]; then

                        _ProcessingPackage_Name=${NPMDepPackage_DevelGroupA_PackageNames[$_ProcessingPackage_Index]}
                        _ProcessingPackage_VerionConfig=${NPMDepPackage_DevelGroupA_PackageVersionConfigs[${_ProcessingPackage_Index}]}

                        if [ "$_ShouldBuildAndPrintDescriptionPerPacakge" == true ]; then
                            _ProcessingPackage_VerionLockReason=${NPMDepPackage_DevelGroupA_PackageVersionLockReasons[${_ProcessingPackage_Index}]}
                        fi

                    elif [ "$_ProcessingGroupID" == 'B' ]; then

                        _ProcessingPackage_Name=${NPMDepPackage_DevelGroupB_PackageNames[$_ProcessingPackage_Index]}
                        _ProcessingPackage_VerionConfig=${NPMDepPackage_DevelGroupB_PackageVersionConfigs[${_ProcessingPackage_Index}]}

                        if [ "$_ShouldBuildAndPrintDescriptionPerPacakge" == true ]; then
                            _ProcessingPackage_VerionLockReason=${NPMDepPackage_DevelGroupB_PackageVersionLockReasons[${_ProcessingPackage_Index}]}
                        fi

                    fi

                fi



                _ProcessingPackage_NameLength=${#_ProcessingPackage_Name}
                _ProcessingPackage_NamePaddingLength=$((_ProcessingGroup_LongestPackageNameLength-_ProcessingPackage_NameLength))
                _ProcessingPackage_NamePaddingText="${_LONG_ENOUGH_WHITE_SPACES_TEXT:0:$_ProcessingPackage_NamePaddingLength}"

                _ProcessingPackage_CommandLineSnippet="${_ProcessingPackage_Name}@${_ProcessingPackage_VerionConfig}"
                _ProcessingPackage_CommandLineSnippet_Colorful="${_ProcessingPackage_NamePaddingText}${_ColorOf_PacakgeName}${_ProcessingPackage_Name}${_ColorOf_AtSign}@${_ColorOf_VersionConfig}${_ProcessingPackage_VerionConfig}\e[0;0m"



                _ProcessingPackage_Description=''

                if [ "$_ShouldBuildAndPrintDescriptionPerPacakge" == true ]; then

                    _ProcessingGroup_DescriptionFrameInnerWidth1=$((_ProcessingGroup_LongestPackageNameLength-3))
                    _ProcessingGroup_DescriptionFrameInnerWidth2=$((PerPackageDescription_FrameWidthInEnglishCharsCount-3-$_ProcessingGroup_DescriptionFrameInnerWidth1))

                    # ────────────────────────────────────────────────────────────────────────────────
                    # ────────────────────────────────  ╔╦╗═╬╚╩╝║  ───────────────────────────────────
                    # ────────────────────────────────────────────────────────────────────────────────

                    _ProcessingPackage_Description+="\n${GLOBAL_INDENTATION}\e[0;36m# ╔$(Write-_吴乐川为方框打印一段水平边线 ${_ProcessingGroup_DescriptionFrameInnerWidth1})╦$(Write-_吴乐川为方框打印一段水平边线 ${_ProcessingGroup_DescriptionFrameInnerWidth2})╗\e[0;0m"

                    # 在方框范围内打印一行或若干行（目前是 2 行）中央带竖线的空白行。
                    for _temp_looping_index in {1..2}; do
                        _ProcessingPackage_Description+="\n${GLOBAL_INDENTATION}\e[0;36m# ║${_LONG_ENOUGH_WHITE_SPACES_TEXT:0:${_ProcessingGroup_DescriptionFrameInnerWidth1}}║${_LONG_ENOUGH_WHITE_SPACES_TEXT:0:${_ProcessingGroup_DescriptionFrameInnerWidth2}}║\e[0;0m"
                    done

                    # 在方框范围内打印一行或若干行（目前是 1 行）全空白行。
                    for _temp_looping_index in {1..1}; do
                        _ProcessingPackage_Description+="\n${GLOBAL_INDENTATION}\e[0;36m# ║${_LONG_ENOUGH_WHITE_SPACES_TEXT:0:${_ProcessingGroup_DescriptionFrameInnerWidth1}} ${_LONG_ENOUGH_WHITE_SPACES_TEXT:0:${_ProcessingGroup_DescriptionFrameInnerWidth2}}║\e[0;0m"
                    done

                    # 打印标题行，即 “该软件锁定版本范围之原因：”。
                    _ProcessingPackage_Description+="\n${GLOBAL_INDENTATION}\e[0;36m# ║ 该软件锁定版本范围之原因：${_LONG_ENOUGH_WHITE_SPACES_TEXT:0:${PerPackageDescription_FrameWidthInEnglishCharsCount}-29}║\e[0;0m"



                    # ───────────────────  ╔╦╗═╬╚╩╝║  ──────────────────

                    if [ "$PerPackageDescription_ShouldUseArrayForReceiveingFormattedTexts" == true ]; then

                        _ProcessingPackage_DescriptionContentPerLineTextsArray=()

                        ConvertTo-吴乐川将文本转换为多行文本_须采用接收器变量 \
                            --单行等效汉字字数上限 $((PerPackageDescription_ContentLineMaxHanCharsCount)) \
                            --用以接收排好版的逐行文本列表的变量名             '_ProcessingPackage_DescriptionContentPerLineTextsArray' \
                            --用以接收排好版的文本的行数的变量名               '_PerPackageDescription_ContentLinesCount' \
                            --原文本中的每个换行符在产生的内容中应改作两个换行符 true \
                            "${_ProcessingPackage_VerionLockReason}"

                        LastTaskReturnCode=$?; if [ $LastTaskReturnCode -ne 0 ]; then return $((LastTaskReturnCode+50)); fi

                        if [ -z "$_PerPackageDescription_ContentLinesCount" ] || [ "$_PerPackageDescription_ContentLinesCount" == '0' ]; then
                            _PerPackageDescription_ContentLinesCount=1

                            if [ "$PerPackageDescription_ShouldUseArrayForReceiveingFormattedTexts" == true ]; then
                                _ProcessingPackage_DescriptionContentPerLineTextsArray=( '~~~ 未注明须锁定版本范围的原因。 ~~~' )
                            fi
                        fi

                    else

                        # 利用循环语句和 eval 语句，准备好足够多的 local 变量，用以接下来接收逐行文本。
                        for ((_PerPackageDescription_ContentLineLoopIndex=1; _PerPackageDescription_ContentLineLoopIndex<=$PerPackageDescription_ContentPerLineTextVarsCount; _PerPackageDescription_ContentLineLoopIndex++)); do
                            eval "local ${PerPackageDescription_ContentPerLineTextVarsNamePrefix}${_PerPackageDescription_ContentLineLoopIndex}=''"
                        done

                        ConvertTo-吴乐川将文本转换为多行文本_须采用接收器变量 \
                            --单行等效汉字字数上限 $((PerPackageDescription_ContentLineMaxHanCharsCount)) \
                            --用以接收排好版的文本的行数的变量名                          '_PerPackageDescription_ContentLinesCount' \
                            --外界预备好用以接收排好版的逐行文本的一系列变量之名称之公共前缀  $PerPackageDescription_ContentPerLineTextVarsNamePrefix \
                            --外界预备好用以接收排好版的逐行文本的一系列变量的总数           $PerPackageDescription_ContentPerLineTextVarsCount \
                            --原文本中的每个换行符在产生的内容中应改作两个换行符             true \
                            "${_ProcessingPackage_VerionLockReason}"

                        LastTaskReturnCode=$?; if [ $LastTaskReturnCode -ne 0 ]; then return $((LastTaskReturnCode+50)); fi

                        if [ -z "$_PerPackageDescription_ContentLinesCount" ] || [ "$_PerPackageDescription_ContentLinesCount" == '0' ]; then
                            _PerPackageDescription_ContentLinesCount=1

                            eval "local ${PerPackageDescription_ContentPerLineTextVarsNamePrefix}1='~~~ 未注明须锁定版本范围的原因。 ~~~'"
                        fi

                    fi



                    for ((_PerPackageDescription_ContentLineLoopIndex=0; _PerPackageDescription_ContentLineLoopIndex<$_PerPackageDescription_ContentLinesCount; _PerPackageDescription_ContentLineLoopIndex++)); do
                        if [ "$PerPackageDescription_ShouldUseArrayForReceiveingFormattedTexts" == true ]; then
                            _PerPackageDescription_ProcessingLineText=${_ProcessingPackage_DescriptionContentPerLineTextsArray[${_PerPackageDescription_ContentLineLoopIndex}]}
                        else
                            eval "_PerPackageDescription_ProcessingLineText=\"\$${PerPackageDescription_ContentPerLineTextVarsNamePrefix}$((_PerPackageDescription_ContentLineLoopIndex+1))\""
                        fi



                        if [ -z "$_PerPackageDescription_ProcessingLineText" ]; then
                            _PerPackageDescription_ProcessingLineLength=0
                        else
                            Get-吴乐川求一行文本视觉宽度等效英语字母数_须采用接收器变量  '_PerPackageDescription_ProcessingLineLength'  "$_PerPackageDescription_ProcessingLineText"
                            LastTaskReturnCode=$?; if [ $LastTaskReturnCode -ne 0 ]; then return $((LastTaskReturnCode+60)); fi
                        fi

                        _PerPackageDescription_ProcessingLinePaddingCount=$((PerPackageDescription_FrameWidthInEnglishCharsCount-1-5-_PerPackageDescription_ProcessingLineLength-1-1))

                        _PerPackageDescription_ProcessingLinePaddingTextAndTailFrame=''
                        if [ $_PerPackageDescription_ProcessingLinePaddingCount -gt 0 ]; then
                            _PerPackageDescription_ProcessingLinePaddingTextAndTailFrame="\e[0;36m${_LONG_ENOUGH_WHITE_SPACES_TEXT:0:$_PerPackageDescription_ProcessingLinePaddingCount} ║"
                        fi

                        if [ "$_PerPackageDescription_ProcessingLineText" == '~~~ 未注明须锁定版本范围的原因。 ~~~' ]; then
                            _PerPackageDescription_ProcessingLineText="\e[0;37m${_PerPackageDescription_ProcessingLineText}"
                        fi

                        _ProcessingPackage_Description+="\n${GLOBAL_INDENTATION}\e[0;36m# ║     ${_PerPackageDescription_ProcessingLineText}${_PerPackageDescription_ProcessingLinePaddingTextAndTailFrame}"

                    done

                    # ───────────────────  ╔╦╗═╬╚╩╝║  ──────────────────



                    _ProcessingPackage_Description+="\n${GLOBAL_INDENTATION}\e[0;36m# ╚$(Write-_吴乐川为方框打印一段水平边线 ${_ProcessingGroup_DescriptionFrameInnerWidth1})╦$(Write-_吴乐川为方框打印一段水平边线 ${_ProcessingGroup_DescriptionFrameInnerWidth2})╝\e[0;0m"
                    _ProcessingPackage_Description+='\n'

                    # ────────────────────────────────────────────────────────────────────────────────
                    # ────────────────────────────────  ╔╦╗═╬╚╩╝║  ───────────────────────────────────
                    # ────────────────────────────────────────────────────────────────────────────────

                fi



                _ProcessingPackage_Description+="${GLOBAL_INDENTATION}${_ProcessingPackage_CommandLineSnippet_Colorful}"

                if [ "$_ProcessingPackage_IsLastOneInTheGroup" == false ]; then
                    _ProcessingPackage_Description+=' \'
                else
                    _ProcessingPackage_Description+=';'
                fi



                if   [ "$NPMDependencyCategory" == '本产品拟囊括这些软件之整体或部分' ]; then

                    if   [ "$_ProcessingGroupID" == 'A' ]; then

                        NPMDepPackage_ProduGroupA_CommandLineSnippet_PerPackage+=( "$_ProcessingPackage_CommandLineSnippet" )
                        NPMDepPackage_ProduGroupA_Descriptions_PerPackage+=( "$_ProcessingPackage_Description" )

                    elif [ "$_ProcessingGroupID" == 'B' ]; then

                        NPMDepPackage_ProduGroupB_CommandLineSnippet_PerPackage+=( "$_ProcessingPackage_CommandLineSnippet" )
                        NPMDepPackage_ProduGroupB_Descriptions_PerPackage+=( "$_ProcessingPackage_Description" )

                    fi

                elif [ "$NPMDependencyCategory" == '本产品仅会在研发阶段借助这些软件' ]; then

                    if   [ "$_ProcessingGroupID" == 'A' ]; then

                        NPMDepPackage_DevelGroupA_CommandLineSnippet_PerPackage+=( "$_ProcessingPackage_CommandLineSnippet" )
                        NPMDepPackage_DevelGroupA_Descriptions_PerPackage+=( "$_ProcessingPackage_Description" )

                    elif [ "$_ProcessingGroupID" == 'B' ]; then

                        NPMDepPackage_DevelGroupB_CommandLineSnippet_PerPackage+=( "$_ProcessingPackage_CommandLineSnippet" )
                        NPMDepPackage_DevelGroupB_Descriptions_PerPackage+=( "$_ProcessingPackage_Description" )

                    fi

                fi



                if [ $DebuggingLevel -ge 1 ]; then

                    if [ "$_ShouldBuildAndPrintDescriptionPerPacakge" == false ]; then
                        echo  -e  "〔调试〕： 甲类包的命令行片段： ${_ProcessingPackage_CommandLineSnippet_Colorful}"
                    else
                        echo
                        Write-Line
                        # echo  -e  "〔调试〕： 乙类包的命令行片段： ${_ProcessingPackage_CommandLineSnippet_Colorful}"
                        echo  -e  "〔调试〕： 乙类包的描述片段： "
                        Write-Line
                        echo  -e  "${_ProcessingPackage_Description}"
                    fi

                    echo
                fi

            done # 某组内的所有依赖包的循环结束于此。

        done # A、B 组的循环结束于此。

    done # Produ、Devel 类别的循环结束于此。

    # LastTaskReturnCode=$?; if [ $LastTaskReturnCode -ne 0 ]; then return $LastTaskReturnCode; fi







    # ───────────────────────────────────────────────────────────────────────────────────────────────────────────────
    # ───────────────────────────────────────────────────────────────────────────────────────────────────────────────
    # ───────────────────────────────────────────────────────────────────────────────────────────────────────────────







    # ────────────────────────────────────────────────────────────────
    #  1) 按需删除 node_modules      文件夹。
    # ────────────────────────────────────────────────────────────────

    Remove-吴乐川管理某_npm_项目__删除当前文件夹下的_node_modules       --应仅作仿真演练 $ShouldDryRun  --确应运行该任务 $ShouldRemoveNodeModulesFirst
    LastTaskReturnCode=$?; if [ $LastTaskReturnCode -ne 0 ]; then return $LastTaskReturnCode; fi





    # ────────────────────────────────────────────────────────────────
    #  2) 按需删除 package-lock.json 文件。
    # ────────────────────────────────────────────────────────────────

    Remove-吴乐川管理某_npm_项目__删除当前文件夹下的_package_lock_json  --应仅作仿真演练 $ShouldDryRun  --确应运行该任务 $ShouldRemovePackageLockJSONFirst
    LastTaskReturnCode=$?; if [ $LastTaskReturnCode -ne 0 ]; then return $LastTaskReturnCode; fi





    # ────────────────────────────────────────────────────────────────
    #  3) 安装所有依赖包。
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    #     顺便提醒，虽然一般而言 latest 版本应恰为最高版本，但并不确保。
    # ────────────────────────────────────────────────────────────────

    local NPMCommand='npm'

    local _NPMSubCommand=''
    local _NPMFullCommandLine=''
    local _ColorOf_ProcessingNPMDepCategory=''

    if [ -n "$NpmExtraArguments" ]; then
        NpmExtraArguments="  ${NpmExtraArguments}"
    fi

    for NPMDependencyCategory in ${NPMDependencyCategories[@]}; do

        if   [ "$NPMDependencyCategory" == '本产品拟囊括这些软件之整体或部分' ]; then
            _NPMSubCommand="install  --save-prod${NpmExtraArguments}"
            _ColorOf_ProcessingNPMDepCategory='\e[0;31m'
        elif [ "$NPMDependencyCategory" == '本产品仅会在研发阶段借助这些软件' ]; then
            _NPMSubCommand="install  --save-dev${NpmExtraArguments}"
            _ColorOf_ProcessingNPMDepCategory='\e[0;32m'
        else
            continue
        fi



        for _ProcessingGroupID in ${NPMDepPackage_GroupIDs[@]}; do

            if   [ "$NPMDependencyCategory" == '本产品拟囊括这些软件之整体或部分' ]; then

                if   [ "$_ProcessingGroupID" == 'A' ]; then

                    Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_产品级_均为最晚版本  --应仅作仿真演练 $ShouldDryRun

                    _ProcessingGroup_PackagesCount=$NPMDepPackage_ProduGroupA_PackagesCount
                    # _ShouldBuildAndPrintDescriptionPerPacakge='false'

                elif [ "$_ProcessingGroupID" == 'B' ]; then

                    Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_产品级_均为特定版本  --应仅作仿真演练 $ShouldDryRun

                    _ProcessingGroup_PackagesCount=$NPMDepPackage_ProduGroupB_PackagesCount
                    # _ShouldBuildAndPrintDescriptionPerPacakge='true'

                else

                    continue

                fi

            elif [ "$NPMDependencyCategory" == '本产品仅会在研发阶段借助这些软件' ]; then

                if   [ "$_ProcessingGroupID" == 'A' ]; then

                    Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_研发级_均为最晚版本  --应仅作仿真演练 $ShouldDryRun

                    _ProcessingGroup_PackagesCount=$NPMDepPackage_DevelGroupA_PackagesCount
                    # _ShouldBuildAndPrintDescriptionPerPacakge='false'

                elif [ "$_ProcessingGroupID" == 'B' ]; then

                    Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_研发级_均为特定版本  --应仅作仿真演练 $ShouldDryRun

                    _ProcessingGroup_PackagesCount=$NPMDepPackage_DevelGroupB_PackagesCount
                    # _ShouldBuildAndPrintDescriptionPerPacakge='true'

                else

                    continue

                fi

            fi



            if [ $_ProcessingGroup_PackagesCount -eq 0 ]; then

                echo  -e  "暂无。"

            else

                _NPMFullCommandLine="${NPMCommand}  ${_NPMSubCommand}"
                echo  -e  "\e[0;92m${_NPMFullCommandLine} \\ \e[0;0m"



                for ((_ProcessingPackage_Index=0; _ProcessingPackage_Index<$_ProcessingGroup_PackagesCount; _ProcessingPackage_Index++)); do

                    if   [ "$NPMDependencyCategory" == '本产品拟囊括这些软件之整体或部分' ]; then
                        if   [ "$_ProcessingGroupID" == 'A' ]; then
                            _ProcessingPackage_CommandLineSnippet=${NPMDepPackage_ProduGroupA_CommandLineSnippet_PerPackage[$_ProcessingPackage_Index]}
                            _ProcessingPackage_Description=${NPMDepPackage_ProduGroupA_Descriptions_PerPackage[$_ProcessingPackage_Index]}
                        elif [ "$_ProcessingGroupID" == 'B' ]; then
                            _ProcessingPackage_CommandLineSnippet=${NPMDepPackage_ProduGroupB_CommandLineSnippet_PerPackage[$_ProcessingPackage_Index]}
                            _ProcessingPackage_Description=${NPMDepPackage_ProduGroupB_Descriptions_PerPackage[$_ProcessingPackage_Index]}
                        fi
                    elif [ "$NPMDependencyCategory" == '本产品仅会在研发阶段借助这些软件' ]; then
                        if   [ "$_ProcessingGroupID" == 'A' ]; then
                            _ProcessingPackage_CommandLineSnippet=${NPMDepPackage_DevelGroupA_CommandLineSnippet_PerPackage[$_ProcessingPackage_Index]}
                            _ProcessingPackage_Description=${NPMDepPackage_DevelGroupA_Descriptions_PerPackage[$_ProcessingPackage_Index]}
                        elif [ "$_ProcessingGroupID" == 'B' ]; then
                            _ProcessingPackage_CommandLineSnippet=${NPMDepPackage_DevelGroupB_CommandLineSnippet_PerPackage[$_ProcessingPackage_Index]}
                            _ProcessingPackage_Description=${NPMDepPackage_DevelGroupB_Descriptions_PerPackage[$_ProcessingPackage_Index]}
                        fi
                    fi



                    _NPMFullCommandLine+="  ${_ProcessingPackage_CommandLineSnippet}"
                    echo  -e  "${_ProcessingPackage_Description}"

                done # 某组内的所有依赖包的循环结束于此。

            fi



            echo
            echo  -e  "${_ColorOf_ProcessingNPMDepCategory}`Write-Line`\e[0;0m"
            echo



            if [ "$ShouldDryRun" == true ]; then
                echo  -en  "   \e[0;33m【仿真演练】\n    \e[0;0m"
            fi

            echo  -e  "\e[0;97m${_NPMFullCommandLine}\e[0;0m"

            if [ "$ShouldDryRun" == false ]; then
                echo
                ${_NPMFullCommandLine}
            fi



            if   [ "$NPMDependencyCategory" == '本产品拟囊括这些软件之整体或部分' ]; then
                if   [ "$_ProcessingGroupID" == 'A' ]; then
                    Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_产品级_均为最晚版本  --应仅作仿真演练 $ShouldDryRun  --系作为该任务之结束提示语
                elif [ "$_ProcessingGroupID" == 'B' ]; then
                    Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_产品级_均为特定版本  --应仅作仿真演练 $ShouldDryRun  --系作为该任务之结束提示语
                fi
            elif [ "$NPMDependencyCategory" == '本产品仅会在研发阶段借助这些软件' ]; then
                if   [ "$_ProcessingGroupID" == 'A' ]; then
                    Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_研发级_均为最晚版本  --应仅作仿真演练 $ShouldDryRun  --系作为该任务之结束提示语
                elif [ "$_ProcessingGroupID" == 'B' ]; then
                    Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_研发级_均为特定版本  --应仅作仿真演练 $ShouldDryRun  --系作为该任务之结束提示语
                fi
            fi

        done # A、B 组的循环结束于此。

    done # Produ、Devel 类别的循环结束于此。
}
