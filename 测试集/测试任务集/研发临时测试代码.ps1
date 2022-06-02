Param(
    [Alias('先删NM', '删_node_modules')]
    [switch]$安装之前应先删除旧有的_node_modules_文件夹,

    [Alias('先删PL', '删_package_lock_json')]
    [switch]$安装之前应先删除旧有的_package_lock_json_文件
)









PROCESS {
    Try {

        @(
            @{
                这批依赖包之依赖类别 = '本产品拟囊括这些软件之整体或部分'

                这批依赖包之安装版本配置集 = @{
                    'vue'                          = @('2.6',  '本项目之前端技术框架暂不打算迁移至 Vuejs 3.x 。')
                    'vue-router'                   = @('~3.4', '版本兼容问题。')
                    'vuex'                         = @('~3.4')
                    '@zhong-hua/package-jia'       = $null
                    '@zhong-hua/package-yi'        = @('0',    '这是仅限版本零，而不是不设限。')
                    '@zhong-hua/package-bing-ding' = ''
                    '@jun-yong-fei-ji/jian-20'     = @('2019',   '出征。')
                    '@dao-dan/dong-feng-17'        = @('2025',   (@(
                            "起来，饥寒交迫的奴隶，"
                            "起来，全世界受苦的人！"
                            "满腔的热血已经沸腾，"
                            "要为真理而斗争！"
                            "旧世界打个落花流水，"
                            "奴隶们，起来，起来！"
                            "不要说我们一无所有，"
                            "我们要做天下的主人！"
                            "这是最后的斗争，"
                            "团结起来，到明天，"
                            "英特纳雄耐尔就一定要实现。"
                            "这是最后的斗争，"
                            "团结起来，到明天，"
                            "英特纳雄耐尔就一定要实现。"
                            "从来就没有什么救世主，"
                            "也不靠神仙皇帝。"
                            "要创造人类的幸福，"
                            "全靠我们自己。"
                            "我们要夺回劳动果实，"
                            "让思想冲破牢笼。"
                            "快把那炉火烧得通红，"
                            "趁热打铁才能成功！"
                            "这是最后的斗争，"
                            "团结起来，到明天，"
                            "英特纳雄耐尔就一定要实现。"
                            "这是最后的斗争，"
                            "团结起来，到明天，"
                            "英特纳雄耐尔就一定要实现。"
                            "是谁创造了人类世界？"
                            "是我们劳动群众。"
                            "一切归劳动者所有，"
                            "哪能容得寄生虫！"
                            "最可恨那些毒蛇猛兽，"
                            "吃尽了我们的血肉。"
                            "一旦把它们消灭干净，"
                            "鲜红的太阳照遍全球！"
                            "这是最后的斗争，"
                            "团结起来，到明天，"
                            "英特纳雄耐尔就一定要实现。"
                            "这是最后的斗争，"
                            "团结起来，到明天，"
                            "英特纳雄耐尔就一定要实现。"
                        ) -join "`n" )
                    )
                    '@dao-dan/dong-feng-20'        = @('2025',   '也没有神仙皇帝。')
                }
            }

            @{
                这批依赖包之依赖类别 = '本产品仅会在研发阶段借助这些软件'

                这批依赖包之安装版本配置集 = @{
                }
            }
        ) | Update-吴乐川更新当前_npm_项目的所有批次的依赖包 -应仅作仿真演练

    } catch {

        ${private:RunTimeException} = $_

    }
}









BEGIN {
    # Set-Location ..\..\..
    [string]${script:吴乐川的模块的路径} = '.\源代码\发布的源代码\PowerShell'

    Import-Module  "${script:吴乐川的模块的路径}\吴乐川-打印-json.psm1"
    Import-Module  "${script:吴乐川的模块的路径}\吴乐川-数据处理-文本.psm1"
    Import-Module  "${script:吴乐川的模块的路径}\吴乐川-管理某-npm-项目的依赖包等资源.psm1"
}









END {
    if (${private:RunTimeException}) {
        Write-Host
        Write-Host -F 'Red' '执行过程曾出错。'
        Write-Host
        throw ${private:RunTimeException}
    }
}
