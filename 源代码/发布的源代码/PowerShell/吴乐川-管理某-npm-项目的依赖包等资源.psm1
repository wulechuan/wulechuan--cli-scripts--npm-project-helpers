[string[]]${script:合规的颜色值之列表}         = [System.Enum]::GetValues([System.ConsoleColor])
[int]     ${script:分隔线统一长度等效英语字母数} = 72



[string[]]${script:npm依赖包的依赖类别词表} = @(
    '本产品拟囊括这些软件之整体或部分'
    '本产品仅会在研发阶段借助这些软件'
)

[string]${script:措辞_所谓最晚版本} = '最晚版本'
[string]${script:措辞_所谓特定版本} = '特定版本'





function Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同 {
    # Write-Host  -F  'DarkGray'  ('─' * ${script:分隔线统一长度等效英语字母数})
}



function Write-_吴乐川打印足够的的空白行_在某任务开始前 {
    Write-Host
}



function Write-_吴乐川打印足够的的空白行_在某任务结束后 {
    Write-Host
    Write-Host
    Write-Host
    Write-Host
    Write-Host
    Write-Host
    Write-Host
}





function Assert-吴乐川判断某值为合规对象 {
    Param (
        [string]$消息前缀,
        [string]$待审查的量所隶属之范畴之描述,
        [string]$待审查的量之名称或描述,
        [PSCustomObject]$待审查的量,
        [switch]$待审查的量应称为属性而不称为入口参数
    )



    PROCESS {
        [boolean]${private:该值确系合规} = $true
        [string]${private:给出值的类型} = ''



        if (-not $待审查的量) {
            ${private:该值确系合规} = $false
        } else {
            ${private:给出值的类型} = $待审查的量.getType()
            if (${private:给出值的类型} -NotMatch 'Object\[\]|Hashtable') {
                ${private:该值确系合规} = $false
            }
        }



        if (-not ${private:该值确系合规}) {

            Write-Host  -F 'Red'     ('─' * 51)

            Write-Host  -F 'Red'     "${消息前缀}"

            if ("$待审查的量所隶属之范畴之描述" -eq '$_') {

                Write-Host  -NoNewline  -F 'Red'     '    自动变量【'
                Write-Host  -NoNewline  -F 'White'   '$_'
                Write-Host  -NoNewline  -F 'Red'     '】'
                Write-Host
                Write-Host  -NoNewline  -F 'Red'     '    （此处其含义为〔'
                Write-Host  -NoNewline  -F 'White'   "${待审查的量之名称或描述}"
                Write-Host  -NoNewline  -F 'Red'     '〕）'
                Write-Host

            } else {
                ${private:所涉量所隶属之范畴之范畴称谓} = $待审查的量应称为属性而不称为入口参数 ? '变量' : '入口参数集'
                ${private:所涉量之范畴称谓}           = $待审查的量应称为属性而不称为入口参数 ? '属性' : '入口参数'

                if ($待审查的量应称为属性而不称为入口参数) {
                    if ($待审查的量所隶属之范畴之描述) {
                        Write-Host  -NoNewline  -F 'Red'     "    ${private:所涉量所隶属之范畴之范畴称谓}"
                        Write-Host  -NoNewline  -F 'Red'     '【'
                        Write-Host  -NoNewline  -F 'White'   "${待审查的量所隶属之范畴之描述}"
                        Write-Host  -NoNewline  -F 'Red'     '】'
                        Write-Host
                        Write-Host  -NoNewline  -F 'Red'     '    中的'
                    } else {
                        Write-Host  -NoNewline  -F 'Red'     '    '
                    }
                } else {
                    if ($false) {
                        Write-Host  -NoNewline  -F 'Red'     "    ${private:所涉量所隶属之范畴之范畴称谓}中的"
                    } else {
                        Write-Host  -NoNewline               '    '
                    }
                }

                Write-Host  -NoNewline  -F 'Red'     "${private:所涉量之范畴称谓}"
                Write-Host  -NoNewline  -F 'Red'     '【'
                Write-Host  -NoNewline  -F 'White'   "${待审查的量之名称或描述}"
                Write-Host  -NoNewline  -F 'Red'     '】'
                Write-Host
            }

            Write-Host  -NoNewline  -F 'Red'     '其取值'
            Write-Host  -NoNewline  -F 'Green'   '应为对象'
            Write-Host  -NoNewline  -F 'Red'     '。'

            if (${private:给出值的类型}) {
                Write-Host
                Write-Host  -NoNewline  -F 'Red'     "而给出值的却是该类型： '"
                Write-Host  -NoNewline  -F 'Yellow'  "${private:给出值的类型}"
                Write-Host  -NoNewline  -F 'Red'     '''。'
            } else {
                Write-Host  -NoNewline  -F 'Red'     "而给出值的等效为 "
                Write-Host  -NoNewline  -F 'Yellow'  '$null'
                Write-Host  -NoNewline  -F 'Red'     ' 。'
            }

            Write-Host

            Write-Host  -F 'Red'     ('─' * 51)

            Write-Host
        }
    }

    END {
        ${private:该值确系合规}
    }
}



function Write-_吴乐川管理某_npm_项目__内部通用工具__打印提示语__处理某批依赖包 {
    param (
        [string]$固定格式的文本_第1片段,
        [string]$固定格式的文本_第2片段,
        [string]$固定格式的文本_第3片段,
        [string]$首选颜色,
        [string]$强调文字的字色,
        [string]$强调文字的底色,
        [switch]$该信息系作为任务结束语,
        [switch]$不应在首部留有过多的空白,
        [switch]$应仅作仿真演练
    )

    BEGIN {

        if ($首选颜色      -NotIn ${script:合规的颜色值之列表}) { $首选颜色      = $Host.UI.RawUI.ForegroundColor }
        if ($强调文字的字色 -NotIn ${script:合规的颜色值之列表}) { $强调文字的字色 = $首选颜色 }
        if ($强调文字的底色 -NotIn ${script:合规的颜色值之列表}) { $强调文字的底色 = $Host.UI.RawUI.BackgroundColor }



        # 故意将用于任务前的信息写在 BEGIN 部分。以此作为理解本代码时的心理暗示。如此安排在程序执行时并无实质的特异功效。

        if (-not $该信息系作为任务结束语) {

            if (-not $不应在首部留有过多的空白) { Write-_吴乐川打印足够的的空白行_在某任务开始前 }

            Write-Host  -NoNewline  -F $首选颜色                         ($应仅作仿真演练 ? '═══【仿真演练】═══' : '══════════════════')
            Write-Host  -NoNewline  -F $首选颜色                         " ${固定格式的文本_第1片段} "
            Write-Host  -NoNewline  -F $强调文字的字色  -B $强调文字的底色  "${固定格式的文本_第2片段}"
            Write-Host  -NoNewline  -F $首选颜色                         "之【${固定格式的文本_第3片段}依赖包】"
            Write-Host              -F $首选颜色                         ($应仅作仿真演练 ? '════════════════════' : '════════════════════')
            Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同

            Write-Host

        }
    }

    PROCESS {}

    END {
        # 故意将用于任务后的信息写在 END 部分。以此作为理解本代码时的心理暗示。如此安排在程序执行时并无实质的特异功效。

        if ($该信息系作为任务结束语) {

            Write-Host

            Write-Host  -NoNewline  -F $首选颜色                         ($应仅作仿真演练 ? '═══【仿真演练】═══' : '══════════════════')
            Write-Host  -NoNewline  -F $首选颜色                         " ${固定格式的文本_第1片段} "
            Write-Host  -NoNewline  -F $强调文字的字色  -B $强调文字的底色  "${固定格式的文本_第2片段}"
            Write-Host  -NoNewline  -F $首选颜色                         "之【${固定格式的文本_第3片段}依赖包】"
            Write-Host              -F $首选颜色                         ($应仅作仿真演练 ? '══════ 已结束 ══════' : '══════ 已结束 ══════')
            Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同

            Write-_吴乐川打印足够的的空白行_在某任务结束后

        }
    }
}



function Write-_吴乐川管理某_npm_项目__内部通用工具__打印提示语__简单格式 {
    param (
        [string]$作为任务起始前提示语的文本全文,
        [string]$作为任务结束后提示语的文本全文,
        [string]$首选颜色,
        [switch]$该信息系作为任务结束语,
        [switch]$不应在首部留有过多的空白
    )

    BEGIN {
        if ($首选颜色 -NotIn ${script:合规的颜色值之列表}) { $首选颜色 = $Host.UI.RawUI.ForegroundColor }



        # 故意将用于任务前的信息写在 BEGIN 部分。以此作为理解本代码时的心理暗示。如此安排在程序执行时并无实质的特异功效。

        if (-not $该信息系作为任务结束语) {

            if (-not $不应在首部留有过多的空白) { Write-_吴乐川打印足够的的空白行_在某任务开始前 }

            Write-Host  -F $首选颜色  "$作为任务起始前提示语的文本全文"
            Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同
            Write-Host

        }
    }

    PROCESS {}

    END {
        # 故意将用于任务后的信息写在 END 部分。以此作为理解本代码时的心理暗示。如此安排在程序执行时并无实质的特异功效。

        if ($该信息系作为任务结束语) {

            Write-Host
            Write-Host  -F $首选颜色  "$作为任务结束后提示语的文本全文"
            Write-_吴乐川打印测量提示语长度的尺子_纯粹是于研发阶段用以确保各提示语宽度接近等同

            Write-_吴乐川打印足够的的空白行_在某任务结束后

        }

    }
}





function Remove-吴乐川管理某_npm_项目__删除当前文件夹下的_node_modules {
    Param (
        [switch]$应执行该步骤,
        [switch]$不应在首部留有过多的空白,
        [switch]$应仅作仿真演练
    )

    BEGIN {
        [string]${private:首选颜色} = 'DarkCyan'

        [string]${private:作为任务起始前提示语的文本全文} = $应仅作仿真演练 `
            ? '═══【仿真演练】═══ 删除 node_modules 文件夹 ════════════════════════════' `
            : '══════════════════ 删除 node_modules 文件夹 ════════════════════════════'

        [string]${private:作为任务结束后提示语的文本全文} = $应仅作仿真演练 `
            ? '═══【仿真演练】═══ 删除 node_modules 文件夹 ══════════════ 已结束 ══════' `
            : '══════════════════ 删除 node_modules 文件夹 ══════════════ 已结束 ══════'




        Write-_吴乐川管理某_npm_项目__内部通用工具__打印提示语__简单格式 `
            -作为任务起始前提示语的文本全文 "${private:作为任务起始前提示语的文本全文}" `
            -作为任务结束后提示语的文本全文 '' `
            -首选颜色 "${private:首选颜色}" `
            -不应在首部留有过多的空白:$不应在首部留有过多的空白
    }

    PROCESS {
        if (-not $应执行该步骤) {
            Write-Host '已略过。 node_modules 文件夹并未删除。'
            return
        }

        ${private:node_modules_的路径} = '.\node_modules'

        if (Test-Path "${private:node_modules_的路径}") {

            if (-not $应仅作仿真演练) {
                Remove-Item  -Recurse  -Force  -Path "${private:node_modules_的路径}"

                if (-not $?) {
                    Throw $?
                }

                Write-Host  -F 'White'  'node_modules 文件夹已删除。'
            } else {
                Write-Host              -F 'DarkYellow'  '   【仿真演练】'

                Write-Host  -NoNewline                   '    '
                Write-Host  -NoNewline  -F 'White'       "node_modules 文件夹已"
                Write-Host  -NoNewline  -F 'DarkYellow'  "（视为）"
                Write-Host  -NoNewline  -F 'White'       "删除。"
                Write-Host
            }

        } else {
            Write-Host 'node_modules 文件夹并不存在。不必执行。'
        }
    }

    END {
        Write-_吴乐川管理某_npm_项目__内部通用工具__打印提示语__简单格式 `
            -作为任务起始前提示语的文本全文 '' `
            -作为任务结束后提示语的文本全文 "${private:作为任务结束后提示语的文本全文}" `
            -首选颜色 "${private:首选颜色}" `
            -该信息系作为任务结束语
    }
}





function Remove-吴乐川管理某_npm_项目__删除当前文件夹下的_package_lock_json {
    Param (
        [switch]$应执行该步骤,
        [switch]$不应在首部留有过多的空白,
        [switch]$应仅作仿真演练
    )

    BEGIN {
        [string]${private:首选颜色} = 'Green'

        [string]${private:作为任务起始前提示语的文本全文} = $应仅作仿真演练 `
            ? '═══【仿真演练】═══ 删除 package-lock.json 文件 ═════════════════════════' `
            : '══════════════════ 删除 package-lock.json 文件 ═════════════════════════'

        [string]${private:作为任务结束后提示语的文本全文} = $应仅作仿真演练 `
            ? '═══【仿真演练】═══ 删除 package-lock.json 文件 ═══════════ 已结束 ══════' `
            : '══════════════════ 删除 package-lock.json 文件 ═══════════ 已结束 ══════'



        Write-_吴乐川管理某_npm_项目__内部通用工具__打印提示语__简单格式 `
            -作为任务起始前提示语的文本全文 "${private:作为任务起始前提示语的文本全文}" `
            -作为任务结束后提示语的文本全文 '' `
            -首选颜色 "${private:首选颜色}" `
            -不应在首部留有过多的空白:$不应在首部留有过多的空白
    }

    PROCESS {
        if (-not $应执行该步骤) {
            Write-Host '已略过。 package-lock.json 文件并未删除。'
            return
        }

        ${private:package_lock_json_的路径} = '.\package-lock.json'

        if (Test-Path "${private:package_lock_json_的路径}") {

            if (-not $应仅作仿真演练) {
                Remove-Item  -Force  -Path "${private:package_lock_json_的路径}"

                if (-not $?) {
                    Throw $?
                }

                Write-Host  -F 'White'  'package-lock.json 文件已删除。'
            } else {
                Write-Host              -F 'DarkYellow'  '   【仿真演练】'

                Write-Host  -NoNewline                   '    '
                Write-Host  -NoNewline  -F 'White'       "package-lock.json 文件已"
                Write-Host  -NoNewline  -F 'DarkYellow'  "（视为）"
                Write-Host  -NoNewline  -F 'White'       "删除。"
                Write-Host
            }
        } else {
            Write-Host 'package-lock.json 文件并不存在。不必执行。'
        }
    }

    END {
        Write-_吴乐川管理某_npm_项目__内部通用工具__打印提示语__简单格式 `
            -作为任务起始前提示语的文本全文 '' `
            -作为任务结束后提示语的文本全文 "${private:作为任务结束后提示语的文本全文}" `
            -首选颜色 "${private:首选颜色}" `
            -该信息系作为任务结束语
    }
}





function Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_产品级_均为最晚版本 {
    Param (
        [switch]$该信息系作为任务结束语,
        [switch]$不应在首部留有过多的空白,
        [switch]$应仅作仿真演练
    )

    Write-_吴乐川管理某_npm_项目__内部通用工具__打印提示语__处理某批依赖包 `
        -固定格式的文本_第1片段 'npm i   ' `
        -固定格式的文本_第2片段 "${script:措辞_所谓最晚版本}" `
        -固定格式的文本_第3片段 '产品' `
        -首选颜色 'DarkRed' `
        -强调文字的字色 '' `
        -强调文字的底色 '' `
        -该信息系作为任务结束语:$该信息系作为任务结束语 `
        -不应在首部留有过多的空白:$不应在首部留有过多的空白 `
        -应仅作仿真演练:$应仅作仿真演练
}

function Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_产品级_均为特定版本 {
    Param (
        [switch]$该信息系作为任务结束语,
        [switch]$不应在首部留有过多的空白,
        [switch]$应仅作仿真演练
    )

    Write-_吴乐川管理某_npm_项目__内部通用工具__打印提示语__处理某批依赖包 `
        -固定格式的文本_第1片段 'npm i   ' `
        -固定格式的文本_第2片段 "${script:措辞_所谓特定版本}" `
        -固定格式的文本_第3片段 '产品' `
        -首选颜色 'DarkRed' `
        -强调文字的字色 'White' `
        -强调文字的底色 'DarkRed' `
        -该信息系作为任务结束语:$该信息系作为任务结束语 `
        -不应在首部留有过多的空白:$不应在首部留有过多的空白 `
        -应仅作仿真演练:$应仅作仿真演练
}

function Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_研发级_均为最晚版本 {
    Param (
        [switch]$该信息系作为任务结束语,
        [switch]$不应在首部留有过多的空白,
        [switch]$应仅作仿真演练
    )

    Write-_吴乐川管理某_npm_项目__内部通用工具__打印提示语__处理某批依赖包 `
        -固定格式的文本_第1片段 'npm i -D' `
        -固定格式的文本_第2片段 "${script:措辞_所谓最晚版本}" `
        -固定格式的文本_第3片段 '研发' `
        -首选颜色 'DarkGreen' `
        -强调文字的字色 '' `
        -强调文字的底色 '' `
        -该信息系作为任务结束语:$该信息系作为任务结束语 `
        -不应在首部留有过多的空白:$不应在首部留有过多的空白 `
        -应仅作仿真演练:$应仅作仿真演练
}

function Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_研发级_均为特定版本 {
    Param (
        [switch]$该信息系作为任务结束语,
        [switch]$不应在首部留有过多的空白,
        [switch]$应仅作仿真演练
    )

    Write-_吴乐川管理某_npm_项目__内部通用工具__打印提示语__处理某批依赖包 `
        -固定格式的文本_第1片段 'npm i -D' `
        -固定格式的文本_第2片段 "${script:措辞_所谓特定版本}" `
        -固定格式的文本_第3片段 '研发' `
        -首选颜色 'DarkGreen' `
        -强调文字的字色 'Black' `
        -强调文字的底色 'DarkGreen' `
        -该信息系作为任务结束语:$该信息系作为任务结束语 `
        -不应在首部留有过多的空白:$不应在首部留有过多的空白 `
        -应仅作仿真演练:$应仅作仿真演练
}

function Write-吴乐川管理某_npm_项目__打印提示语__更新与研发相关的数据库 {
    Param (
        [switch]$该信息系作为任务结束语,
        [switch]$不应在首部留有过多的空白,
        [switch]$应仅作仿真演练
    )

    BEGIN {
        [string]${private:首选颜色} = 'DarkYellow'

        [string]${private:作为任务起始前提示语的文本全文} = $应仅作仿真演练 `
            ? '═══【仿真演练】═══ 更新与研发相关的数据库 ══════════════════════════════'
            : '══════════════════ 更新与研发相关的数据库 ══════════════════════════════'

        [string]${private:作为任务结束后提示语的文本全文} = $应仅作仿真演练 `
            ? '═══【仿真演练】═══ 更新与研发相关的数据库 ════════════════ 已结束 ══════' `
            : '══════════════════ 更新与研发相关的数据库 ════════════════ 已结束 ══════'
    }

    PROCESS {
        Write-_吴乐川管理某_npm_项目__内部通用工具__打印提示语__简单格式 `
            -作为任务起始前提示语的文本全文:"${private:作为任务起始前提示语的文本全文}" `
            -作为任务结束后提示语的文本全文:"${private:作为任务结束后提示语的文本全文}" `
            -首选颜色 "${private:首选颜色}" `
            -该信息系作为任务结束语:$该信息系作为任务结束语 `
            -不应在首部留有过多的空白:$不应在首部留有过多的空白
    }

    END {}
}

function Write-吴乐川管理某_npm_项目__打印提示语__其他交代 {
    Param (
        [switch]$该信息系作为任务结束语,
        [switch]$不应在首部留有过多的空白,
        [switch]$应仅作仿真演练
    )

    BEGIN {
        [string]${private:首选颜色} = 'Blue'

        [string]${private:作为任务起始前提示语的文本全文} = $应仅作仿真演练 `
            ? '═══【仿真演练】═══ 其他交代 ════════════════════════════════════════════'
            : '══════════════════ 其他交代 ════════════════════════════════════════════'

        [string]${private:作为任务结束后提示语的文本全文} = $应仅作仿真演练 `
            ? '═══【仿真演练】═══ 其他交代 ══════════════════════════════ 已结束 ══════' `
            : '══════════════════ 其他交代 ══════════════════════════════ 已结束 ══════'
    }

    PROCESS {
        Write-_吴乐川管理某_npm_项目__内部通用工具__打印提示语__简单格式 `
            -作为任务起始前提示语的文本全文:"${private:作为任务起始前提示语的文本全文}" `
            -作为任务结束后提示语的文本全文:"${private:作为任务结束后提示语的文本全文}" `
            -首选颜色 "${private:首选颜色}" `
            -该信息系作为任务结束语:$该信息系作为任务结束语 `
            -不应在首部留有过多的空白:$不应在首部留有过多的空白
    }

    END {}
}





function Assert-_吴乐川管理某_npm_项目__内部工具__检查给出的依赖包依赖类别词是否合规 {
    Param (
        [string]$消息前缀,
        [string]$待审查的量所隶属之范畴之描述,
        [string]$待审查的量之名称或描述,
        [string]$待审查的词,
        [switch]$待审查的量应称为属性而不称为入口参数
    )

    PROCESS {
        ${private:该词确系合规} = "$待审查的词" -In ${script:npm依赖包的依赖类别词表}


        if (-not ${private:该词确系合规}) {
            ${private:所涉量所隶属之范畴之范畴称谓} = $待审查的量应称为属性而不称为入口参数 ? '变量' : '入口参数集'
            ${private:所涉量之范畴称谓}           = $待审查的量应称为属性而不称为入口参数 ? '属性' : '入口参数'

            Write-Host  -F 'Red'     ('─' * 51)

            Write-Host  -F 'Red'     "${消息前缀}"

            if ($待审查的量应称为属性而不称为入口参数) {
                Write-Host  -NoNewline  -F 'Red'     "    ${private:所涉量所隶属之范畴之范畴称谓}"
                Write-Host  -NoNewline  -F 'Red'     '【'
                Write-Host  -NoNewline  -F 'White'   "${待审查的量所隶属之范畴之描述}"
                Write-Host  -NoNewline  -F 'Red'     '】'
                Write-Host
                Write-Host  -NoNewline  -F 'Red'     '    中的'
            } else {
                if ($false) {
                    Write-Host  -NoNewline  -F 'Red'     "    ${private:所涉量所隶属之范畴之范畴称谓}中的"
                } else {
                    Write-Host  -NoNewline               '    '
                }
            }


            Write-Host  -NoNewline  -F 'Red'     "${private:所涉量之范畴称谓}"
            Write-Host  -NoNewline  -F 'Red'     '【'
            Write-Host  -NoNewline  -F 'White'   "${待审查的量之名称或描述}"
            Write-Host  -NoNewline  -F 'Red'     '】'
            Write-Host

            Write-Host              -F 'Red'     '其取值只能是下列之一：'

            ${script:npm依赖包的依赖类别词表}.ForEach{ Write-Host  -F 'Green'  "    '$_'" }

            Write-Host              -F 'Red'     "而给出值的却是："
            Write-Host  -NoNewline  -F 'Red'     '    "'
            Write-Host  -NoNewline  -F 'Yellow'  "${待审查的词}"
            Write-Host  -NoNewline  -F 'Red'     '"。'
            Write-Host

            Write-Host  -F 'Red'     ('─' * 51)

            Write-Host
        }
    }

    END {
        ${private:该词确系合规}
    }
}





function ConvertTo-_吴乐川管理某_npm_项目__新装或升级依赖包__内部工具__将某批扼要配置集转换为规格化配置集 {
    Param(
        [Parameter(
            Mandatory = $false,
            ValueFromPipeline = $false
        )]
        [string]        $这批依赖包之依赖类别,

        [int]           $凡版本锁定之条目_其锁版原因单行等效汉字字数上限 = 25,

        [PSCustomObject]$这批依赖包之扼要配置集
    )



    BEGIN {
        [string]${private:本函数各消息之公用前缀} = '函数： ConvertTo-_吴乐川管理某_npm_项目__新装或升级依赖包__内部工具__将某批扼要配置集转换为规格化配置集'
        [string]${private:本函数各关于给出值不合规之消息之公用前缀} = "`e[0;91m${private:本函数各消息之公用前缀}："



        if (-not (
            Assert-_吴乐川管理某_npm_项目__内部工具__检查给出的依赖包依赖类别词是否合规 `
                -待审查的词 "$这批依赖包之依赖类别" `
                -消息前缀 "${private:本函数各消息之公用前缀}" `
                -待审查的量之名称或描述 '这批依赖包之依赖类别'
            )
        ) {
            throw "${private:本函数各关于给出值不合规之消息之公用前缀}参数【`e[0;97m这批依赖包之依赖类别`e[0;91m】取值不合规。"
        }



        if (-not (
            Assert-吴乐川判断某值为合规对象 `
                -消息前缀 "${private:本函数各消息之公用前缀}" `
                -待审查的量之名称或描述 '这批依赖包之扼要配置集' `
                -待审查的量 $这批依赖包之扼要配置集
            )
        ) {
            throw "${private:本函数各关于给出值不合规之消息之公用前缀}参数【`e[0;97m这批依赖包之扼要配置集`e[0;91m】取值不合规。"
        }





        # 在函数内部通称 “甲”、“乙” 可以有效防止复制粘贴的代码块中的变量名称忘记更正。
        [PSCustomObject[]]${private:甲类配置条目之列表} = @()
        [PSCustomObject[]]${private:乙类配置条目之列表} = @()

        [string]${private:将条目分类时的消息分隔线} = '━' * 66

        [string]${private:措辞_未注明须锁定版本范围的原因} = '~~~ 未注明须锁定版本范围的原因。 ~~~'
    }



    PROCESS {
        ForEach (${private:某依赖包之名称} in $这批依赖包之扼要配置集.keys) {
            ${private:某依赖包之原始扼要配置} = $这批依赖包之扼要配置集["${private:某依赖包之名称}"]



            [string]${private:某依赖包之版本配置} = ''
            [string]${private:某依赖包之锁定版本范围之原因} = "${private:措辞_未注明须锁定版本范围的原因}"



            if (${private:某依赖包之原始扼要配置}) {
                ${private:某依赖包之原始扼要配置之值类型} = ${private:某依赖包之原始扼要配置}.GetType()
                # Write-Host "`e[33m`"${private:某依赖包之名称}`"： `${private:某依赖包之原始扼要配置}.GetType() ${private:某依赖包之原始扼要配置之值类型}`e[0;0m"

                if (${private:某依赖包之原始扼要配置之值类型} -match '(\.string|^string)$') {

                    ${private:某依赖包之版本配置} = "${private:某依赖包之原始扼要配置}"

                } elseif (${private:某依赖包之原始扼要配置之值类型} -match '\bint(32)?|\bDouble$') {
                    # Write-Host "----- int 或 double -----"

                    ${private:某依赖包之版本配置} = "${private:某依赖包之原始扼要配置}"

                } elseif (${private:某依赖包之原始扼要配置之值类型} -match 'Object\[\]$') {

                    ${private:某依赖包之版本配置} = ${private:某依赖包之原始扼要配置}[0]
                    # Write-Host "`e[96m----- `${private:某依赖包之版本配置}: "${private:某依赖包之版本配置}"`e[0;0m"

                    if (${private:某依赖包之版本配置} -and ("${private:某依赖包之版本配置}" -ne 'latest')) {
                        # Write-Host "----- Object[]: 第 1 元素（即版本范围配置）为【真性值】，且不是文本 'latest' 。 -----"
                        ${private:某依赖包之锁定版本范围之原因} = ${private:某依赖包之原始扼要配置}[1]
                    } else {
                        # Write-Host "----- Object[]: 第 1 元素（即版本范围配置）或为【假性值】，或为文本 'latest' 。 -----"
                        if (${private:某依赖包之原始扼要配置}[1]) {
                            Write-Host              -F 'Red'     "${private:将条目分类时的消息分隔线}"

                            Write-Host              -F 'Red'     "解析【npm 软件包版本配置】时，发行某配置有误。"

                            Write-Host              -F 'Red'     "${private:将条目分类时的消息分隔线}"

                            Write-Host              -F 'Red'     "  依赖包"
                            Write-Host  -NoNewLine  -F 'Red'     "     `“ "
                            Write-Host  -NoNewLine  -F 'Yellow'  "${private:某依赖包之名称}"
                            Write-Host              -F 'Red'     " `”"
                            Write-Host              -F 'Red'     "  并未锁定安装版本之范围，却给出了相关原因。这不合规。"
                            Write-Host              -F 'Red'     "  凡不锁定版本的软件无所谓`“版本锁定之原因`”。"
                            Write-Host

                            Write-Host              -F 'Red'     "  给出的所谓`“原因`”如下："
                            Write-Host              -F 'Yellow'  "      `"$(${private:某依赖包之原始扼要配置}[1])`""

                            Write-Host
                            Write-Host              -F 'Red'     "  务必删去这一讲述`“原因`”的措辞。"

                            Write-Host              -F 'Red'     "${private:将条目分类时的消息分隔线}"

                            Throw '解析【npm 软件包版本配置】时，发行某配置有误。'
                        }
                    }

                }
            }



            if (-not ${private:某依赖包之版本配置}) {
                ${private:某依赖包之版本配置} = 'latest'
                ${private:某依赖包之锁定版本范围之原因} = ''
            }



            if ("${private:某依赖包之版本配置}" -eq 'latest') {
                ${private:甲类配置条目之列表} += @(
                    [PSCustomObject]@{
                        软件名称 = "${private:某依赖包之名称}"
                        命令主体 = "${private:某依赖包之名称}@latest"

                        版本配置 = 'latest' # 因为永远是 latest，故用处不大。
                        锁版原因 = '并不锁版。故谈不上什么原因。' # 仅充当“注释”，供程序员阅读。

                        包名字符数 = "${private:某依赖包之名称}".Length
                        命令主体之字符数 = "${private:某依赖包之名称}@latest".Length

                        # 为了在显示该命令主体时，令其与其余命令主体对齐，更为美观。
                        本包名相对于该批依赖包中名称最长者须补足的空白 = ''
                        本命令相对于该批命令中最长者须补足的空白 = ''
                    }
                )
            } else {
                ${private:乙类配置条目之列表} += @(
                    [PSCustomObject]@{
                        软件名称 = "${private:某依赖包之名称}"
                        命令主体 = "${private:某依赖包之名称}@${private:某依赖包之版本配置}"

                        版本配置 = "${private:某依赖包之版本配置}"
                        锁版原因 = "${private:某依赖包之锁定版本范围之原因}"

                        包名字符数 = "${private:某依赖包之名称}".Length
                        命令主体之字符数 = "${private:某依赖包之名称}@${private:某依赖包之版本配置}".Length

                        # 为了在显示该命令主体时，令其与其余命令主体对齐，更为美观。
                        本包名相对于该批依赖包中名称最长者须补足的空白 = ''
                        本命令相对于该批命令中最长者须补足的空白 = ''

                        锁版原因排版所得的逐行内容之列表 = [string[]]@()
                    }
                )
            }
        }





        [int]${private:甲类条目之总数} = ${private:甲类配置条目之列表}.Length

        # 进一步处理所有甲类条目。
        if (${private:甲类条目之总数} -gt 0) {
            [int]${private:甲类条目中最长包名之字符数} = 0
            [int]${private:甲类条目中最长命令之字符数} = 0



            ForEach (${private:某甲类条目} in ${private:甲类配置条目之列表}) {
                [int]${private:当下处理的甲类条目之包名字符数} = ${private:某甲类条目}.包名字符数
                [int]${private:当下处理的甲类条目之命令字符数} = ${private:某甲类条目}.命令主体之字符数

                if (${private:甲类条目中最长命令之字符数} -lt ${private:当下处理的甲类条目之命令字符数}) {
                    ${private:甲类条目中最长命令之字符数}  =  ${private:当下处理的甲类条目之命令字符数}
                }

                if (${private:甲类条目中最长包名之字符数} -lt ${private:当下处理的甲类条目之包名字符数}) {
                    ${private:甲类条目中最长包名之字符数}  =  ${private:当下处理的甲类条目之包名字符数}
                }
            }



            ForEach (${private:某甲类条目} in ${private:甲类配置条目之列表}) {
                [int]${private:当下处理的甲类条目之包名须补足之空格数} = ${private:甲类条目中最长包名之字符数} - ${private:某甲类条目}.包名字符数
                ${private:某甲类条目}.本包名相对于该批依赖包中名称最长者须补足的空白 = ' ' * ${private:当下处理的甲类条目之包名须补足之空格数}

                [int]${private:当下处理的甲类条目之命令须补足之空格数} = ${private:甲类条目中最长命令之字符数} - ${private:某甲类条目}.命令主体之字符数
                ${private:某甲类条目}.本命令相对于该批命令中最长者须补足的空白 = ' ' * ${private:当下处理的甲类条目之命令须补足之空格数}
            }
        }





        # 进一步处理所有乙类条目。
        [int]${private:乙类条目之总数} = ${private:乙类配置条目之列表}.Length

        if (${private:乙类条目之总数} -gt 0) {
            [int]${private:乙类条目中最长包名之字符数} = 0
            [int]${private:乙类条目中最长命令之字符数} = 0



            ForEach (${private:某乙类条目} in ${private:乙类配置条目之列表}) {
                [int]${private:当下处理的乙类条目之包名字符数} = ${private:某乙类条目}.包名字符数
                [int]${private:当下处理的乙类条目之命令字符数} = ${private:某乙类条目}.命令主体之字符数

                if (${private:乙类条目中最长命令之字符数} -lt ${private:当下处理的乙类条目之命令字符数}) {
                    ${private:乙类条目中最长命令之字符数}  =  ${private:当下处理的乙类条目之命令字符数}
                }

                if (${private:乙类条目中最长包名之字符数} -lt ${private:当下处理的乙类条目之包名字符数}) {
                    ${private:乙类条目中最长包名之字符数}  =  ${private:当下处理的乙类条目之包名字符数}
                }



                [string[]]${private:某乙类条目的锁版原因排版所得的逐行内容之列表} = @( '该软件锁定版本范围之原因：' )

                (
                    ${private:某乙类条目}.锁版原因 | ConvertTo-吴乐川将文本转换为多行文本 -单行等效汉字字数上限 $凡版本锁定之条目_其锁版原因单行等效汉字字数上限
                ).ForEach{
                    ${private:某乙类条目的锁版原因排版所得的逐行内容之列表} += "    $_"
                }

                ${private:某乙类条目}.锁版原因排版所得的逐行内容之列表 = ${private:某乙类条目的锁版原因排版所得的逐行内容之列表}
            }



            ForEach (${private:某乙类条目} in ${private:乙类配置条目之列表}) {
                [int]${private:当下处理的乙类条目之包名须补足之空格数} = ${private:乙类条目中最长包名之字符数} - ${private:某乙类条目}.包名字符数
                ${private:某乙类条目}.本包名相对于该批依赖包中名称最长者须补足的空白 = ' ' * ${private:当下处理的乙类条目之包名须补足之空格数}

                [int]${private:当下处理的乙类条目之命令须补足之空格数} = ${private:乙类条目中最长命令之字符数} - ${private:某乙类条目}.命令主体之字符数
                ${private:某乙类条目}.本命令相对于该批命令中最长者须补足的空白 = ' ' * ${private:当下处理的乙类条目之命令须补足之空格数}
            }
        }
    }



    END {
        @{
            这批依赖包之依赖类别 = $这批依赖包之依赖类别

            凡可安装最晚版本者                  = ${private:甲类配置条目之列表}
            凡可安装最晚版本者中包名最长者之字符数 = ${private:甲类条目中最长包名之字符数}
            凡可安装最晚版本者中命令最长者之字符数 = ${private:甲类条目中最长命令之字符数}

            凡须安装特定版本者                  = ${private:乙类配置条目之列表}
            凡须安装特定版本者中包名最长者之字符数 = ${private:乙类条目中最长包名之字符数}
            凡须安装特定版本者中命令最长者之字符数 = ${private:乙类条目中最长命令之字符数}
        }
    }
}





function Update-_吴乐川管理某_npm_项目__新装或升级依赖包__内部工具__处理多批依赖包的完整流程 {
    [CmdletBinding()]
    param (
        # 所谓“分拣”，即是把一个依赖包安装版本配置集中的条目分拣成两类，一类可自由安装最晚版本，另一类必须安装特定范围内的版本。

        [Parameter(
            Mandatory = $false,
            ValueFromPipeline = $true
        )]
        [PSCustomObject]$一批或若干批经过分拣后的依赖包的规格化配置集,

        [Parameter(
            Mandatory = $false,
            ValueFromPipeline = $false
        )]
        [switch]$应仅作仿真演练,

        [Parameter(
            Mandatory = $false,
            ValueFromPipeline = $false
        )]
        [switch]$安装之前应先删除旧有的_node_modules_文件夹,

        [Parameter(
            Mandatory = $false,
            ValueFromPipeline = $false
        )]
        [switch]$安装之前应先删除旧有的_package_lock_json_文件,

        [int]   $凡版本锁定之条目_其锁版原因单行等效汉字字数上限 # 默认值为 25 。
    )



    BEGIN {
        [string]${private:本函数各消息之公用前缀} = '函数： Update-_吴乐川管理某_npm_项目__新装或升级依赖包__内部工具__处理多批依赖包的完整流程'

        Remove-吴乐川管理某_npm_项目__删除当前文件夹下的_node_modules       -应仅作仿真演练:$应仅作仿真演练  -应执行该步骤:$安装之前应先删除旧有的_node_modules_文件夹
        Remove-吴乐川管理某_npm_项目__删除当前文件夹下的_package_lock_json  -应仅作仿真演练:$应仅作仿真演练  -应执行该步骤:$安装之前应先删除旧有的_package_lock_json_文件
    }



    PROCESS {
        ${private:某组经过分拣后的依赖包安装版本的规格化配置集} = $_

        [string]${private:本函数各关于给出值不合规之消息之公用前缀} = "`e[0;91m${private:本函数各消息之公用前缀}：给出的【`e[0;97m某组经过分拣后的依赖包安装版本的规格化配置集`e[0;91m】"





        if (-not (
                Assert-吴乐川判断某值为合规对象 `
                    -消息前缀 "${private:本函数各消息之公用前缀}" `
                    -待审查的量所隶属之范畴之描述 '$_' `
                    -待审查的量之名称或描述 '某组经过分拣后的依赖包安装版本的规格化配置集' `
                    -待审查的量 ${private:某组经过分拣后的依赖包安装版本的规格化配置集}
            )
        ) {
            throw "${private:本函数各关于给出值不合规之消息之公用前缀}取值不合规。"
        }



        [string]${private:这批依赖包之依赖类别} = ${private:某组经过分拣后的依赖包安装版本的规格化配置集}.这批依赖包之依赖类别

        # 在函数内部通称 “甲”、“乙” 可以有效防止复制粘贴的代码块中的变量名称忘记更正。
        [PSCustomObject]${private:甲类配置条目之列表}        = ${private:某组经过分拣后的依赖包安装版本的规格化配置集}.凡可安装最晚版本者
        [PSCustomObject]${private:乙类配置条目之列表}        = ${private:某组经过分拣后的依赖包安装版本的规格化配置集}.凡须安装特定版本者
        # [int]           ${private:甲类条目中最长包名之字符数} = ${private:某组经过分拣后的依赖包安装版本的规格化配置集}.凡可安装最晚版本者中包名最长者之字符数
        [int]           ${private:乙类条目中最长包名之字符数} = ${private:某组经过分拣后的依赖包安装版本的规格化配置集}.凡须安装特定版本者中包名最长者之字符数


        if (-not (
            Assert-_吴乐川管理某_npm_项目__内部工具__检查给出的依赖包依赖类别词是否合规 `
                -待审查的词 "${private:这批依赖包之依赖类别}" `
                -消息前缀 "${private:本函数各消息之公用前缀}" `
                -待审查的量所隶属之范畴之描述 '某组经过分拣后的依赖包安装版本的规格化配置集' `
                -待审查的量之名称或描述 '这批依赖包之依赖类别' `
                -待审查的量应称为属性而不称为入口参数
            )
        ) {
            throw "${private:本函数各关于给出值不合规之消息之公用前缀}中的【`e[0;97m这批依赖包之依赖类别`e[0;91m】取值不合规。"
        }



        if (-not ${private:甲类配置条目之列表}) {
            ${private:甲类配置条目之列表} = @()
        } else {
            if (-not (
                Assert-吴乐川判断某值为合规对象 `
                    -消息前缀 "${private:本函数各消息之公用前缀}" `
                    -待审查的量所隶属之范畴之描述 '某组经过分拣后的依赖包安装版本的规格化配置集' `
                    -待审查的量之名称或描述 '凡可安装最晚版本者（local:甲类配置条目之列表）' `
                    -待审查的量 ${private:甲类配置条目之列表} `
                    -待审查的量应称为属性而不称为入口参数
                )
            ) {
                throw "${private:本函数各关于给出值不合规之消息之公用前缀}中的属性【`e[0;97m凡可安装最晚版本者`e[0;91m】取值不合规。"
            }
        }



        if (-not ${private:乙类配置条目之列表}) {
            ${private:乙类配置条目之列表} = @()
        } else {
            if (-not (
                Assert-吴乐川判断某值为合规对象 `
                    -消息前缀 "${private:本函数各消息之公用前缀}" `
                    -待审查的量所隶属之范畴之描述 '某组经过分拣后的依赖包安装版本的规格化配置集' `
                    -待审查的量之名称或描述 '凡须安装特定版本者（local:乙类配置条目之列表）' `
                    -待审查的量 ${private:乙类配置条目之列表} `
                    -待审查的量应称为属性而不称为入口参数
                )
            ) {
                throw "${private:本函数各关于给出值不合规之消息之公用前缀}中的属性【`e[0;97m凡须安装特定版本者`e[0;91m】取值不合规。"
            }
        }





        [boolean]${private:这批依赖包为产品级依赖包} = ${private:这批依赖包之依赖类别} -eq ${script:npm依赖包的依赖类别词表}[0]





        if ($true) { # 尝试安装所有甲类依赖包。即版本不作锁定的依赖包。

            if (${private:这批依赖包为产品级依赖包}) {
                Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_产品级_均为最晚版本  -应仅作仿真演练:$应仅作仿真演练
            } else {
                Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_研发级_均为最晚版本  -应仅作仿真演练:$应仅作仿真演练
            }



            [int]${private:甲类条目之总数} = ${private:甲类配置条目之列表}.Length

            if (${private:甲类条目之总数} -eq 0) {

                Write-Host '暂无。'

            } else {

                [string]  ${private:命令行甲_主命令名} = 'npm'
                [string]  ${private:命令行甲_次命令名} = 'i'
                [string[]]${private:命令行甲_参数表} = @()

                [string]  ${private:命令行甲之文本呈现形式_首部} = 'npm  i'

                if (${private:这批依赖包为产品级依赖包}) {
                    ${private:命令行甲之文本呈现形式_首部} += ' `'
                } else {
                    ${private:命令行甲之文本呈现形式_首部} += '  -D `'
                    ${private:命令行甲_参数表} += @( '-D' )
                }

                Write-Host  "`e[0;92m${private:命令行甲之文本呈现形式_首部}`e[0;0m"





                [int]${private:当下处理的甲类条目之编号} = 1

                ForEach (${private:某甲类条目} in ${private:甲类配置条目之列表}) {
                    [string]  ${private:当下处理的甲类条目之命令主体}  = ${private:某甲类条目}.命令主体
                    [string]  ${private:当下处理的甲类条目之软件名称}  = ${private:某甲类条目}.软件名称
                    [string]  ${private:当下处理的甲类条目之版本配置}  = ${private:某甲类条目}.版本配置
                    [string]  ${private:当下处理的甲类条目须补足的空白} = ${private:某甲类条目}.本包名相对于该批依赖包中名称最长者须补足的空白



                    ${private:命令行甲_参数表} += @( "${private:当下处理的甲类条目之命令主体}" )



                    Write-Host  -NoNewline  "    ${private:当下处理的甲类条目须补足的空白}"
                    Write-Host  -NoNewline  "`e[0;42;30m${private:当下处理的甲类条目之软件名称}"
                    Write-Host  -NoNewline  "`e[0;46;30m@"
                    Write-Host  -NoNewline  "`e[0;44;30m${private:当下处理的甲类条目之版本配置}`e[0;0m"

                    if (${private:当下处理的甲类条目之编号} -lt ${private:甲类条目之总数}) {
                        Write-Host  -NoNewline  ' `'
                    } else {
                        Write-Host  -NoNewline  ';'
                    }

                    Write-Host



                    ${private:当下处理的甲类条目之编号}++
                } # ForEach 语句结束于此。





                Write-Host
                if (${private:这批依赖包为产品级依赖包}) {
                    Write-Host  -F 'DarkRed'  ('─' * ${script:分隔线统一长度等效英语字母数})
                } else {
                    Write-Host  -F 'DarkGreen'  ('─' * ${script:分隔线统一长度等效英语字母数})
                }
                Write-Host

                if ($应仅作仿真演练) {
                    Write-Host  -F 'DarkYellow'  '   【仿真演练】'
                    Write-Host  -F 'White'       "    ${private:命令行甲_主命令名}  ${private:命令行甲_次命令名}  ${private:命令行甲_参数表}"
                } else {
                    & ${private:命令行甲_主命令名} ${private:命令行甲_次命令名} ${private:命令行甲_参数表}
                }

            }



            if (${private:这批依赖包为产品级依赖包}) {
                Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_产品级_均为最晚版本  -应仅作仿真演练:$应仅作仿真演练  -该信息系作为任务结束语
            } else {
                Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_研发级_均为最晚版本  -应仅作仿真演练:$应仅作仿真演练  -该信息系作为任务结束语
            }
        }





        if ($true) { # 尝试安装所有乙类依赖包。即版本必须锁定在某一范围内的依赖包。

            if (${private:这批依赖包为产品级依赖包}) {
                Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_产品级_均为特定版本  -应仅作仿真演练:$应仅作仿真演练
            } else {
                Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_研发级_均为特定版本  -应仅作仿真演练:$应仅作仿真演练
            }



            [int]${private:乙类条目之总数} = ${private:乙类配置条目之列表}.Length

            if (${private:乙类条目之总数} -eq 0) {

                Write-Host '暂无。'

            } else {

                [string]  ${private:命令行乙_主命令名} = 'npm'
                [string]  ${private:命令行乙_次命令名} = 'i'
                [string[]]${private:命令行乙_参数表} = @()

                [string]  ${private:命令行乙之文本呈现形式_首部} = 'npm  i'

                if (${private:这批依赖包为产品级依赖包}) {
                    ${private:命令行乙之文本呈现形式_首部} += ' `'
                } else {
                    ${private:命令行乙之文本呈现形式_首部} += '  -D `'
                    ${private:命令行乙_参数表} += @( '-D' )
                }

                Write-Host  "`e[0;92m${private:命令行乙之文本呈现形式_首部}`e[0;0m"





                [int]${private:当下处理的乙类条目之编号} = 1

                ForEach (${private:某乙类条目} in ${private:乙类配置条目之列表}) {
                    [string]  ${private:当下处理的乙类条目之命令主体}  = ${private:某乙类条目}.命令主体
                    [string]  ${private:当下处理的乙类条目之软件名称}  = ${private:某乙类条目}.软件名称
                    [string]  ${private:当下处理的乙类条目之版本配置}  = ${private:某乙类条目}.版本配置
                    [string]  ${private:当下处理的乙类条目须补足的空白} = ${private:某乙类条目}.本包名相对于该批依赖包中名称最长者须补足的空白

                    [string[]]${private:当下处理的乙类条目的锁版原因排版所得的逐行内容之列表} = ${private:某乙类条目}.锁版原因排版所得的逐行内容之列表



                    ${private:命令行乙_参数表} += @( "${private:当下处理的乙类条目之命令主体}" )


                    [boolean]${private:应打印线框} = $true # ╔╦╗═╬╚╩╝║

                    [int]${private:线框总宽度} = ${script:分隔线统一长度等效英语字母数} - 10
                    [int]${private:线框内宽1} = ${private:乙类条目中最长包名之字符数} - 3
                    [int]${private:线框内宽2} = ${private:线框总宽度} - 5 - ${private:线框内宽1}

                    if (${private:应打印线框}) {
                        Write-Host

                        Write-Host  -NoNewline  -F DarkCyan  "    # ╔"
                        Write-Host  -NoNewline  -F DarkCyan  ('═' * ${private:线框内宽1})
                        Write-Host  -NoNewline  -F DarkCyan  '╦'
                        Write-Host  -NoNewline  -F DarkCyan  ('═' * ${private:线框内宽2})
                        Write-Host  -NoNewline  -F DarkCyan  '╗'
                        Write-Host

                        (1..2).ForEach{
                            Write-Host  -NoNewline  -F DarkCyan  "    # ║"
                            Write-Host  -NoNewline  -F DarkCyan  (' ' * ${private:线框内宽1})
                            Write-Host  -NoNewline  -F DarkCyan  '║'
                            Write-Host  -NoNewline  -F DarkCyan  (' ' * ${private:线框内宽2})
                            Write-Host  -NoNewline  -F DarkCyan  '║'
                            Write-Host
                        }

                        (1..1).ForEach{
                            Write-Host  -NoNewline  -F DarkCyan  "    # ║"
                            Write-Host  -NoNewline  -F DarkCyan  (' ' * ${private:线框内宽1})
                            Write-Host  -NoNewline  -F DarkCyan  ' '
                            Write-Host  -NoNewline  -F DarkCyan  (' ' * ${private:线框内宽2})
                            Write-Host  -NoNewline  -F DarkCyan  '║'
                            Write-Host
                        }
                    } else {
                        # Write-Host  -NoNewline  -F DarkCyan  "    #"
                        Write-Host
                    }

                    (${private:当下处理的乙类条目的锁版原因排版所得的逐行内容之列表}).ForEach{
                        if (-not ${private:应打印线框}) {

                            Write-Host              -F DarkCyan  "    # $_"

                        } else {

                            Write-Host  -NoNewline  -F DarkCyan  "    # ║ $_"

                            [int]${private:该行原因文本宽度等效英语字母数} = Get-吴乐川求一行文本视觉宽度等效英语字母数 "$_"
                            [int]${private:该行原因文本尾部须追加的空格数} = ${private:线框总宽度} - 5 - ${private:该行原因文本宽度等效英语字母数}

                            if (${private:该行原因文本尾部须追加的空格数} -gt 0) {
                                Write-Host  -NoNewline  -F DarkCyan  (' ' * (${private:该行原因文本尾部须追加的空格数}))
                                Write-Host  -NoNewline  -F DarkCyan  '║'
                            }

                            Write-Host

                        }
                    }

                    if (${private:应打印线框}) {
                        # (1..1).ForEach{
                        #     Write-Host  -NoNewline  -F DarkCyan  "    # ║"
                        #     Write-Host  -NoNewline  -F DarkCyan  (' ' * ${private:线框内宽1})
                        #     Write-Host  -NoNewline  -F DarkCyan  ' '
                        #     Write-Host  -NoNewline  -F DarkCyan  (' ' * ${private:线框内宽2})
                        #     Write-Host  -NoNewline  -F DarkCyan  '║'
                        #     Write-Host
                        # }

                        Write-Host  -NoNewline  -F DarkCyan  "    # ╚"
                        Write-Host  -NoNewline  -F DarkCyan  ('═' * ${private:线框内宽1})
                        Write-Host  -NoNewline  -F DarkCyan  '╦'
                        Write-Host  -NoNewline  -F DarkCyan  ('═' * ${private:线框内宽2})
                        Write-Host  -NoNewline  -F DarkCyan  '╝'
                        Write-Host
                    } else {
                        # Write-Host  -NoNewline  -F DarkCyan  "    #"
                        Write-Host
                    }

                    Write-Host  -NoNewline  "    ${private:当下处理的乙类条目须补足的空白}"

                    if ($true) {
                        Write-Host  -NoNewline  -F 'Yellow'                  "${private:当下处理的乙类条目之软件名称}"
                        Write-Host  -NoNewline  -F 'Red'                     '@'
                        Write-Host  -NoNewline  -F 'Black'  -B 'DarkYellow'  "${private:当下处理的乙类条目之版本配置}"
                    } else {
                        Write-Host  -NoNewline  "`e[0;103;30m${private:当下处理的乙类条目之软件名称}"
                        Write-Host  -NoNewline  "`e[0;43;30m@"
                        Write-Host  -NoNewline  "`e[0;101;30m${private:当下处理的乙类条目之版本配置}`e[0;0m"
                    }

                    if (${private:当下处理的乙类条目之编号} -lt ${private:乙类条目之总数}) {
                        Write-Host  -NoNewline  ' `'
                    } else {
                        Write-Host  -NoNewline  ';'
                    }

                    Write-Host



                    ${private:当下处理的乙类条目之编号}++
                } # ForEach 语句结束于此。





                Write-Host
                if (${private:这批依赖包为产品级依赖包}) {
                    Write-Host  -F 'DarkRed'  ('─' * ${script:分隔线统一长度等效英语字母数})
                } else {
                    Write-Host  -F 'DarkGreen'  ('─' * ${script:分隔线统一长度等效英语字母数})
                }
                Write-Host

                if ($应仅作仿真演练) {
                    Write-Host  -F 'DarkYellow'  '   【仿真演练】'
                    Write-Host  -F 'White'       "    ${private:命令行乙_主命令名}  ${private:命令行乙_次命令名}  ${private:命令行乙_参数表}"
                } else {
                    & ${private:命令行乙_主命令名} ${private:命令行乙_次命令名} ${private:命令行乙_参数表}
                }

            }



            if (${private:这批依赖包为产品级依赖包}) {
                Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_产品级_均为特定版本  -应仅作仿真演练:$应仅作仿真演练  -该信息系作为任务结束语
            } else {
                Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_研发级_均为特定版本  -应仅作仿真演练:$应仅作仿真演练  -该信息系作为任务结束语
            }
        }
    }



    END {}
}





function Update-吴乐川更新当前_npm_项目的所有批次的依赖包 {
    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory = $false,
            ValueFromPipeline = $true
        )]
        [PSCustomObject]$依赖包安装版本扼要配置集,

        [Parameter(
            Mandatory = $false,
            ValueFromPipeline = $false
        )]
        [switch]$应仅作仿真演练,

        [Parameter(
            Mandatory = $false,
            ValueFromPipeline = $false
        )]
        [switch]$安装之前应先删除旧有的_node_modules_文件夹,

        [Parameter(
            Mandatory = $false,
            ValueFromPipeline = $false
        )]
        [switch]$安装之前应先删除旧有的_package_lock_json_文件,

        [Parameter(
            Mandatory = $false,
            ValueFromPipeline = $false
        )]
        [int]   $凡版本锁定之条目_其锁版原因单行等效汉字字数上限 # 默认值为 25 。
    )



    BEGIN {
        [string]${private:本函数各消息之公用前缀} = '函数： Update-吴乐川更新当前_npm_项目的所有批次的依赖包'
        [string]${private:本函数各关于给出值不合规之消息之公用前缀} = "`e[0;91m${private:本函数各消息之公用前缀}：给出的【`e[0;97m当下正处理的依赖包安装版本扼要配置集`e[0;91m】"

        [PSCustomObject[]]${private:一批规格化的配置集} = @()
    }



    PROCESS {
        ${private:当下正处理的依赖包安装版本扼要配置集} = $_





        if (-not (
            Assert-吴乐川判断某值为合规对象 `
                -消息前缀 "${private:本函数各消息之公用前缀}" `
                -待审查的量所隶属之范畴之描述 '$_' `
                -待审查的量之名称或描述 '当下正处理的依赖包安装版本扼要配置集' `
                -待审查的量 ${private:当下正处理的依赖包安装版本扼要配置集}
            )
        ) {
            throw "${private:本函数各关于给出值不合规之消息之公用前缀}取值不合规。"
        }



        [string]        ${private:这批依赖包之依赖类别}      = ${private:当下正处理的依赖包安装版本扼要配置集}.这批依赖包之依赖类别
        [PSCustomObject]${private:这批依赖包之安装版本配置集} = ${private:当下正处理的依赖包安装版本扼要配置集}.这批依赖包之安装版本配置集



        if (-not (
            Assert-_吴乐川管理某_npm_项目__内部工具__检查给出的依赖包依赖类别词是否合规 `
                -消息前缀 "${private:本函数各消息之公用前缀}" `
                -待审查的量所隶属之范畴之描述 '当下正处理的依赖包安装版本扼要配置集' `
                -待审查的量之名称或描述 '这批依赖包之依赖类别' `
                -待审查的词 "${private:这批依赖包之依赖类别}" `
                -待审查的量应称为属性而不称为入口参数
            )
        ) {
            throw "${private:本函数各关于给出值不合规之消息之公用前缀}中的【`e[0;97m这批依赖包之依赖类别`e[0;91m】取值不合规。"
        }



        if (-not (
            Assert-吴乐川判断某值为合规对象 `
                -消息前缀 "${private:本函数各消息之公用前缀}" `
                -待审查的量所隶属之范畴之描述 '当下正处理的依赖包安装版本扼要配置集' `
                -待审查的量之名称或描述 '这批依赖包之安装版本配置集' `
                -待审查的量 ${private:这批依赖包之安装版本配置集} `
                -待审查的量应称为属性而不称为入口参数
            )
        ) {
            throw "${private:本函数各关于给出值不合规之消息之公用前缀}中的属性【`e[0;97m这批依赖包之安装版本配置集`e[0;91m】取值不合规。"
        }




        [PSCustomObject]${private:规格化的配置集} = ConvertTo-_吴乐川管理某_npm_项目__新装或升级依赖包__内部工具__将某批扼要配置集转换为规格化配置集 `
            -这批依赖包之依赖类别 "${private:这批依赖包之依赖类别}" `
            -这批依赖包之扼要配置集 ${private:这批依赖包之安装版本配置集}

        ${private:一批规格化的配置集} += @( ${private:规格化的配置集} )
    }



    END {
        ${private:一批规格化的配置集} | Update-_吴乐川管理某_npm_项目__新装或升级依赖包__内部工具__处理多批依赖包的完整流程 `
            -应仅作仿真演练:$应仅作仿真演练 `
            -安装之前应先删除旧有的_node_modules_文件夹:$安装之前应先删除旧有的_node_modules_文件夹 `
            -安装之前应先删除旧有的_package_lock_json_文件:$安装之前应先删除旧有的_package_lock_json_文件 `
            -凡版本锁定之条目_其锁版原因单行等效汉字字数上限 $凡版本锁定之条目_其锁版原因单行等效汉字字数上限
    }
}





# Export-ModuleMember `
#     -Function `
#         Write-吴乐川管理某_npm_项目__打印提示语__更新与研发相关的数据库, `
#         Write-吴乐川管理某_npm_项目__打印提示语__其他交代, `
#         Update-吴乐川更新当前_npm_项目的所有批次的依赖包
