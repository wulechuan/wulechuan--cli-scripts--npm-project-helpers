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
                '：',      '，',      '？',      '！',      '、',      '。',      '（',      '）',
                '〈',      '〉',      '《',      '》',      '「',      '」',      '『',      '』',      '【',      '】',     
                '〒',      '〓',      '〔',      '〕',      '〖',      '〗',      '〝',      '〞',     
                '〃',      '々',      '〆',      '〇',      '〡',      '〢',      '〣',      '〤',      '〥',
                '〦',      '〧',      '〨',      '〩'
            )
        )

        if ($字 -in @('1', '2', '3', '4', '5', '6', '7', '8', '9', '0')) {
            ${private:该字确实是中日韩文字} = $false
        }
    }

    END {
        # Write-Host "'$字' --> ${private:该字确实是中日韩文字}" # 仅用于调试的语句。
        ${private:该字确实是中日韩文字}
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
                    ${private:视觉宽度等效英语字符数} += 2
                    # Write-Host "'$_' +2 = ${private:视觉宽度等效英语字符数}"
                } else {
                    ${private:视觉宽度等效英语字符数} += 1
                    # Write-Host "'$_' +1 = ${private:视觉宽度等效英语字符数}"
                }
            }
        }
    }

    END {
        ${private:视觉宽度等效英语字符数}
    }
}





function ConvertTo-吴乐川将文本转换为多行文本 {
    # 测试用例：
    # 1) > '啊十 分 六 十分嗖嗖冷风接送费斯拉夫到 , as dflsjladls wuaas wusdf lld asfasd tadtionadfsd adwl我' | ConvertTo-吴乐川将文本转换为多行文本 -单行等效汉字字数上限 9



    [CmdletBinding()]
    Param(
        [Parameter(
            Mandatory = $false,
            ValueFromPipeline = $true
        )]
        [string]$原文本,

        [int]   $单行等效汉字字数上限 = 30,

        [switch]$英语单层在行尾时其后保留一个空格
    )

    BEGIN {}

    PROCESS {
        [string[]]${private:逐行内容之列表} = @()





        [string]${private:原始全文} = "$_"
        [int]   ${private:单行等效英语字母数上限} = $单行等效汉字字数上限 * 2




        [string[]]${private:临时单词表} = @()
        [string]  ${private:临时字或临时词组} = ''

        ("${private:原始全文}" -split '', 0).ForEach{
            if ($_) {
                if (Assert-吴乐川判断字符系中日韩文字 $_) {
                    if ($(${private:临时字或临时词组} -replace '^\s+|\s+$')) {
                        ${private:临时单词表} += @( "$(${private:临时字或临时词组} -replace '\s+$')" )
                        ${private:临时字或临时词组} = ''
                    }
    
                    ${private:临时单词表} += @( $_ )
                } else {
                    ${private:临时字或临时词组} += $_
                }
            }
        }

        if (${private:临时字或临时词组}) {
            ${private:临时单词表} += @( "$(${private:临时字或临时词组} -replace '\s+$')" )
            ${private:临时字或临时词组} = ''
        }
        # ${private:临时单词表}.ForEach{ "'$_'"} # 用于调试的语句





        [string[]]${private:单词表} = @()

        ${private:临时单词表}.ForEach{
            ${private:临时字或临时词组} = "$_" -replace '^\s+|\s+$' # 等效于其他编程语言的 trim() 。

            if (${private:临时字或临时词组}.Length -gt 0) {
                if (${private:临时字或临时词组}.Length -eq 1) {
                    if (Assert-吴乐川判断字符系中日韩文字 "${private:临时字或临时词组}") {
                        ${private:单词表} += @( "${private:临时字或临时词组}" )
                    } else {
                        ${private:单词表} += @( "${private:临时字或临时词组} " ) # 后面带一个空格。
                    }
                } else {
                    ("${private:临时字或临时词组}" -split '\s+').ForEach{
                        ${private:单词表} += @( "$_ " ) # 后面带一个空格。
                    }
                }
            }
        }

        [int]   ${private:单词总数} = ${private:单词表}.Length
        # ${private:单词表}
        # Write-Host "`${private:单词总数} = ${private:单词总数}"





        [int]   ${private:将取单词之编号} = 0

        [string]${private:新行内容} = ''
        [int]   ${private:新行等效宽度} = 0
        [int]   ${private:新行已有单词数} = 0
        [int]   ${private:新行若再添一词的等效宽度} = 0

        [string]${private:刚取的单词} = ''
        [int]   ${private:刚取的单词的等效宽度} = 0

        While (${private:将取单词之编号} -lt ${private:单词总数}) {

            ${private:新行内容} = ''
            ${private:新行等效宽度} = 0
            ${private:新行已有单词数} = 0
            ${private:新行若再添一词的等效宽度} = 0

            While ((${private:新行等效宽度} -lt ${private:单行等效英语字母数上限}) -and (${private:将取单词之编号} -lt ${private:单词总数})) {

                ${private:刚取的单词} = ${private:单词表}[${private:将取单词之编号}]
                # Write-Host ">>> 刚取的单词 ${private:将取单词之编号} = '${private:刚取的单词}'"
                if (${private:刚取的单词}.Length -match '^\s*$') {
                    ${private:将取单词之编号}++
                    break
                }

                ${private:刚取的单词的等效宽度} = Get-吴乐川求一行文本视觉宽度等效英语字母数 "${private:刚取的单词}"

                ${private:新行若再添一词的等效宽度} = ${private:新行等效宽度} + ${private:刚取的单词的等效宽度}

                if (${private:新行若再添一词的等效宽度} -gt ${private:单行等效英语字母数上限}) {
                    if (${private:新行已有单词数} -ne 0) {
                        break
                    }
                }

                ${private:新行内容} += "${private:刚取的单词}"
                ${private:新行已有单词数}++
                ${private:新行等效宽度} += ${private:刚取的单词的等效宽度}

                ${private:将取单词之编号}++
            }

            if (-not $英语单层在行尾时其后保留一个空格) {
                ${private:新行内容} = "${private:新行内容}" -replace '^\s+|\s+$' # 等效于其他编程语言的 trim() 。
            }

            ${private:逐行内容之列表} += @( "${private:新行内容}" )
        }





        ${private:逐行内容之列表}
    }

    END {}
}





Export-ModuleMember -Function *
