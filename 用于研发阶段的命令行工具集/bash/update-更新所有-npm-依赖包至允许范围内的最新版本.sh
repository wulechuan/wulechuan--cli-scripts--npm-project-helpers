#!/bin/bash

# 下方这一行的写法专门针对本工具集自身，不适应于其他任何 npm 项。
source  './源代码/发布的源代码/bash/吴乐川-针对命令与函数的辅助工具集.sh'
source  './源代码/发布的源代码/bash/吴乐川-数据处理-文本.sh'
source  './源代码/发布的源代码/bash/吴乐川-打印-json.sh'
source  './源代码/发布的源代码/bash/吴乐川-管理某-npm-项目的依赖包等资源.sh'

# 在采用本工具集的其他 npm 项目中，应这样写：
# source  './node_modules/@wulechuan/cli-scripts--npm-project-helpers/源代码/发布的源代码/bash/吴乐川-管理某-npm-项目的依赖包等资源.sh'





function 完整流程  {
    local BY_DEFAULT__SHOULD_REMOVE_NODE_MODULES_FIRST='true'
    local BY_DEFAULT__SHOULD_REMOVE_PACKAGE_LOCK_JSON_FIRST='true'
    local BY_DEFAULT__SHOULD_DRY_RUN='false'





    local NameOfThisFunction='完整流程'

    local ShouldRemoveNodeModulesFirst
    local ShouldRemovePackageLockJSONFirst
    local ShouldDryRun

    local ArgumentConfigsArray=(
        #  命令行参数名                                         | 变量名                            | 取值之类型    | 默认值
        # ---------------------------------------------------------------------------------------------------------------------------------------------------------------
        "--在安装诸依赖包之前应先删除旧有的_node_modules_文件夹     | ShouldRemoveNodeModulesFirst     | 标准类型_布尔 | ${BY_DEFAULT__SHOULD_REMOVE_NODE_MODULES_FIRST}"
        "--在安装诸依赖包之前应先删除旧有的_package-lock点json_文件 | ShouldRemovePackageLockJSONFirst | 标准类型_布尔 | ${BY_DEFAULT__SHOULD_REMOVE_PACKAGE_LOCK_JSON_FIRST}"
        "--应仅作仿真演练                                       | ShouldDryRun                     | 标准类型_布尔 | ${BY_DEFAULT__SHOULD_DRY_RUN}"
        "--npm-args                                           | NpmArguments                     |             | " # --foreground-scripts
    )

    local LastTaskReturnCode

    Read-吴乐川读取并处理某函数的参数表  --应开启调试功能 false  $*
    LastTaskReturnCode=$?; if [ $LastTaskReturnCode -ne 0 ]; then return $LastTaskReturnCode; fi







    # ────────────────────────────────────────────────────────────────
    #  1) 按需删除 node_modules      文件夹。
    #  2) 按需删除 package-lock.json 文件。
    # ────────────────────────────────────────────────────────────────

    Remove-吴乐川管理某_npm_项目__删除当前文件夹下的_node_modules       --应仅作仿真演练 $ShouldDryRun  --确应运行该任务 $ShouldRemoveNodeModulesFirst
    LastTaskReturnCode=$?; if [ $LastTaskReturnCode -ne 0 ]; then return $LastTaskReturnCode; fi

    Remove-吴乐川管理某_npm_项目__删除当前文件夹下的_package_lock_json  --应仅作仿真演练 $ShouldDryRun  --确应运行该任务 $ShouldRemovePackageLockJSONFirst
    LastTaskReturnCode=$?; if [ $LastTaskReturnCode -ne 0 ]; then return $LastTaskReturnCode; fi







    # ────────────────────────────────────────────────────────────────
    #  3.1) 安装依赖包。【产品级】。
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    #     顺便提醒，虽然一般而言 latest 版本应恰为最高版本，但并不确保。
    # ────────────────────────────────────────────────────────────────

    # 如果 @wulechuan/cli-scripts--npm-project-helpers 工具集随附的 JavaScript 程序运行如期，
    # 其将在此处插入当前 npm 项目的【产品级】、【可自由采取其版本】的依赖包的列表。    另，切勿改动该行。该行之部分文字是供 JavaScript 程序识别的特殊记号。

    # Update-吴乐川更新当前_npm_项目的所有依赖包 \
    #     --某产品级依赖包之版本配置 '@wulechuan/text-basic-typography   |::|   null' \
    #     --某产品级依赖包之版本配置 'chalk                              |::|   null' \
    #     --某产品级依赖包之版本配置 'fs-extra                           |::|   null' \
    #     --某产品级依赖包之版本配置 'jsonc-parser                       |::|   null' \
    #     --某研发级依赖包之版本配置 '@wulechuan/cli-scripts--git-push   |::|   null' \
    #     --某研发级依赖包之版本配置 'eslint                             |::|   null' \
    #     --NPM安装依赖包时须额外带上的参数序列 "$NpmArguments" \
    #     --应仅作仿真演练 "$ShouldDryRun"
    # return

    Update-吴乐川更新当前_npm_项目的某批依赖包 \
        --这批依赖包之依赖类别 '本产品拟囊括这些软件之整体或部分' \
        --某依赖包之版本配置 '@wulechuan/text-basic-typography   |::|   null' \
        --某依赖包之版本配置 'chalk                              |::|   null' \
        --某依赖包之版本配置 'fs-extra                           |::|   null' \
        --某依赖包之版本配置 'jsonc-parser                       |::|   null' \
        --NPM安装依赖包时须额外带上的参数序列 "$NpmArguments" \
        --应仅作仿真演练 "$ShouldDryRun"

    LastTaskReturnCode=$?; if [ $LastTaskReturnCode -ne 0 ]; then return $LastTaskReturnCode; fi





    # ────────────────────────────────────────────────────────────────
    #  3.2) 安装依赖包。【研发级】。
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    #     顺便提醒，虽然一般而言 latest 版本应恰为最高版本，但并不确保。
    # ────────────────────────────────────────────────────────────────

    # 如果 @wulechuan/cli-scripts--npm-project-helpers 工具集随附的 JavaScript 程序运行如期，
    # 其将在此处插入当前 npm 项目的【研发级】、【可自由采取其版本】依赖包的列表。    另，切勿改动该行。该行之部分文字是供 JavaScript 程序识别的特殊记号。

    Update-吴乐川更新当前_npm_项目的某批依赖包 \
        --这批依赖包之依赖类别='本产品仅会在研发阶段借助这些软件' \
        --某依赖包之版本配置='@wulechuan/cli-scripts--git-push   |::|   null' \
        --某依赖包之版本配置='eslint                             |::|   null' \
        --NPM安装依赖包时须额外带上的参数序列 "$NpmArguments" \
        --应仅作仿真演练 "$ShouldDryRun"

    LastTaskReturnCode=$?; if [ $LastTaskReturnCode -ne 0 ]; then return $LastTaskReturnCode; fi






    # ────────────────────────────────────────────────────────────────
    #  4) 更新与研发相关的数据库。
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    #     例如： Browserslist:caniuse-lite
    # ────────────────────────────────────────────────────────────────

    Write-吴乐川管理某_npm_项目__打印提示语__更新与研发相关的数据库  --应仅作仿真演练 $ShouldDryRun

    if true; then

        echo  '暂无。'

    else

        # ───────────────────────────

        # [ 0 ]        # 当本 else 语句块中没有其它语句时，这句必须存在。

        # ───────────────────────────

        if false; then
            if [ "$ShouldDryRun" == true ]; then
                echo  -en  "   \e[0;33m【仿真演练】\e[0;0m\n    "
            fi

            echo  'npx  browserslist@latest  --update-db'

            if [ "$ShouldDryRun" == false ]; then
                npx  browserslist@latest  --update-db
            fi

            echo
        fi

        # ───────────────────────────

    fi

    Write-吴乐川管理某_npm_项目__打印提示语__更新与研发相关的数据库  --应仅作仿真演练 $ShouldDryRun  --系作为该任务之结束提示语







    # ────────────────────────────────────────────────────────────────
    #  5) 其他交代。
    # ────────────────────────────────────────────────────────────────

    Write-吴乐川管理某_npm_项目__打印提示语__其他交代  --应仅作仿真演练 $ShouldDryRun

    if false; then

        echo  '暂无。'

    else

        # ───────────────────────────
        # 此处不妨做些关于当前 npm 项目的必要交代。
        # 例如注意事项、关键步骤等等。
        # ───────────────────────────

        # [ 0 ]        # 当本 else 语句块中没有其它语句时，这句必须存在。

        # ───────────────────────────

        echo -e "\e[33m以下是一个 JavaScript 对象。\e[0;0m"
        echo
        echo '{'

        Write-吴乐川打印_JSON_键          -Indent 1 '爷爷' -ValueIsObject
        Write-吴乐川打印_JSON_键          -Indent 2 '葫芦娃' -ValueIsObject
        echo
        Write-吴乐川打印_JSON_注释_并换行  -Indent 3 '// 实验证明，截止 2022-05-26 ，'
        Write-吴乐川打印_JSON_注释_并换行  -Indent 3 '// 大娃必须是力娃子。'
        Write-吴乐川打印_JSON_键          -Indent 3 '大娃'
        Write-吴乐川打印_JSON_值_文本型    -IsValueOfLastKey '力娃子'
        Write-吴乐川打印_JSON_某字典结束    -Indent 2
        Write-吴乐川打印_JSON_某字典结束    -Indent 1

        echo '}'

        # ───────────────────────────

    fi

    Write-吴乐川管理某_npm_项目__打印提示语__其他交代  --应仅作仿真演练 $ShouldDryRun  --系作为该任务之结束提示语
}





完整流程  $*

__wulechuan_temporary_exception_code__=$?
if [ $__wulechuan_temporary_exception_code__ -ne 0 ]; then
    echo  -e  "\e[0;31m──────────────────────── \e[0;0m"
    echo  -e  "\e[0;31m程序异常结束代码： \e[0;33m${__wulechuan_temporary_exception_code__} \e[0;0m"
    echo  -e  "\e[0;31m──────────────────────── \e[0;0m\n　"
fi

unset -f 完整流程
# unset __wulechuan_temporary_exception_code__
exit $__wulechuan_temporary_exception_code__
