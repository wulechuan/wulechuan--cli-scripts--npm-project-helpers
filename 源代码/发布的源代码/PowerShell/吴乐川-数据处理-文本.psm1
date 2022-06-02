function Edit-吴乐川剥去文本最外层的引号 {
    Param (
        [string] $原始的文本
    )

    if (-not ("$原始的文本".GetType() -match 'String')) {
        "$原始的文本"
        Return
    }

    [string]$剥去最外层引号后的文本 = "$原始的文本"

    if ("$原始的文本" -match '^\".*\"$') {
        $剥去最外层引号后的文本 = "$剥去最外层引号后的文本".Substring(1, "$原始的文本".Length - 2)
    } elseif ("$原始的文本" -match "^\'.*\'$") {
        $剥去最外层引号后的文本 = "$剥去最外层引号后的文本".Substring(1, "$原始的文本".Length - 2)
    }

    "$剥去最外层引号后的文本"
}





function Assert-吴乐川判断字符系中日韩文字 {
    Param (
        [char] $字
    )

    PROCESS {
        # * 中国汉字 "`u{4E01}" ~ "`u{9FA5}"
        # * 朝鲜文   "`u{3130}" ~ "`u{318F}"
        # * 朝鲜文   "`u{AC00}" ~ "`u{D7A3}"
        # * 日文     "`u{0800}" ~ "`u{4E00}"
        # 半角数字须特别判断。奇怪，但实验证明必须如此。

        [boolean]${private:该字确实是中日韩文字} = (
            ("`u{4E01}" -le $字) -and ($字 -le "`u{9FA5}")
        ) -or (
            ("`u{3130}" -le $字) -and ($字 -le "`u{318F}")
        ) -or (
            ("`u{AC00}" -le $字) -and ($字 -le "`u{D7A3}")
        ) -or (
            ("`u{0800}" -le $字) -and ($字 -le "`u{4E00}")
        ) -or (
            $字 -in @(
                '“',      '”',      "‘",      "’",      '…',
                '：',      '，',      '；',      '？',      '！',      '、',      '。',      '（',      '）',
                '〈',      '〉',      '《',      '》',      '「',      '」',      '『',      '』',      '【',      '】',
                '〒',      '〓',      '〔',      '〕',      '〖',      '〗',      '〝',      '〞',      '｛',      '｝',
                '〃',      '々',      '〆',      '〇',      '〡',      '〢',      '〣',      '〤',      '〥',
                '〦',      '〧',      '〨',      '〩'
            )
        )

        if ($字 -in @('1', '2', '3', '4', '5', '6', '7', '8', '9', '0')) {
            ${private:该字确实是中日韩文字} = $false
        }
    }

    END {
        # Write-Host "调试： '$字' --> ${private:该字确实是中日韩文字}" # 仅用于调试的语句。
        ${private:该字确实是中日韩文字}
    }
}





function Assert-吴乐川判断排版时该字词之前不宜换行 {
    Param(
        $字或词
    )

    PROCESS {
        [char]${private:字} = $null
        [boolean]${private:该字词之前确实不宜换行} = $false

        if ($字或词) {
            if ($字或词.GetType() -match 'string$') {
                if ("$字或词".Length -eq 1) {
                    ${private:字} = $字或词
                } elseif ("$字或词".Length -gt 1) {
                    ${private:字} = "$字或词"[0]
                }
            }
        }

        if (${private:字}) {
            ${private:该字词之前确实不宜换行} = ${private:字} -in @(
                ',:;.!)]}' -split '', 0

                '：',      '，',      '；',      '？',      '！',      '、',      '。',      '）',
                '〉',      '》',      '」',      '』',      '】',      '〗',      '〕',      '｝',
                '”',      "’",      '…',      '·'
            )
        }
    }

    END {
        ${private:该字词之前确实不宜换行}
    }
}





function Get-吴乐川求一行文本视觉宽度等效英语字母数 {
    # 假定个英语字母之视觉等宽。
    # 并假定一个中日韩文字之宽度恰为一个英语字母宽度之 2 倍。

    Param (
        [string]$文本
    )

    PROCESS {
        [int]${private:视觉宽度等效英语字符数} = 0

        if (-not ("$文本".GetType() -match 'string')) {
            return
        }

        if ("$文本".Length -eq 0) {
            return
        }

        [string[]]$该文本之一切字符之列表 = "$文本" -split '', 0

        ($该文本之一切字符之列表).ForEach{
            if ($_) {
                if (Assert-吴乐川判断字符系中日韩文字 -字 "$_") {
                    if ($_ -in ("`“`”‘’…" -split '', 0)) {
                        ${private:视觉宽度等效英语字符数} += 1
                        # Write-Host "调试：'$_' +1 = ${private:视觉宽度等效英语字符数}"
                    } else {
                        ${private:视觉宽度等效英语字符数} += 2
                        # Write-Host "调试：'$_' +2 = ${private:视觉宽度等效英语字符数}"
                    }
                } else {
                    ${private:视觉宽度等效英语字符数} += 1
                    # Write-Host "调试：'$_' +1 = ${private:视觉宽度等效英语字符数}"
                }
            }
        }
    }

    END {
        ${private:视觉宽度等效英语字符数}
    }
}





