source  ./源代码/发布的源代码/bash/吴乐川-针对命令与函数的辅助工具集.sh
source  ./源代码/发布的源代码/bash/吴乐川-数据处理-文本.sh
source  ./源代码/发布的源代码/bash/吴乐川-管理某-npm-项目的依赖包等资源.sh





function 测试之主程序 {
    local LastTaskReturnCode

    local ResultReceiver=''
    local Text=''
    local Char=''
    local LoopIndex=0





    if false; then
        local NameOfThisFunction='测试之主程序（第一部分）'

        local Number1
        local number2
        local n3
        local boolean1
        local Bool2
        local AllTextSnippets=( '测试程序调用 “ Read-吴乐川读取并处理某函数的参数表 ” 之前旧有的内容，不应被洗掉。' )
        local ChineseHeros=( '李广' '岳飞' )
        local SomeList=()

        local ArgumentConfigsArray=(
            #  命令行参数名                                         | 变量名                            | 取值之类型    | 默认值
            "--number-1        | Number1         | 标准类型_整数     | ${BY_DEFAULT__SHOULD_REMOVE_NODE_MODULES_FIRST}"
            "--正整数           | number2         | 标准类型_正整数   | ${BY_DEFAULT__SHOULD_REMOVE_PACKAGE_LOCK_JSON_FIRST}"
            "--整数3            | n3              | 标准类型_非负整数 | ${BY_DEFAULT__SHOULD_REMOVE_PACKAGE_LOCK_JSON_FIRST}"
            "--开关甲           | boolean1        | 标准类型_布尔     | ${BY_DEFAULT__SHOULD_REMOVE_PACKAGE_LOCK_JSON_FIRST}"
            "〈匿名值之汇总列表〉 | AllTextSnippets"
            "--中华英雄谱       | ChineseHeros    | 标准类型_列表"
            "--bool-2          | Bool2           | 标准类型_布尔     | ${BY_DEFAULT__SHOULD_REMOVE_PACKAGE_LOCK_JSON_FIRST}"
            "--实验性列表       | SomeList        | 标准类型_列表"
        )



        Read-吴乐川读取并处理某函数的参数表  --调试功能之级别 1 \
            --number-1 1 \
            匿名值表中新添的第一词 \
            --正整数 2 \
            --整数3 3 \
            --开关甲 true \
            --bool-2 \
            0 \
            --实验性列表 \
                '看看会不会包含这一条' --实验性列表 '第二条' \
            --作者 '作者是吴乐川' \
            '匿名值表中新添的第 2  |::|  词' \
            "这后面带有换行符：\n……这是换行符之后的内容。" \
            '' \
            "" \
            --中华英雄谱 '辛弃疾' \
            --中华英雄谱 '程开甲' \
            --中华英雄谱='黄继光' \
            --中华英雄谱 '钱学森' \
            --中华英雄谱 '张桃芳' \
            ' ' \
            --中华英雄谱='王伟（81192）' \
            --中华英雄谱 '袁隆平' \
            --实验性列表 '' \
            --实验性列表 '甲 乙  |::|   丙  | 丁' \
            我就是吴乐川！

        echo
        echo
        echo
        echo  '───────────────────────────────────────────────────'
        echo  '调用 “ Read-吴乐川读取并处理某函数的参数表 ” 之后'
        echo  '───────────────────────────────────────────────────'
        echo  -e  "\e[0;33mAllTextSnippets\e[0;97m=(\e[0;0m"
        for ((LoopIndex=0; LoopIndex<${#AllTextSnippets[@]}; LoopIndex++)); do
            Text=${AllTextSnippets[$LoopIndex]}
            echo -e  "    \e[0;97m\"\e[0;91m${Text}\e[0;97m\"\e[0;0m"
        done
        echo  -e  "\e[0;97m)\e[0;0m"
        echo  '───────────────────────────────────────────────────'
        echo
        echo

        LastTaskReturnCode=$?; if [ $LastTaskReturnCode -ne 0 ]; then return $LastTaskReturnCode; fi


        return
    fi




    if false; then
        # 方法一：
        # 此方法较繁复。
        # 须先预备足够多（ 此例是 99 个）的 local 变量来接收逐行文本。

        echo -e "\n──────────────────────────────────────────\n方法一\n──────────────────────────────────────────\n"

        ResultReceiver=''

        local CountOfTextLines
        local ReceiverVarsCount=99
        for ((LoopIndex=1; LoopIndex<=$ReceiverVarsCount; LoopIndex++)); do
            eval "local WlcTextOfLine_${LoopIndex}=''"
        done

        ConvertTo-吴乐川将文本转换为多行文本_须采用接收器变量 \
            --外界预备好用以接收排好版的逐行文本的一系列变量之名称之公共前缀 WlcTextOfLine_ \
            --外界预备好用以接收排好版的逐行文本的一系列变量的总数 $ReceiverVarsCount \
            --用以接收排好版的文本的行数的变量名 CountOfTextLines \
            '大漠沙如雪' --英语单词在行尾时其后应保留一个空格 false '  燕山月似钩' ' 。 ' \
            '文档对象模型（DOM）将 web 页面与到脚本或编程语言连接起来。通常是指 JavaScript，但将 HTML、SVG 或 XML 文档建模为对象并不是 JavaScript 语言的一部分。DOM 模型用一个逻辑树来表示一个文档，树的每个分支的终点都是一个节点（node），每个节点都包含着对象（object）。DOM 的方法（method）让你可以用特定方式操作这个树，用这些方法你可以改变文档的结构、样式或者内容。节点可以关联上事件处理器，一旦某一事件被触发了，那些事件处理器就会被执行。 ' \
            "Aliquip proident nulla ex cillum magna. Anim culpa dolor ullamco nulla culpa labore. Lo\nrem dolor proident qui aliquip nulla. Do ex external link 1 (www.bing.com) anim tempor do veniam duis nulla ut culpa tempor dolore. Labore dolore ex anim fake self-page link 2 (do not follow) id. Anim et ex ex labore cupidatat anim proident laboris amet fugiat aute ad.\n Reprehenderit dolore cupidatat sit elit esse anim est aute." \
            --原文本中的每个换行符在产生的内容中应改作两个换行符 true \
            "\n总有一天中国人会有自己的高性能计算机芯片。" \
            --单行等效汉字字数上限 24

        if [ ! -z "$CountOfTextLines" ]; then
            for ((LoopIndex=1; LoopIndex<=$CountOfTextLines; LoopIndex++)); do
                eval "Text=\"\$WlcTextOfLine_${LoopIndex}\""
                echo -e  "    # ║ \e[0;91m$Text\e[0;0m"
            done
        fi
    fi



    if false; then
        # 方法二：
        # 此方法略简单。

        echo -e "\n──────────────────────────────────────────\n方法二\n──────────────────────────────────────────\n"

        ResultReceiver=''

        local TextLinesArray
        local CountOfTextLines

        ConvertTo-吴乐川将文本转换为多行文本_须采用接收器变量 \
            --用以接收排好版的逐行文本列表的变量名 TextLinesArray \
            --用以接收排好版的文本的行数的变量名 CountOfTextLines \
            '大漠沙如雪' --英语单词在行尾时其后应保留一个空格 false '  燕山月似钩' ' 。 ' \
            '文档对象模型（DOM）将 web 页面与到脚本或编程语言连接起来。通常是指 JavaScript，但将 HTML、SVG 或 XML 文档建模为对象并不是 JavaScript 语言的一部分。DOM 模型用一个逻辑树来表示一个文档，树的每个分支的终点都是一个节点（node），每个节点都包含着对象（object）。DOM 的方法（method）让你可以用特定方式操作这个树，用这些方法你可以改变文档的结构、样式或者内容。节点可以关联上事件处理器，一旦某一事件被触发了，那些事件处理器就会被执行。 ' \
            "Aliquip proident nulla ex cillum magna. Anim culpa dolor ullamco nulla culpa labore. Lo\nrem dolor proident qui aliquip nulla. Do ex external link 1 (www.bing.com) anim tempor do veniam duis nulla ut culpa tempor dolore. Labore dolore ex anim fake self-page link 2 (do not follow) id. Anim et ex ex labore cupidatat anim proident laboris amet fugiat aute ad.\n Reprehenderit dolore cupidatat sit elit esse anim est aute." \
            --原文本中的每个换行符在产生的内容中应改作两个换行符 true \
            "\n总有一天中国人会有自己的高性能计算机芯片。" \
            --单行等效汉字字数上限 33

        if [ ! -z "$CountOfTextLines" ]; then
            for ((LoopIndex=0; LoopIndex<$CountOfTextLines; LoopIndex++)); do
                Text="${TextLinesArray[$LoopIndex]}"
                echo -e  "    # ║ \e[0;91m$Text\e[0;0m"
            done
        fi
    fi





    if false; then

        echo -e "\n──────────────────────────────────────────\n采用“直接回显结论”的方法\n──────────────────────────────────────────\n"

        ResultReceiver=''

        ConvertTo-吴乐川将文本转换为多行文本_直接回显结论 '大漠沙如雪' --英语单词在行尾时其后应保留一个空格 false '  燕山月似钩' ' 。 ' \
            '文档对象模型（DOM）将 web 页面与到脚本或编程语言连接起来。通常是指 JavaScript，但将 HTML、SVG 或 XML 文档建模为对象并不是 JavaScript 语言的一部分。DOM 模型用一个逻辑树来表示一个文档，树的每个分支的终点都是一个节点（node），每个节点都包含着对象（object）。DOM 的方法（method）让你可以用特定方式操作这个树，用这些方法你可以改变文档的结构、样式或者内容。节点可以关联上事件处理器，一旦某一事件被触发了，那些事件处理器就会被执行。 ' \
            "Aliquip proident nulla ex cillum magna. Anim culpa dolor ullamco nulla culpa labore. Lo\nrem dolor proident qui aliquip nulla. Do ex external link 1 (www.bing.com) anim tempor do veniam duis nulla ut culpa tempor dolore. Labore dolore ex anim fake self-page link 2 (do not follow) id. Anim et ex ex labore cupidatat anim proident laboris amet fugiat aute ad.\n Reprehenderit dolore cupidatat sit elit esse anim est aute." \
            --原文本中的每个换行符在产生的内容中应改作两个换行符 true \
            "\n总有一天中国人会有自己的高性能计算机芯片。" \
            --单行等效汉字字数上限 36

    fi





    if false; then

        echo
        echo
        echo

        ResultReceiver=''

        ConvertTo-吴乐川将文本转换为多行文本_直接回显结论 \
            'paxk 1 ute ad.\n Reprehenderit dolore cupst aute.' \
            "\n总\\\\有一天中国人会有自己的高性能计算机芯片。" \
            --原文本中的每个换行符在产生的内容中应改作两个换行符 true \
            --单行等效汉字字数上限 19

    fi

    if false; then

        echo
        echo
        echo

        ResultReceiver=''
        Text='页面与到脚本或编程语言连接起来。通常是指页面与到脚本或编程语言连接起来。通常是指'
        for LoopIndex in {1..60}; do Text+='abcd '; done

        ConvertTo-吴乐川将文本转换为多行文本_直接回显结论 "$Text" --单行等效汉字字数上限 40
    fi





    if false; then
        ResultReceiver=''

        # if [ ࠀ ==  `echo -e "\u0800"` ]; then
        #     echo '相同'
        # fi

        # if [ ㄰ ==  `echo -e "\u3130"` ]; then
        #     echo '相同'
        # fi

        # if [ ㆏ ==  `echo -e "\u318F"` ]; then
        #     echo '相同'
        # fi

        for Char in 吴 乐 川 “ ” \" \' 가 힣 ࠀ `echo -e "\u07ff"` `echo -e "\u0800"` 1 2 3 A B C っ オ た ジ ヤ; do
            # ResultReceiver=`Assert-吴乐川判断字符系中日韩文字_直接回显结论  $Char`

            Assert-吴乐川判断字符系中日韩文字_须采用接收器变量  ResultReceiver  $Char
            echo "'$Char' 是中日韩文字或标点： ${ResultReceiver}"
        done

        Text='吴乐川'
        Assert-吴乐川判断字符系中日韩文字_须采用接收器变量  ResultReceiver  "$Text"
        echo "'$Text' 是中日韩文字或标点： ${ResultReceiver}"
    fi



    if false; then
        ResultReceiver=''

        for Char in `echo }` ： ， ； ？ ！ 、 。 ） 〉 》 」 』 】 〗 〕 ｝ ” ’ … · A B C 吴 乐 川; do
            # ResultReceiver=`Assert-吴乐川判断排版时该字词之前不宜换行_直接回显结论 $Char`
            Assert-吴乐川判断排版时该字词之前不宜换行_须采用接收器变量  ResultReceiver  $Char
            echo "'$Char' 前面不宜换行： ${ResultReceiver}"
        done
    fi





    if false; then
        ResultReceiver=''

        # Get-吴乐川求一行文本视觉宽度等效英语字母数_直接回显结论  '‘吴乐川ABC'

        Text='‘吴乐川ABC'
        Get-吴乐川求一行文本视觉宽度等效英语字母数_须采用接收器变量  ResultReceiver  "$Text"
        echo "'$Text' 等效英语字母数： ${ResultReceiver}"
    fi





    if false; then
        Update-吴乐川更新当前_npm_项目的某批依赖包 \
            --这批依赖包之依赖类别='本产品拟囊括这些软件之整体或部分' \
            --某依赖包之版本配置='   vue    |||       2.6      |||    本项目之前端技术框架暂不打算迁移至 Vuejs 3.x 。' \
            --某依赖包之版本配置='vue-router        ||| ~3.4 ||| 版本兼容问题。' \
            --某依赖包之版本配置='vu*ex ||| ~3.4  |||' \
            --某依赖包之版本配置='@zhong-hua/packageA ||| null |||  没什么好原因。' \
            --某依赖包之版本配置='@zhong-hua/package-bb     ||| $null |||  我就是想暂缓升级该依赖包不行吗？' \
            --某依赖包之版本配置='@zhong-hua/package-ccc    ||| 0 |||  这表示仅限版本零，而不是不设限。' \
            --应仅作仿真演练=0
    fi





    if false; then

        echo
        echo
        echo
        Write-Line
        Write-Line
        Write-Line
        echo
        echo
        echo

        Update-吴乐川更新当前_npm_项目的某批依赖包 \
            --这批依赖包之依赖类别='本产品拟囊括这些软件之整体或部分' \
            --某依赖包之版本配置='   vue    |||       2.6      |||    本项目之前端技术框架暂不打算迁移至 Vuejs 3.x 。' \
            --某依赖包之版本配置='vue-router        ||| ~3.4 ||| 版本兼容问题。' \
            --某依赖包之版本配置='vuex ||| ~3.4 |||  ' \
            --某依赖包之版本配置='@zhong-hua/package-jia ||| null ' \
            --某依赖包之版本配置='@zhong-hua/package-yi ||| 0 ||| 这表示仅限版本零，而不是不设限。' \
            --某依赖包之版本配置='@zhong-hua/package-bing-ding' \
            --某依赖包之版本配置='@jun-yong-fei-ji/jian-20    |||  2025   |||   出征。' \
            --某依赖包之版本配置='@dao-dan/dong-feng-17  |||  2025   |||   从来就没有什么救世主，' \
            --某依赖包之版本配置='@dao-dan/dong-feng-41   |||  2025   |||   也没有神仙皇帝。' \
            --应仅作仿真演练=0
    fi





    local LINE_BREAK='\n'
    local GUO_JI_GE=''
    GUO_JI_GE+="起来，饥寒交迫的奴隶，"
    GUO_JI_GE+="${LINE_BREAK}起来，全世界受苦的人！"
    GUO_JI_GE+="${LINE_BREAK}满腔的热血已经沸腾，"
    GUO_JI_GE+="${LINE_BREAK}要为真理而斗争！"
    GUO_JI_GE+="${LINE_BREAK}旧世界打个落花流水，"
    GUO_JI_GE+="${LINE_BREAK}奴隶们，起来，起来！"
    GUO_JI_GE+="${LINE_BREAK}不要说我们一无所有，"
    GUO_JI_GE+="${LINE_BREAK}我们要做天下的主人！"
    GUO_JI_GE+="${LINE_BREAK}这是最后的斗争，"
    GUO_JI_GE+="${LINE_BREAK}团结起来，到明天，"
    GUO_JI_GE+="${LINE_BREAK}英特纳雄耐尔就一定要实现。"
    GUO_JI_GE+="${LINE_BREAK}这是最后的斗争，"
    GUO_JI_GE+="${LINE_BREAK}团结起来，到明天，"
    GUO_JI_GE+="${LINE_BREAK}英特纳雄耐尔就一定要实现。"
    GUO_JI_GE+="${LINE_BREAK}从来就没有什么救世主，"
    GUO_JI_GE+="${LINE_BREAK}也不靠神仙皇帝。"
    GUO_JI_GE+="${LINE_BREAK}要创造人类的幸福，"
    GUO_JI_GE+="${LINE_BREAK}全靠我们自己。"
    GUO_JI_GE+="${LINE_BREAK}我们要夺回劳动果实，"
    GUO_JI_GE+="${LINE_BREAK}让思想冲破牢笼。"
    GUO_JI_GE+="${LINE_BREAK}快把那炉火烧得通红，"
    GUO_JI_GE+="${LINE_BREAK}趁热打铁才能成功！"
    GUO_JI_GE+="${LINE_BREAK}这是最后的斗争，"
    GUO_JI_GE+="${LINE_BREAK}团结起来，到明天，"
    GUO_JI_GE+="${LINE_BREAK}英特纳雄耐尔就一定要实现。"
    GUO_JI_GE+="${LINE_BREAK}这是最后的斗争，"
    GUO_JI_GE+="${LINE_BREAK}团结起来，到明天，"
    GUO_JI_GE+="${LINE_BREAK}英特纳雄耐尔就一定要实现。"
    GUO_JI_GE+="${LINE_BREAK}是谁创造了人类世界？"
    GUO_JI_GE+="${LINE_BREAK}是我们劳动群众。"
    GUO_JI_GE+="${LINE_BREAK}一切归劳动者所有，"
    GUO_JI_GE+="${LINE_BREAK}哪能容得寄生虫！"
    GUO_JI_GE+="${LINE_BREAK}最可恨那些毒蛇猛兽，"
    GUO_JI_GE+="${LINE_BREAK}吃尽了我们的血肉。"
    GUO_JI_GE+="${LINE_BREAK}一旦把它们消灭干净，"
    GUO_JI_GE+="${LINE_BREAK}鲜红的太阳照遍全球！"
    GUO_JI_GE+="${LINE_BREAK}这是最后的斗争，"
    GUO_JI_GE+="${LINE_BREAK}团结起来，到明天，"
    GUO_JI_GE+="${LINE_BREAK}英特纳雄耐尔就一定要实现。"
    GUO_JI_GE+="${LINE_BREAK}这是最后的斗争，"
    GUO_JI_GE+="${LINE_BREAK}团结起来，到明天，"
    GUO_JI_GE+="${LINE_BREAK}英特纳雄耐尔就一定要实现。"
    # echo -e "$GUO_JI_GE"



    if true; then

        # Update-吴乐川更新当前_npm_项目的某批依赖包 \
        #     --这批依赖包之依赖类别='本产品拟囊括这些软件之整体或部分' \
        #     --内容分割记号='|::|' \
        #     --某依赖包之版本配置='@jun-yong-fei-ji/jian-ji-ji    |::|  2025  |::|   出征。' \
        #     --某依赖包之版本配置="@dao-dan/dong-feng-17          |::|  2025  |::|   ${GUO_JI_GE}" \
        #     --应仅作仿真演练 true

        # return

        # echo
        # echo
        # echo
        # Write-Line
        # Write-Line
        # Write-Line
        # echo
        # echo
        # echo

        # Update-吴乐川更新当前_npm_项目的某批依赖包 \
        #     --这批依赖包之依赖类别='本产品拟囊括这些软件之整体或部分' \
        #     --内容分割记号='|::|' \
        #     --某依赖包之版本配置='   vue    |::|       2.6      |::|    本项目之前端技术框架暂不打算迁移至 Vuejs 3.x 。' \
        #     --某依赖包之版本配置='vue-router        |::| ~3.4 |::| 版本兼容问题。' \
        #     --某依赖包之版本配置='vuex |::| ~3.4 |::|  ' \
        #     --某依赖包之版本配置='@zhong-hua/package-a |::| null ' \
        #     --某依赖包之版本配置='@zhong-hua/package-b |::| $null ' \
        #     --某依赖包之版本配置='@zhong-hua/package-cde         |::|   0  |::| 这表示仅限版本零，而不是不设限。' \
        #     --某依赖包之版本配置='@zhong-hua/package-fghi' \
        #     --某依赖包之版本配置='@jun-yong-fei-ji/jian-ji-ji    |::|  2025  |::|   出征。' \
        #     --某依赖包之版本配置="@dao-dan/dong-feng-17          |::|  2025  |::|   ${GUO_JI_GE}" \
        #     --某依赖包之版本配置='@dao-dan/dong-feng-41          |::|  2025  |::|   也没有神仙皇帝。' \
        #     --应仅作仿真演练 true

        echo
        echo
        echo
        Write-Line
        Write-Line
        Write-Line
        echo
        echo
        echo

        Update-吴乐川更新当前_npm_项目的所有依赖包 \
            --调试功能之级别 1
            --内容分割记号='|::|' \
            --某产品级依赖包之版本配置='   vue    |::|       2.6      |::|    本项目之前端技术框架暂不打算迁移至 Vuejs 3.x 。' \
            --某产品级依赖包之版本配置='vue-router        |::| ~3.4 |::| 版本兼容问题。' \
            --某产品级依赖包之版本配置='vuex |::| ~3.4 |::|  ' \
            --某产品级依赖包之版本配置='@zhong-hua/package-a |::| null ' \
            --某产品级依赖包之版本配置='@zhong-hua/package-b |::| $null ' \
            --某产品级依赖包之版本配置='@zhong-hua/package-cde         |::|   0  |::| 这表示仅限版本零，而不是不设限。' \
            --某研发级依赖包之版本配置='@zhong-hua/package-fghi' \
            --某研发级依赖包之版本配置='@jun-yong-fei-ji/jian-ji-ji    |::|  2025  |::|   出征。' \
            --某研发级依赖包之版本配置="@dao-dan/dong-feng-17          |::|  2025  |::|   ${GUO_JI_GE}" \
            --某研发级依赖包之版本配置='@dao-dan/dong-feng-41          |::|  2025  |::|   也没有神仙皇帝。' \
            --应仅作仿真演练 true

        # Update-吴乐川更新当前_npm_项目的某批依赖包 \
        #     --这批依赖包之依赖类别='本产品仅会在研发阶段借助这些软件' \
        #     --内容分割记号='|:|:|' \
        #     --某依赖包之版本配置='@zhong-hua/jiu-zhang         |:|:|   null ' \
        #     --某依赖包之版本配置='@zhong-hua/ben-cao-gang-mu   |:|:|   $null ' \
        #     --应仅作仿真演练=true
    fi
}





__WLC_time_start__=`date`
echo -e "\n──────────────────────────────────────────\n开始： ${__WLC_time_start__}\n──────────────────────────────────────────\n"
测试之主程序
__WLC_time_end__=`date`
echo -e "\n──────────────────────────────────────────\n开始： ${__WLC_time_start__}\n结束： ${__WLC_time_end__}\n──────────────────────────────────────────\n"
unset -f 测试之主程序
unset __WLC_time_start__
unset __WLC_time_end__
