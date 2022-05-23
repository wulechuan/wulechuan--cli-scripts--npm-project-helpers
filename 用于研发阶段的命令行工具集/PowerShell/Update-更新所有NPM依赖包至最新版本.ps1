#

# 绝大多数情形下，
# 使用者仅需关注本文件的 PROCESS 一节，
# 而完全不必触碰 BEGIN 、 END 两节。
#
# 顺便提醒，即便故意将 PROCESS 一节写在 BEGIN 之前，或写在 END 之后，
# PowerShell 语言的原生机制也会
# 强制三者依照先 BEGIN ，而后 PROCESS ，最后 END 的顺序执行。
# 为便于修订本文件，遂故意令 PROCESS 一节在最顶部。









Param(
    [Alias('先删NM', '删_node_modules')]
    [switch]$安装之前应先删除旧有的_node_modules_文件夹,

    [Alias('先删PL', '删_package_lock_json')]
    [switch]$安装之前应先删除旧有的_package_lock_json_文件
)









PROCESS {
    ${script:应仅作仿真演练} = $false



    Try {

        # ───────────────────────────────────────────────────────────────
        #  1) 按需删除 node_modules      文件夹
        #  2) 按需删除 package-lock.json 文件
        #  3) 配置各依赖包可安装之版本
        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        #     顺便提醒，虽然一般而言 latest 版本应恰为最高版本，但并不确保。
        # ───────────────────────────────────────────────────────────────

        ${local:本产品所有的_npm_依赖包的安装版本配置总表} = @(
            @{
                # 取 '本产品拟囊括这些软件之整体或部分' ，
                # 说白了就是在安装这些依赖包时，会采取该命令：
                #     npm  install ，而不带 --save-dev 之参数。
                这批依赖包之依赖类别 = '本产品拟囊括这些软件之整体或部分'

                这批依赖包之安装版本配置集 = @{
                    'chalk' = $null
                    'fs-extra' = $null
                    'jsonc-parser' = $null
                }
            }



            @{
                # 取 '本产品仅会在研发阶段借助这些软件' ，
                # 说白了就是在安装这些依赖包时，会采取该命令：
                #     npm  install  --save-dev 。
                这批依赖包之依赖类别 = '本产品仅会在研发阶段借助这些软件'

                这批依赖包之安装版本配置集 = @{
                    '@wulechuan/cli-scripts--git-push' = $null
                    'eslint' = $null
                }
            }
        )



        ${local:本产品所有的_npm_依赖包的安装版本配置总表} | Update-吴乐川更新当前_npm_项目的所有批次的依赖包 `
            -应仅作仿真演练:${script:应仅作仿真演练} `
            -安装之前应先删除旧有的_node_modules_文件夹:$安装之前应先删除旧有的_node_modules_文件夹 `
            -安装之前应先删除旧有的_package_lock_json_文件:$安装之前应先删除旧有的_package_lock_json_文件





        # ───────────────────────────────────────────────────────────────
        #  4) 更新与研发相关的数据库
        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        #     例如： Browserslist:caniuse-lite
        # ───────────────────────────────────────────────────────────────

        Write-吴乐川管理某_npm_项目__打印提示语__更新与研发相关的数据库  -应仅作仿真演练:$应仅作仿真演练

        if ($true) {

            Write-Host  '暂无。'

        } else {

            # if (${script:应仅作仿真演练}) {
            #     Write-Host  '   【仿真演练】 npx  browserslist@latest  --update-db'
            # } else {
            #     npx  browserslist@latest  --update-db
            # }

        }

        Write-吴乐川管理某_npm_项目__打印提示语__更新与研发相关的数据库  -应仅作仿真演练:$应仅作仿真演练  -该信息系作为任务结束语





        # ───────────────────────────────────────────────────────────────
        #  5) 其他交代
        # ───────────────────────────────────────────────────────────────

        Write-吴乐川管理某_npm_项目__打印提示语__其他交代  -应仅作仿真演练:$应仅作仿真演练

        if ($true) {

            Write-Host  '暂无。'

        } else {

            # 此处不妨做些关于当前 npm 项目的必要交代。例如注意事项、关键步骤等等。

        }

        Write-吴乐川管理某_npm_项目__打印提示语__其他交代  -应仅作仿真演练:$应仅作仿真演练  -该信息系作为任务结束语

    } catch {

        ${local:RunTimeException} = $_

    }
}









BEGIN {
    # 该名为 BEGIN 之代码块故意安排在 PROCESS 代码块之后。但实际上 BEGIN 会在 PROCESS 之前运行。

    ${local:RunTimeException} = $null

    Write-Host "`n【当下工作路径】：`n    '$PWD'"

    if ("$PWD" -match "\\用于研发阶段的命令行工具集\\PowerShell`$") {
        ${local:执行本命令前的工作路径} = "$PWD"
        Set-Location '..\..\'
        Write-Host "`n【当下工作路径】临时变更为：`n    '$PWD'"
    }

    Write-Host
    Write-Host
    Write-Host



    $吴乐川的模块的路径 = '.\源代码\发布的源代码\PowerShell'

    Import-Module  "${吴乐川的模块的路径}\吴乐川-数据处理-文本.psm1"
    Import-Module  "${吴乐川的模块的路径}\吴乐川-管理某-npm-项目的依赖包等资源.psm1"
}









END {
    if (${local:执行本命令前的工作路径} -and ("${local:执行本命令前的工作路径}" -ne "$PWD")) {
        Write-Host "`n【当下工作路径】已复原。"
        Set-Location  "${local:执行本命令前的工作路径}"
    }



    if (${local:RunTimeException}) {
        Write-Host
        Write-Host -F 'Red' '执行过程曾出错。'
        Write-Host
        throw ${local:RunTimeException}
    }
}
