function Remove-吴乐川管理某_npm_项目__删除当前文件夹下的_node_modules {
    echo

    echo  -e "\e[0;96m═════ 删除 node_modules 文件夹 ═════════════════════════════════════\e[0;0m"

    echo

    if [ "$1" == '--应执行该步骤' ]; then
        if [ -d .'/node_modules' ]; then
            rm -rf .'/node_modules'

            if [ $? -gt 0 ]; then
                exit $?
            fi

            echo 'node_modules 文件夹已删除。'
        else
            echo 'node_modules 文件夹并不存在。不必执行。'
        fi
    else
        echo '已略过。 node_modules 文件夹并未删除。'
    fi
}



function Remove-吴乐川管理某_npm_项目__删除当前文件夹下的_package_lock_json {
    echo
    echo
    echo
    echo
    echo

    echo  -e "\e[0;32m═════ 删除 package-lock.json 文件 ══════════════════════════════════\e[0;0m"

    echo

    if [ "$1" == '--应执行该步骤' ]; then
        if [ -d .'/package-lock.json' ]; then
            rm -rf .'/package-lock.json'

            if [ $? -gt 0 ]; then
                exit $?
            fi

            echo 'package-lock.json 文件夹已删除。'
        else
            echo 'package-lock.json 文件夹并不存在。不必执行。'
        fi
    else
        echo '已略过。 package-lock.json 文件夹并未删除。'
    fi
}



function Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_产品级_均为最晚版本 {
    echo
    echo
    echo
    echo
    echo

    echo  -e  "\e[0;31m═════ npm i    最晚版本之【产品依赖包】 ════════════════════════════\e[0;0m"

    echo
}



function Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_产品级_均为特定版本 {
    echo
    echo
    echo
    echo
    echo

    echo  -e  "\e[0;31m═════ npm i    \e[97;41m特定版本\e[0;31m之【产品依赖包】 ════════════════════════════\e[0;0m"

    echo
}



function Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_研发级_均为最晚版本 {
    echo
    echo
    echo
    echo
    echo

    echo  -e  "\e[0;32m═════ npm i    最晚版本之【研发依赖包】 ════════════════════════════\e[0;0m"

    echo
}



function Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_研发级_均为特定版本 {
    echo
    echo
    echo
    echo
    echo

    echo  -e  "\e[0;32m═════ npm i    \e[90;102m特定版本\e[0;32m之【研发依赖包】 ════════════════════════════\e[0;0m"

    echo
}



function Write-吴乐川管理某_npm_项目__打印提示语__更新与研发相关的数据库 {
    echo
    echo
    echo
    echo
    echo

    echo  -e  "\e[0;33m═════ 更新与研发相关的数据库 ═══════════════════════════════════════\e[0;0m"

    echo
}



function Write-吴乐川管理某_npm_项目__打印提示语__其他交代 {
    echo
    echo
    echo
    echo
    echo

    echo  -e  "\e[0;94m═════ 其他交代 ═════════════════════════════════════════════════════\e[0;0m"

    echo
}



function Update-吴乐川更新当前_npm_项目的某批依赖包 {
    local depsAreOfProductionLevel=0

    if [ "$1" == '--这批依赖包之依赖类别' ]; then
        shift

        if [ "$1" == '本产品拟囊括这些软件之整体或部分' ]; then
            depsAreOfProductionLevel=1
            shift
        elif [ "$1" == '本产品仅会在研发阶段借助这些软件' ]; then
            depsAreOfProductionLevel=0
            shift
        else
            echo -e "\e[0;31m参数“\e[0;97m--这批依赖包之依赖类别\e[31m”的取值只能是下列之一：\e[0;0m"
            echo -e "    '本产品拟囊括这些软件之整体或部分'"
            echo -e "    '本产品仅会在研发阶段借助这些软件'"
            echo

            exit 21
        fi
    fi





    if [ $depsAreOfProductionLevel -eq 1 ]; then
        Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_产品级_均为最晚版本
    else
        Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_研发级_均为最晚版本
    fi

    echo -e "\e[41;97m 该功能尚未实现！\e[0;0m" # TODO





    if [ $depsAreOfProductionLevel -eq 1 ]; then
        Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_产品级_均为特定版本
    else
        Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_研发级_均为特定版本
    fi
    
    echo -e "\e[41;97m 该功能尚未实现！\e[0;0m" # TODO
}
