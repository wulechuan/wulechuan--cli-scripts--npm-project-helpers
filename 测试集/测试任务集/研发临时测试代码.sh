source  ./源代码/发布的源代码/bash/吴乐川-数据处理-文本.sh
source  ./源代码/发布的源代码/bash/吴乐川-管理某-npm-项目的依赖包等资源.sh





function 测试之主程序 {
    function _为方框打印一段水平边线 {
        if [[ ! "$1" =~ ^[1-9][0-9]*$ ]]; then
            return
        fi

        local _temp_looping_index=0
        for ((_temp_looping_index=0; _temp_looping_index<$1; _temp_looping_index++)); do
            echo -n '0'
        done
    }

    _为方框打印一段水平边线 '2'
    echo
    echo
    echo


    local _result=''

    if false; then
        if [ ࠀ ==  `echo -e "\u0800"` ]; then
            echo '相同'
        fi

        if [ ㄰ ==  `echo -e "\u3130"` ]; then
            echo '相同'
        fi

        if [ ㆏ ==  `echo -e "\u318F"` ]; then
            echo '相同'
        fi

        for Char in 吴 乐 川 가 “ ” \" \' 힣 ࠀ `echo -e "\u07ff"` `echo -e "\u0800"` 1 2 3 A B C っ オ た ジ ヤ; do
            _result=`Assert-吴乐川判断字符系中日韩文字 $Char`
            echo "'$Char' 是中日韩文字或标点： ${_result}"
        done
    fi



    if false; then
        for Char in \} ： ， ； ？ ！ 、 。 ） 〉 》 」 』 】 〗 〕 ｝ ” ’ … · A B C 吴 乐 川; do
            _result=`Assert-吴乐川判断排版时该字词之前不宜换行 $Char`
            echo "'$Char' 前面不宜换行： ${_result}"
        done
    fi


    Get-吴乐川求一行文本视觉宽度等效英语字母数  '‘吴乐川ABC'

    return


    Update-吴乐川更新当前_npm_项目的某批依赖包 \
        --这批依赖包之依赖类别='本产品拟囊括这些软件之整体或部分' \
        --某依赖包之版本配置='   vue    |||       2.6      |||    本项目之前端技术框架暂不打算迁移至 Vuejs 3.x 。' \
        --某依赖包之版本配置='vue-router        ||| ~3.4 ||| 版本兼容问题。' \
        --某依赖包之版本配置='vu*ex ||| ~3.4  |||' \
        --某依赖包之版本配置='@zhong-hua/packageA ||| null |||  因为我想缓缓2222。' \
        --某依赖包之版本配置='@zhong-hua/package-bb     ||| $null |||  因为我想缓缓2222。' \
        --某依赖包之版本配置='@zhong-hua/package-ccc    ||| 0 |||  这是仅限版本零，而不是不设限。' \
        --应仅作仿真演练=0

    echo
    echo
    echo
    Write-Line
    Write-Line
    Write-Line
    echo
    echo
    echo

    # Update-吴乐川更新当前_npm_项目的某批依赖包 \
    #     --这批依赖包之依赖类别='本产品拟囊括这些软件之整体或部分' \
    #     --某依赖包之版本配置='   vue    |||       2.6      |||    本项目之前端技术框架暂不打算迁移至 Vuejs 3.x 。' \
    #     --某依赖包之版本配置='vue-router        ||| ~3.4 ||| 版本兼容问题。' \
    #     --某依赖包之版本配置='vuex ||| ~3.4 |||  ' \
    #     --某依赖包之版本配置='@zhong-hua/package-jia ||| null ' \
    #     --某依赖包之版本配置='@zhong-hua/package-yi ||| 0 ||| 这是仅限版本零，而不是不设限。' \
    #     --某依赖包之版本配置='@zhong-hua/package-bing-ding' \
    #     --某依赖包之版本配置='@jun-yong-fei-ji/jian-20    |||  2019   |||   出征。' \
    #     --某依赖包之版本配置='@dao-dan/dong-feng-17  |||  2025   |||   从来就没有什么救世主，' \
    #     --某依赖包之版本配置='@dao-dan/dong-feng-41   |||  2025   |||   也没有神仙皇帝。' \
    #     --应仅作仿真演练=0

    # echo
    # echo
    # echo
    # Write-Line
    # Write-Line
    # Write-Line
    # echo
    # echo
    # echo

    Update-吴乐川更新当前_npm_项目的某批依赖包 \
        --这批依赖包之依赖类别='本产品拟囊括这些软件之整体或部分' \
        --内容分割记号='|::|' \
        --某依赖包之版本配置='   vue    |::|       2.6      |::|    本项目之前端技术框架暂不打算迁移至 Vuejs 3.x 。' \
        --某依赖包之版本配置='vue-router        |::| ~3.4 |::| 版本兼容问题。' \
        --某依赖包之版本配置='vuex |::| ~3.4 |::|  ' \
        --某依赖包之版本配置='@zhong-hua/package-a |::| null ' \
        --某依赖包之版本配置='@zhong-hua/package-b |::| $null ' \
        --某依赖包之版本配置='@zhong-hua/package-cde         |::|   0  |::| 这是仅限版本零，而不是不设限。' \
        --某依赖包之版本配置='@zhong-hua/package-fghi' \
        --某依赖包之版本配置='@jun-yong-fei-ji/jian-ji-ji    |::|  20  |::|   出征。' \
        --某依赖包之版本配置='@dao-dan/dong-feng             |::|  17  |::|   从来就没有什么救世主，' \
        --某依赖包之版本配置='@dao-dan/dong-feng             |::|  41  |::|   也没有神仙皇帝。' \
        --应仅作仿真演练 true
}





测试之主程序
unset -f 测试之主程序
