<link rel="stylesheet" href="./文档集/文档的样式/wulechuan-styles-for-html-via-markdown--vscode.default.min.css">



# npm 包研发项目辅助性命令行工具集

> 中国人——特别是汉族人，理应坚持广泛、规范地使用汉语。凡非必要之情形不说外国话、不用外国字。此乃天经地义！然则每当必要，亦不排斥采用外国之语言。不妨 **博世界之学问，养中国之精神** 。
>
> 本人亦支持少数民族坚持采用自己民族的传统语言。仍须强调，凡中国人，皆应会用汉语、积极使用汉语，此乃中华各民族之大一统之必由。




## NPM 页

<dl>
<dt>NPM 包名</dt>
<dd>

[@wulechuan/cli-scripts--npm-project-helpers](https://www.npmjs.com/package/@wulechuan/cli-scripts--npm-project-helpers)

</dd>
<dt>作者</dt>
<dd><p>南昌吴乐川</p></dd>
</dl>

## 源代码仓库

| <span style="display:inline-block;width:10em;">提供仓库服务之组织</span> | <span style="display:inline-block;width:10em;">仓库组织之国别</span> | 仓库地址 |
| ------------- | :----------: | ------- |
| 码云           | 中华人民共和国 | [https://gitee.com/nanchang-wulechuan/wulechuan--cli-scripts--npm-project-helpers.git](https://gitee.com/nanchang-wulechuan/wulechuan--cli-scripts--npm-project-helpers.git) |
| 阿里云之代码仓库 | 中华人民共和国 | [https://code.aliyun.com/wulechuan/wulechuan--cli-scripts--npm-project-helpers.git](https://code.aliyun.com/wulechuan/wulechuan--cli-scripts--npm-project-helpers.git) |
| GitHub         | 美           | [https://github.com/wulechuan/wulechuan--cli-scripts--npm-project-helpers.git](https://github.com/wulechuan/wulechuan--cli-scripts--npm-project-helpers.git) |


## 简介

### 言简意赅版

本工具集之主体采用 2 种命令行环境之语言（即 PowerShell 语言和 Bash 语言）编写，仅运行与于命令行环境中。它们用以辅助任何 npm 项目构建适用其环境的命令行实用工具。而**构建出的这些实用工具用以“贪婪地”升级该 npm 项目的各依赖包之版本。本工具集亦随附了这些实用工具的雏形，稍加修改即可运转，颇为方便。**

特别的，本工具集安装伊始，其内建的 JavaScript 程序会还自动为这些实用工具设计配套的 VSCode 任务，遂更为方便。

**本工具集有“实用价值不高”之嫌，但它们满足了我个人的癖好。**





### 冗长版

#### 由来

本人研发 npm 项目时，常常会“贪婪地”升级各种依赖包的版本。

-   于其中一些依赖包，即便是进行了主版本的升迁，我们自己的 npm 项目也会“很幸运的”照常运转。
-   但另有一些依赖包，如果升级至过于晚近的版本，则我们字节的 npm 项目将无法运转。遂应令这些依赖包之版本保持在某个较旧的版本（范围）。换句话说，这些包的版本有上限约束。

在追求上述形式时，会遇到以下问题：

-   当须贪婪地升级各种依赖包时， `npm up` 命令是达不到目的的，因为该命令较为保守。

-   当一股脑采用 `npm i 包名@latest` 时，又无法妥善处理那些须遵守版本上限约束的依赖包。

故本人在几乎所有本人私有的或有本人主导的 npm 项目中都随附了专门的命令行脚本，用以分门别类依照不同策略（贪婪或守限）管理这些依赖包的**安装任务**。久而久之，提炼成形，汇于本工具集中。以期提升这类工具的自动化水平，减少重复劳动。


#### 特点与价值


诚然，完成上述任务（即指贪婪或守限地升级依赖包）完全可以撰写一些简朴实用的脚本做到。**总共也要不了几行命令。** 例如：

```bash
# Bash 或 PowerShell

# 下方这些例子纯属虚构。
# 还需注意， npm 不允许包名包含我汉字！

npm i    甲@latest 乙@latest 丙@latest
npm i -D 戊@latest 已@latest

npm i    庚@1.2.3 辛@4.5.6
npm i -D 壬@3.2.1 鬼@9.8.7
```

其实本工具集的早期雏形就是这样的简易脚本。

但当上述多个命令顺次执行时，它们的输出既不够美观，也不可一目了然。于我这种吹毛求疵的人而言，此种“简约之美”往往是不可接受的。为使命令行工具的界面信息美观、易读，也为了便于我和“*潜在的合作者*”交流或交接，我在日常研学中时不时会在“无关痛痒”的美观方面下功夫，逐渐形成了一些辅助性工具，汇集于此。如你所猜想的一般，本工具集侧重为命令行之输出信息做装点，提供相对美观、易读的界面信息，而鲜少有复杂的任务逻辑。何况所谓“核心”的任务逻辑是因项目而异的，并非某通用工具力所能及。

因此，**本工具集有“实用价值不高”之嫌，但它们满足了我个人的癖好。**

须注意，本套工具之主体均非采用 JavaScript 语言族编写，而是采用 2 种命令行环境之语言编写，即 PowerShell 语言和 Bash 语言。**故本工具集之主体仅用于（多种）命令行环境。**


虽然本套工具之主体并非 JavaScript 程序，但本工具集仍内建了一些有价值的 JavaScript 程序。每当其他 npm 包（暂称**甲**）安装完本工具集之际，本工具集内建的那些 JavaScript 程序会自动改动甲的环境配置，例如：

-   将本工具集随附的**实用工具之雏形**复制到甲中的特定文件夹内（稍加修改即可运转）。
-   构建一些实用的 VSCode 任务，以配合上述实用工具。

以上种种许令甲更方便的利用本工具集。




## 安装与使用

### 安装

本工具集运行在命令行环境（PowerShell 或【类 Bash】），且**专门服务于各色 npm 项目，且其自动化安装和部署之功能也有赖于 npm** 。自然的，本人令本工具集依托 npm 发行，故安装本工具集也不应借助 npm 。

脱离 npm 来安装本工具集之方法无实用价值。从略。

依托 npm 服务框架来安装本工具集之步骤如下：

1.  确保你的计算机或你的容器（例如 Docker Container）中已经安装了 Nodejs。见《[Nodejs 官方下载页](https://nodejs.org/zh-cn/download/)》。

1.  虽然 Nodejs 往往会随附一个名为 npm 的工具。但是，一来此事并不一定（例如 Ubuntu 环境的 Nodejs 有可能并不附带 npm）；二来即便 Nodejs 附带了一份 npm，该 npm 之版本也未必最新的。**故而，推荐于此时机安装 _最新版_ 的 npm 。**

    - 以下方法假定你所安装的 Nodejs 确实随附了一份 npm，并利用该随附的、较旧版本的 npm 来安装最新版的 npm 。

        ```bash
        # Bash 或 PowerShell
        npm  i  -g  npm
        ```

    - 以下假定在 Ubuntu 系统安装 Nodejs 之后， npm 仍未安装。从零开始安装 npm 的步骤如下。

        ```bash
        apt  update
        apt  install  npm
        ```


1.  借助 `cd` 命令来到你的项目**根**文件夹，再用以下命令将你的项目初始化成一个 npm 项目。

    ```bash
    # Bash 或 PowerShell
    npm  init  -y
    ```

    > 具体而言，npm 将在该文件夹内创建一个文件，名为“ `package.json` ”，仅此而已。该文件是一切 npm 项目的关键配置，也是该类项目的本质特征。

1.  借助 npm 正式安装本工具集。

    ```bash
    # Bash 或 PowerShell
    npm  i  -D  @wulechuan/cli-scripts--npm-project-helpers
    ```

    此时，本工具集内建的 JavaScript 程序将尝试自动配置你的项目（暂称**甲**）。如下：

    -  如果甲中尚无 `.vscode/tasks.json` 这一文件，本工具集将创建之。
    -  修订 `<甲>/.vscode/tasks.json` ，使得甲具备几个专门用于调用本工具集之命令行脚本的【任务】。
    -  本工具会尽量将一个采用 PowerShell 语言撰写的命令行脚本文件复制到 `<甲>/用于研发阶段的命令行工具集/PowerShell/` 这一文件夹内。如果此文件夹中原先已有同名脚本文件，则这些旧文件将得到保留，不会被覆盖。**但自本工具集之 JavaScript 程序会尽可能修订业已存在的旧有命令行脚本文件。**
    -  本工具会尽量将一个采用 Bash 语言撰写的命令行脚本文件复制到 `<甲>/用于研发阶段的命令行工具集/bash/` 这一文件夹内。如果此文件夹中原先已有同名脚本文件，则这些旧文件将得到保留，不会被覆盖。**但自本工具集之 JavaScript 程序会尽可能修订业已存在的旧有命令行脚本文件。**


### 使用

#### 在 PowerShell 环境中运行本工具集

本说明书中针对 PowerShell 环境给出的示例（见下文）较简易，以突出要素。

而本工具集随附的 JavaScript 程序会自动在你的 npm 项目的特定文件夹中产生一个 PowerShell 脚本文件，该文件之内容远比下例更复杂、更实用。可直接阅读并修订之。

> 另，*本工具集自用之 PowerShell 脚本文件* 与上述自动产生的 PowerShell 脚本文件高度相似，亦可参阅：
>
> -   《[./用于研发阶段的命令行工具集/PowerShell/Update-更新所有-npm-依赖包至允许范围内的最新版本.ps1](./用于研发阶段的命令行工具集/PowerShell/Update-更新所有-npm-依赖包至允许范围内的最新版本.ps1)》。



##### PowerShell 环境中的简易用法示例

```ps1
[string]${script:吴乐川的模块的路径} = '.\node_modules\@wulechuan\cli-scripts--npm-project-helpers\源代码\发布的源代码\PowerShell'

Import-Module  "${script:吴乐川的模块的路径}\吴乐川-数据处理-文本.psm1"
Import-Module  "${script:吴乐川的模块的路径}\吴乐川-管理某-npm-项目的依赖包等资源.psm1"



${private:本产品所有的_npm_依赖包的安装版本配置总表} = @(
    @{
        # 取 '本产品拟囊括这些软件之整体或部分' ，
        # 说白了就是在安装这些依赖包时，会采取该命令：
        #     npm  install ，而不带 --save-dev 之参数。
        这批依赖包之依赖类别 = '本产品拟囊括这些软件之整体或部分'

        这批依赖包之安装版本配置集 = @{
            'chalk'        = @('^4',  '新买的粉笔受潮了。')
            'fs-extra'     = $null
            'jsonc-parser' = $null
            'vue'          = @('=2.6.14',  '本项目暂不打算迁移至 Vuejs 3.x 。')
        }
    }



    @{
        # 取 '本产品仅会在研发阶段借助这些软件' ，
        # 说白了就是在安装这些依赖包时，会采取该命令：
        #     npm  install  --save-dev 。
        这批依赖包之依赖类别 = '本产品仅会在研发阶段借助这些软件'

        这批依赖包之安装版本配置集 = @{
            '@wulechuan/cli-scripts--git-push' = $null
            'eslint'                           = '1.2.3'
            'gulp'                             = @('3',  '这是一个很旧的项目，采用了 Gulpjs 3.x 。')
        }
    }
)



${private:本产品所有的_npm_依赖包的安装版本配置总表} | Update-吴乐川更新当前_npm_项目的所有批次的依赖包 -安装之前应先删除旧有的_node_modules_文件夹
```



#### 在【类 Bash】环境中运行本工具


本说明书中针对 bash 环境给出的示例（见下文）较简易，以突出要素。

而本工具集随附的 JavaScript 程序会自动在你的 npm 项目的特定文件夹中产生一个 Bash 脚本文件，该文件之内容略比下例复杂、实用。可直接阅读并修订之。

实事求是地说，目前本工具集之 Bash 版本，自动化程度很低。因此，其他 Bash 程序对本工具集提供的 Bash 加以利用时，鲜有精彩可言，仅限于调用若干由本工具集提供的功能简朴之函数，以美化输出信息。以上述自动产生的 Bash 脚本文件为例，其中的逻辑并不比下例复杂多少。该自动产生的 .sh 文件的整个内容可谓“平淡无奇”。 **所幸就在“自动”二字。**

> 另，*本工具集自用之 Bash 脚本文件* 与上述自动产生的 Bash 脚本文件高度相似，亦可参阅：
>
> -   《[./用于研发阶段的命令行工具集/bash/update-更新所有-npm-依赖包至允许范围内的最新版本.sh](./用于研发阶段的命令行工具集/bash/update-更新所有-npm-依赖包至允许范围内的最新版本.sh)》。



##### 【类 Bash】环境中的用法示例

```bash
#!/bin/bash

source  './源代码/发布的源代码/bash/吴乐川-管理某-npm-项目的依赖包等资源.sh'





# ───────────────────────────────────────────────────────────────

Remove-吴乐川管理某_npm_项目__删除当前文件夹下的_node_modules       --should-run-this-task true
Remove-吴乐川管理某_npm_项目__删除当前文件夹下的_package_lock_json  --should-run-this-task true





# ───────────────────────────────────────────────────────────────

Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_产品级_均为最晚版本

npm  i \
    chalk@latest \
    fs-extra@latest \
    jsonc-parser@latest

Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_产品级_均为最晚版本  --is-ending

# ───────────────────────────────────────────────────────────────

Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_产品级_均为特定版本

echo  '暂无。'

Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_产品级_均为特定版本  --is-ending

# ───────────────────────────────────────────────────────────────

Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_研发级_均为最晚版本

npm  i  -D \
    @wulechuan/cli-scripts--git-push@latest \
    eslint@latest

Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_研发级_均为最晚版本  --is-ending

# ───────────────────────────────────────────────────────────────

Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_研发级_均为特定版本

echo  '暂无。'

Write-吴乐川管理某_npm_项目__打印提示语__新装或升级某批依赖包_研发级_均为特定版本  --is-ending





# ───────────────────────────────────────────────────────────────

Write-吴乐川管理某_npm_项目__打印提示语__更新与研发相关的数据库

if true; then

    echo  '暂无。'

else

    # npx  browserslist@latest  --update-db

fi





# ───────────────────────────────────────────────────────────────

Write-吴乐川管理某_npm_项目__打印提示语__其他交代

if true; then

    echo  '暂无。'

else

    # 此处不妨做些关于当前 npm 项目的必要交代。例如注意事项、关键步骤等等。

fi

```





## 许可证类型

WTFPL

> 注意：
>
> 我未研究过许可证的约束。因此姑且声明为 WTFPL 类型。但实际上该许可证类型可能与我采用的开源模块有冲突。