function ConvertTo-吴乐川将文本转换为多行文本 {
    # 测试用例集：
    #
    # 1) > '啊十 分 六 十分嗖嗖冷风接送费斯拉夫到 , as dflsjladls wuaas wusdf lld asfasd tadtionadfsd adwl我' | ConvertTo-吴乐川将文本转换为多行文本 -单行等效汉字字数上限 9
    #
    # 2）>  (@(
    #           "若安装 eslint@8 则无法正常运转。"
    #           "安装 eslint@7.x 可以正常运转，但在凭借本文件安装时，会有不兼容之警告；而直接 npm i 却又没有警告。"
    #           "安装 eslint@6.x 则完全无问题。"
    #       ) -join "`n") | ConvertTo-吴乐川将文本转换为多行文本 -单行等效汉字字数上限 19 -原文本中的每个换行符在产生的内容中应改作两个换行符



    [CmdletBinding()]
    Param(
        [Parameter(
            Mandatory = $false,
            ValueFromPipeline = $true
        )]
        [string]$原文本,

        [int]   $单行等效汉字字数上限 = 30,

        [switch]$英语单词在行尾时其后应保留一个空格,
        [switch]$原文本中的每个换行符在产生的内容中应改作两个换行符
    )

    BEGIN {}

    PROCESS {
        [string[]]${private:逐行内容之列表} = @()





        [string]${private:原始全文} = "$_"
        [int]   ${private:单行等效英语字母数上限} = $单行等效汉字字数上限 * 2




        [string[]]${private:临时字词表} = @()
        [string]  ${private:临时字词} = ''

        ("${private:原始全文}" -split '', 0).ForEach{
            if ($_) {
                if ("$_" -eq "`n") {
                    ${private:临时字词表} += @( $_ )
                } elseif (Assert-吴乐川判断字符系中日韩文字 $_) {
                    if ($(${private:临时字词} -replace '^\s+|\s+$')) {
                        ${private:临时字词表} += @( "$(${private:临时字词} -replace '\s+$')" )
                    }

                    ${private:临时字词} = ''

                    ${private:临时字词表} += @( $_ )
                } else {
                    ${private:临时字词} += $_
                }
            }
        }

        if (${private:临时字词}) {
            ${private:临时字词表} += @( "$(${private:临时字词} -replace '\s+$')" )
            ${private:临时字词} = ''
        }
        # ${private:临时字词表}.ForEach{ "'$_'"} # 用于调试的语句





        [string[]]${private:字词表} = @()

        ${private:临时字词表}.ForEach{
            if ("$_" -eq "`n") {
                ${private:字词表} += @( "$_" )
            } else {
                ${private:临时字词} = "$_" -replace '^\s+|\s+$' # 等效于其他编程语言的 trim() 。

                if (${private:临时字词}.Length -gt 0) {
                    if (${private:临时字词}.Length -eq 1) {
                        if (Assert-吴乐川判断字符系中日韩文字 "${private:临时字词}") {
                            ${private:字词表} += @( "${private:临时字词}" )
                        } else {
                            ${private:字词表} += @( "${private:临时字词} " ) # 后面带一个空格。
                        }
                    } else {
                        ("${private:临时字词}" -split '\s+').ForEach{
                            ${private:字词表} += @( "$_ " ) # 后面带一个空格。
                        }
                    }
                }
            }
        }

        [int]   ${private:字词总数} = ${private:字词表}.Length
        # ${private:字词表}
        # Write-Host "`${private:字词总数} = ${private:字词总数}"





        [int]    ${private:即将索取之字词之编号} = 0

        [string] ${private:新行内容} = ''
        [int]    ${private:新行等效宽度} = 0
        [int]    ${private:新行已有字词数} = 0
        [int]    ${private:新行若再添一两个词的等效宽度} = 0
        [boolean]${private:因取到换行符而结束一行} = $false

        [string] ${private:本次刚取到的字词} = ''
        [int]    ${private:本次刚取到的字词的等效宽度} = 0
        [boolean]${private:本次刚取到的是汉字} = $false
        [boolean]${private:本次刚取到的字词之前不宜换行} = $false
        [boolean]${private:上次取到的最末一个字是汉字} = $false

        [string] ${private:下一个即将取的字词} = ''
        [boolean]${private:下一个即将取的字词之前不宜换行} = $false
        [int]    ${private:下一个即将取的字词的等效宽度} = 0



        While (${private:即将索取之字词之编号} -lt ${private:字词总数}) {

            ${private:新行内容} = ''
            ${private:新行等效宽度} = 0
            ${private:新行已有字词数} = 0

            While ((${private:新行等效宽度} -lt ${private:单行等效英语字母数上限}) -and (${private:即将索取之字词之编号} -lt ${private:字词总数})) {

                ${private:本次刚取到的字词} = ${private:字词表}[${private:即将索取之字词之编号}]
                ${private:本次刚取到的字词之前不宜换行} = Assert-吴乐川判断排版时该字词之前不宜换行 "${private:本次刚取到的字词}"
                # Write-Host "调试：刚取到的字词 ${private:即将索取之字词之编号} = '${private:本次刚取到的字词}'"


                ${private:即将索取之字词之编号}++

                ${private:下一个即将取的字词之前不宜换行} = $false

                if ((${private:即将索取之字词之编号} -lt ${private:字词总数})) {
                    ${private:下一个即将取的字词} = ${private:字词表}[${private:即将索取之字词之编号}]
                    ${private:下一个即将取的字词之前不宜换行} = Assert-吴乐川判断排版时该字词之前不宜换行 "${private:下一个即将取的字词}"
                }



                ${private:因取到换行符而结束一行} = "${private:本次刚取到的字词}" -eq "`n"

                if (${private:因取到换行符而结束一行}) {
                    # Write-Host "调试：= = = 本次取到换行符。"

                    if (${private:下一个即将取的字词之前不宜换行}) {
                        # Write-Host "调试：= = = 但是该换行符会扰乱排版，遂强行去除。"
                        # 故意 “ 吞噬 ” 掉一个原文中的换行符。以免出现不适宜的排版换行。
                        ${private:本次刚取到的字词} = ''
                        ${private:因取到换行符而结束一行} = $false
                    } else {
                        break
                    }
                }



                if ("${private:本次刚取到的字词}" -match '^\s*$') {
                    break
                }



                ${private:本次刚取到的字词的等效宽度} = Get-吴乐川求一行文本视觉宽度等效英语字母数 "${private:本次刚取到的字词}"

                if ("${private:本次刚取到的字词}".Length -eq 1) {
                    ${private:本次刚取到的是汉字} = Assert-吴乐川判断字符系中日韩文字 "${private:本次刚取到的字词}"
                } else {
                    ${private:本次刚取到的是汉字} = $false
                }



                if (-not ${private:本次刚取到的字词之前不宜换行}) {

                    if (${private:上次取到的最末一个字是汉字} -and (-not ${private:本次刚取到的是汉字})) {
                        ${private:本次刚取到的字词} = " ${private:本次刚取到的字词}" # 汉字后面的非汉字内容，前面加一个空格。
                        ${private:本次刚取到的字词的等效宽度} += 1
                    }

                    ${private:新行若再添一两个词的等效宽度} = ${private:新行等效宽度} + ${private:本次刚取到的字词的等效宽度}

                    if (${private:下一个即将取的字词之前不宜换行}) {
                        ${private:下一个即将取的字词的等效宽度} = Get-吴乐川求一行文本视觉宽度等效英语字母数 "${private:下一个即将取的字词}"
                        ${private:新行若再添一两个词的等效宽度} += ${private:下一个即将取的字词的等效宽度}
                    }

                    if (${private:新行若再添一两个词的等效宽度} -gt ${private:单行等效英语字母数上限}) {
                        if (${private:新行已有字词数} -ne 0) {
                            ${private:即将索取之字词之编号}--
                            # Write-Host "调试：本行已经到头了。暂时舍弃`“${private:本次刚取到的字词}`”。 本行内容的长度 ${private:新行等效宽度}。本行没有采取该超限长度：${private:新行若再添一两个词的等效宽度}"
                            break
                        }
                    }

                }



                ${private:新行内容} += "${private:本次刚取到的字词}"
                ${private:新行已有字词数}++
                ${private:新行等效宽度} += ${private:本次刚取到的字词的等效宽度}

                ${private:上次取到的最末一个字是汉字} = ${private:本次刚取到的是汉字}
            } # 内层 While 语句结束于此。该 While 语句用以为单行采集字词，逐字逐词向新行添加内容。循环完成时，得到一行文本。



            ${private:新行内容} = "${private:新行内容}" -replace '^\s+|\s+$' # 等效于其他编程语言的 trim() 。
            if ($英语单词在行尾时其后应保留一个空格) {
                ${private:新行内容} += ' '
            }



            ${private:逐行内容之列表} += @( "${private:新行内容}" )
            # Write-Host "调试：---- 刚刚保存了一行：'${private:新行内容}'"



            if (${private:因取到换行符而结束一行}) {
                if ($原文本中的每个换行符在产生的内容中应改作两个换行符) {
                    # Write-Host "调试：= = = 随即存一个空行。"
                    ${private:逐行内容之列表} += @( "" )
                }
            }

        } # 外层 While 语句结束于此。该 While 语句用以构建完整的多行文本之列表。





        ${private:逐行内容之列表}
    }

    END {}
}





Export-ModuleMember -Function *
