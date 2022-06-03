# 应用示例：
#
# ```PowerShell
# Write-Host -F 'Yellow' '以下是在 package.json 中的特殊记载及其解释'
# Write-Host
# Write-Host '{'
# Write-吴乐川打印_JSON_键           -Indent 1 'overrides' -ValueIsObject
# Write-吴乐川打印_JSON_键           -Indent 2 'stylus' -ValueIsObject
# Write-Host
# Write-吴乐川打印_JSON_注释_并换行  -Indent 3 '// 实验证明，截止 2022-05-15 ，'
# Write-吴乐川打印_JSON_注释_并换行  -Indent 3 '// Stylus 依赖的 glob 不能采用最晚近的 v7.2.2 版。'
# Write-吴乐川打印_JSON_注释_并换行  -Indent 3 '// glob 不能采用 v7.2.1 版不存在。'
# Write-吴乐川打印_JSON_注释_并换行  -Indent 3 '// 故最高仅能采用 v7.2.0 版。'
# Write-吴乐川打印_JSON_键           -Indent 3 'glob'
# Write-吴乐川打印_JSON_值_文本型    -IsValueOfLastKey '7.2.0'
# Write-吴乐川打印_JSON_某字典结束   -Indent 2
# Write-吴乐川打印_JSON_某字典结束   -Indent 1
# Write-Host '}'
# ```



function Write-吴乐川打印_JSON_键 {
    Param (
        [int]   $IndentationLevel,
        [string]$Key,
        [switch]$ValueIsObject,
        [switch]$ValueIsArray
    )

    if ($IndentationLevel -gt 0) {
        (1..$IndentationLevel).ForEach{ Write-Host -No '    ' }
    }

    Write-Host -No    '"'
    Write-Host -No -F 'DarkGreen' "$Key"
    Write-Host -No    '": '

    if ($ValueIsObject -or $ValueIsArray) {
        if ($ValueIsObject) {
            Write-Host    '{'
        } else {
            Write-Host    '['
        }
    }
}



function Write-吴乐川打印_JSON_某字典结束 {
    Param (
        [int]$IndentationLevel
    )

    if ($IndentationLevel -gt 0) {
        (1..$IndentationLevel).ForEach{ Write-Host -No '    ' }
    }

    Write-Host '}'
}



function Write-吴乐川打印_JSON_某列表结束 {
    Param (
        [int]$IndentationLevel
    )

    if ($IndentationLevel -gt 0) {
        (1..$IndentationLevel).ForEach{ Write-Host -No '    ' }
    }

    Write-Host ']'
}



function Write-吴乐川打印_JSON_值_文本型 {
    Param (
        [switch]$IsValueOfLastKey,
        [string]$valueOfString
    )

    Write-Host -No    '"'
    Write-Host -No -F 'Cyan' "$valueOfString"
    Write-Host -No    '"'
    if (-not $IsValueOfLastKey) {
        Write-Host -No ','
    }
    Write-Host
}



function Write-吴乐川打印_JSON_注释_并换行 {
    Param (
        [int]   $IndentationLevel,
        [string]$comment
    )

    if ($IndentationLevel -gt 0) {
        (1..$IndentationLevel).ForEach{ Write-Host -No '    ' }
    }

    # Write-Host  -No  -F 'DarkGray'  '// '
    Write-Host       -F 'Red'       "$comment"
}
