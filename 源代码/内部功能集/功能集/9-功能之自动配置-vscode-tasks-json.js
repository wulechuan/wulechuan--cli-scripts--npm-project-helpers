/**
 * https://code.visualstudio.com/docs/editor/tasks-appendix#_schema-for-tasksjson
 *
 * @typedef {import('../types/microsoft-vscode-tasks').TaskConfiguration} 范_vscode_taskJSON
 * @typedef {import('../types/microsoft-vscode-tasks').TaskDescription} 范_vscode_任务项
 */

/**
 * @typedef {import('chalk').ChalkInstance} 范_粉笔工具
 */

/**
 * @typedef {import('node:path')} 范_路径工具
 */

/**
 * @typedef {import('fs-extra')} 范_文件系统工具之扩展版
 */

/**
 * @typedef {import('jsonc-parser')} 范_微软_jsonc_处理机
 * @typedef {import('jsonc-parser').ParseError} 范_微软_jsonc_处理机_解析结果之错误记载
 * @typedef {import('jsonc-parser').Node} 范_微软_jsonc_处理机_解析出的原始节点
 */

// /**
//  * @typedef {typeof import('jsonc').jsonc} 范_jsonc_的操作工具_默认版
//  * @typedef {typeof import('jsonc').jsonc.safe} 范_jsonc_的操作工具_错误返回而非抛出之版
//  */

/**
 * @typedef {import('../辅助工具集')} 范_本工具集随附之辅助工具集
 */

/**
 * @typedef {import('./0-常量表')} 范_本工具集之内部常量表
 */

/**
 * @typedef {import('../../../package.json')} 范_本工具集自身的_packageJSON
 */

/**
 * @typedef {import('../../../package.json')} 范_通用的_packageJSON # 这里假借本工具集自身的 package.json 来表征通用 package.json 的类型定义。因为真正的通用类型定义暂未找到，而假借的这一类型定义也够用了。
 */





/**
 * @param {object}                        配置项集
 *
 * @param {boolean}                       配置项集.应开启调试功能
 *
 * @param {范_粉笔工具}                   配置项集.粉笔工具
 * @param {范_路径工具}                   配置项集.路径工具
 * @param {范_文件系统工具之扩展版}       配置项集.文件系统工具之扩展版
 * @param {范_微软_jsonc_处理机}          配置项集.微软_jsonc_处理机
 *
 * @param {范_本工具集随附之辅助工具集}   配置项集.本工具集随附之辅助工具集
 * @param {范_本工具集之内部常量表}       配置项集.本工具集之内部常量表
 *
 * @param {string}                        配置项集.本工具集一切命令行消息之前缀
 * @param {string}                        配置项集.本工具集自身根文件夹之完整路径
 * @param {范_本工具集自身的_packageJSON} 配置项集.本工具集自身的_packageJSON
 *
 * @param {string}                        配置项集.视作须为其安装本工具集的_npm_项目的根文件的完整路径
 * @param {范_通用的_packageJSON}         配置项集.视作须为其安装本工具集的_npm_项目的_packageJSON
 * @param {string}                        配置项集.视作_dotvscode_文件夹的文件夹之相对路径
 * @param {string}                        配置项集.用于研发阶段的命令行工具集_这一文件夹之相对路径
 * @param {boolean}                       配置项集.发布本工具集随附的命令行脚本时_个别脚本文件应发布在目标项目之根文件夹下
 * @param {boolean}                       配置项集.vscode_tasksJSON_纵使有变动也不应制作备份文件
 *
 * @returns {Promise<any>}
 */
module.exports = function 自动配置_vscode_tasksJSON ({
    应开启调试功能,

    粉笔工具,
    路径工具,
    文件系统工具之扩展版,
    微软_jsonc_处理机,
    // jsonc_的操作工具_默认版,               // 已废弃，改用微软的 jsonc-parser 。
    // jsonc_的操作工具_错误返回而非抛出之版, // 已废弃，改用微软的 jsonc-parser 。

    本工具集随附之辅助工具集,

    本工具集一切命令行消息之前缀,
    本工具集自身根文件夹之完整路径,
    本工具集自身的_packageJSON,

    视作须为其安装本工具集的_npm_项目的根文件的完整路径,
    视作须为其安装本工具集的_npm_项目的_packageJSON,
    视作_dotvscode_文件夹的文件夹之相对路径,
    用于研发阶段的命令行工具集_这一文件夹之相对路径,
    // 发布本工具集随附的命令行脚本时_个别脚本文件应发布在目标项目之根文件夹下,
    vscode_tasksJSON_纵使有变动也不应制作备份文件,
} = {}) {
    应开启调试功能 && console.debug('>>>> 自动配置_vscode_tasksJSON <<<<')

    if (typeof 视作须为其安装本工具集的_npm_项目的根文件的完整路径 !== 'string' || !视作须为其安装本工具集的_npm_项目的根文件的完整路径.trim()) {
        return Promise.reject(new Error(`${
            本工具集一切命令行消息之前缀
        }\n    ${
            粉笔工具.red(`没有给出【${
                粉笔工具.yellow('视作须为其安装本工具集的_npm_项目的根文件的完整路径')
            }】。`)
        }\n`))
    }

    return Promise.all([
        import('./0-常量表.js'),
    ]).then(([
        本工具集之内部常量表_模块,
    ]) => {
        应开启调试功能 && console.debug('>>>> 自动配置_vscode_tasksJSON then <<<<')

        /** @type {范_本工具集之内部常量表} */
        const 本工具集之内部常量表 = 本工具集之内部常量表_模块.default

        return vscode_tasksJSON_自动配置功能之主体({
            粉笔工具,
            路径工具,
            文件系统工具之扩展版,
            微软_jsonc_处理机,

            本工具集随附之辅助工具集,
            本工具集之内部常量表,

            本工具集一切命令行消息之前缀,
            本工具集自身根文件夹之完整路径,
            本工具集自身的_packageJSON,

            视作须为其安装本工具集的_npm_项目的根文件的完整路径,
            视作须为其安装本工具集的_npm_项目的_packageJSON,
            视作_dotvscode_文件夹的文件夹之相对路径,
            用于研发阶段的命令行工具集_这一文件夹之相对路径,
            // 发布本工具集随附的命令行脚本时_个别脚本文件应发布在目标项目之根文件夹下,
            vscode_tasksJSON_纵使有变动也不应制作备份文件,
        })
    })
}





/**
 * @param {object}                        配置项集
 *
 * @param {范_粉笔工具}                   配置项集.粉笔工具
 * @param {范_路径工具}                   配置项集.路径工具
 * @param {范_文件系统工具之扩展版}       配置项集.文件系统工具之扩展版
 * @param {范_微软_jsonc_处理机}          配置项集.微软_jsonc_处理机
 *
 * @param {范_本工具集随附之辅助工具集}   配置项集.本工具集随附之辅助工具集
 * @param {范_本工具集之内部常量表}       配置项集.本工具集之内部常量表
 *
 * @param {string}                        配置项集.本工具集一切命令行消息之前缀
 * @param {string}                        配置项集.本工具集自身根文件夹之完整路径
 * @param {范_本工具集自身的_packageJSON} 配置项集.本工具集自身的_packageJSON
 *
 * @param {string}                        配置项集.视作须为其安装本工具集的_npm_项目的根文件的完整路径
 * @param {范_通用的_packageJSON}         配置项集.视作须为其安装本工具集的_npm_项目的_packageJSON
 * @param {string}                        配置项集.视作_dotvscode_文件夹的文件夹之相对路径
 * @param {string}                        配置项集.用于研发阶段的命令行工具集_这一文件夹之相对路径
 * @param {boolean}                       配置项集.发布本工具集随附的命令行脚本时_个别脚本文件应发布在目标项目之根文件夹下
 * @param {boolean}                       配置项集.vscode_tasksJSON_纵使有变动也不应制作备份文件
 *
 * @returns {Promise<any>}
 */
function vscode_tasksJSON_自动配置功能之主体 ({
    粉笔工具,
    路径工具,
    文件系统工具之扩展版,
    微软_jsonc_处理机,

    本工具集随附之辅助工具集,
    本工具集之内部常量表,

    本工具集一切命令行消息之前缀,
    本工具集自身根文件夹之完整路径,
    本工具集自身的_packageJSON,

    视作须为其安装本工具集的_npm_项目的根文件的完整路径,
    视作须为其安装本工具集的_npm_项目的_packageJSON,
    视作_dotvscode_文件夹的文件夹之相对路径,
    用于研发阶段的命令行工具集_这一文件夹之相对路径,
    // 发布本工具集随附的命令行脚本时_个别脚本文件应发布在目标项目之根文件夹下,
    vscode_tasksJSON_纵使有变动也不应制作备份文件,
}) {
    console.info(`\n\n\n\n\n${
        本工具集一切命令行消息之前缀
    } ${
        粉笔工具.bgGreenBright.black(' 现在开始配置 VSCode 的任务集（ tasks.json ）')
    } 。\n`)

    const {
        将JSON中单个属性或成员配置为新值,
        求当前时间之文本_可用于文件系统之文件名,
    } = 本工具集随附之辅助工具集

    const {
        用于研发阶段的命令行工具集_这一文件夹之相对路径_默认值,
    } = 本工具集之内部常量表



    if (typeof 用于研发阶段的命令行工具集_这一文件夹之相对路径 !== 'string' || !用于研发阶段的命令行工具集_这一文件夹之相对路径.trim()) {
        用于研发阶段的命令行工具集_这一文件夹之相对路径 = 用于研发阶段的命令行工具集_这一文件夹之相对路径_默认值
    }

    const 用于研发阶段的命令行工具集_这一文件夹之相对路径_各级片段之列表 = 用于研发阶段的命令行工具集_这一文件夹之相对路径.split(/[\\/]/).filter(路径片段 => !!路径片段)
    const 用于研发阶段的命令行工具集_这一文件夹之相对路径_用于调用某_PowerShell = 用于研发阶段的命令行工具集_这一文件夹之相对路径_各级片段之列表.join('\\')
    const 用于研发阶段的命令行工具集_这一文件夹之相对路径_用于调用某_bash = 用于研发阶段的命令行工具集_这一文件夹之相对路径_各级片段之列表.join('/')



    if (typeof 视作_dotvscode_文件夹的文件夹之相对路径 !== 'string' || !视作_dotvscode_文件夹的文件夹之相对路径.trim()) {
        视作_dotvscode_文件夹的文件夹之相对路径 = '.vscode'
    }

    const vscode_tasksJSON_文件所处之文件夹之完整路径 = 路径工具.join(
        视作须为其安装本工具集的_npm_项目的根文件的完整路径,
        视作_dotvscode_文件夹的文件夹之相对路径
    )

    const vscode_tasksJSON_文件之完整路径 = 路径工具.join(
        vscode_tasksJSON_文件所处之文件夹之完整路径,
        'tasks.json'
    )





    console.log(`\n${
        本工具集一切命令行消息之前缀
    }\n    vscode_tasksJSON_文件之完整路径：\n    "${
        粉笔工具.green(vscode_tasksJSON_文件之完整路径)
    }"\n`)



    let 旧有_vscode_tasksJSON_文件确实存在 = false
    if (文件系统工具之扩展版.existsSync(vscode_tasksJSON_文件之完整路径)) {
        const vscode_tasksJSON_文件描述符 = 文件系统工具之扩展版.statSync(vscode_tasksJSON_文件之完整路径)
        if (vscode_tasksJSON_文件描述符.isFile()) {
            旧有_vscode_tasksJSON_文件确实存在 = true
        }
    }



    /** @type {Buffer | null} */
    let 旧有_vscode_tasksJSON_文件之缓冲数据块 = null

    /** @type {string} */
    let 旧有_tasksJSON_内容全文 = ''

    if (旧有_vscode_tasksJSON_文件确实存在) {
        旧有_vscode_tasksJSON_文件之缓冲数据块 = 文件系统工具之扩展版.readFileSync(vscode_tasksJSON_文件之完整路径)
        旧有_tasksJSON_内容全文 = 旧有_vscode_tasksJSON_文件之缓冲数据块.toString()
    }

    return Promise.resolve({
        旧有_vscode_tasksJSON_文件之缓冲数据块,
        旧有_tasksJSON_内容全文,
    }).then(({
        旧有_vscode_tasksJSON_文件之缓冲数据块,
        旧有_tasksJSON_内容全文,
    }) => {
        /** @type {Array<范_微软_jsonc_处理机_解析结果之错误记载>} */
        const 微软_jsonc_处理机遭遇的错误列表 = []

        /** @type {范_vscode_taskJSON} */
        let 结果对象 = 微软_jsonc_处理机.parse(
            旧有_tasksJSON_内容全文,
            微软_jsonc_处理机遭遇的错误列表,
            {
                allowEmptyContent: true,
                allowTrailingComma: true,
                disallowComments: false,
            }
        )

        if (微软_jsonc_处理机遭遇的错误列表.length > 0) {
            微软_jsonc_处理机遭遇的错误列表.forEach((错误之记载, 列表编号) => {
                console.error(`${
                    本工具集一切命令行消息之前缀
                }\n    ${
                    粉笔工具.redBright(`微软_jsonc_处理机 遇到的错误（第 ${列表编号 + 1} 个）`)
                }`)
                console.error(错误之记载)
            })
        }



        let vscode_之任务配置确有改动 = false



        if (!旧有_vscode_tasksJSON_文件确实存在) {
            vscode_之任务配置确有改动 = true

            console.log(`\n${
                本工具集一切命令行消息之前缀
            }\n    此前 VSCode 的 ${
                粉笔工具.magentaBright('tasks.json')
            } 文件并不存在。\n`)
        }


        if (typeof 结果对象 !== 'object') {
            结果对象 = {}
            vscode_之任务配置确有改动 = true
        }



        if (!Array.isArray(结果对象.tasks)) {
            结果对象.tasks = []
            vscode_之任务配置确有改动 = true
        }

        const { tasks } = 结果对象



        // console.log(
        //     '    个别脚本文件应发布在目标项目之根文件夹下：\n   ',
        //     发布本工具集随附的命令行脚本时_个别脚本文件应发布在目标项目之根文件夹下,
        //     '\n'
        // )



        let 任务列表经本次处理后已有改动 = false



        任务列表经本次处理后已有改动 = 确保某_vscode_任务存在({
            本工具集一切命令行消息之前缀,
            任务列表: tasks,
            任务标签: '更新所有 npm 依赖包至最新版本（PowerShell）',
            拟采纳的任务定义: {
                type: 'shell',

                command: [
                    'pwsh',
                    ' -Command',

                    [
                        '\'',

                        '.',
                        `.\\${用于研发阶段的命令行工具集_这一文件夹之相对路径_用于调用某_PowerShell}`,
                        '\\PowerShell',
                        '\\Update-更新所有-npm-依赖包至允许范围内的最新版本.ps1',
                        '  -安装之前应先删除旧有的_node_modules_文件夹',
                        '  -安装之前应先删除旧有的_package_lock_json_文件',

                        '\'',
                    ].join(''),

                ].join(' '),

                group: 'none',
                problemMatcher: [],
            },
            粉笔工具,
        })
        if (任务列表经本次处理后已有改动) { vscode_之任务配置确有改动 = true }



        任务列表经本次处理后已有改动 = 确保某_vscode_任务存在({
            本工具集一切命令行消息之前缀,
            任务列表: tasks,
            任务标签: '将代码依次推送至多个集得源（Bash）',
            拟采纳的任务定义: {
                type: 'shell',

                command: [
                    'bash',
                    ' -c',

                    [
                        '\'',

                        'source',

                        '  .',
                        `/${用于研发阶段的命令行工具集_这一文件夹之相对路径_用于调用某_bash}`,
                        '/bash',
                        '/update-更新所有-npm-依赖包至允许范围内的最新版本.sh',

                        '\'',
                    ].join(''),

                ].join(' '),

                group: 'none',
                problemMatcher: [],
            },
            粉笔工具,
        })
        if (任务列表经本次处理后已有改动) { vscode_之任务配置确有改动 = true }





        const 拟写入_vscode_tasksJSON_之内容全文 = `${[
            '/**',
            ' * 参阅： https://go.microsoft.com/fwlink/?LinkId=733558',
            ' */',
            '',
        ].join('\n')}\n${
            JSON.stringify(结果对象, null, 4)
        }\n`

        return {
            旧有_vscode_tasksJSON_文件确实存在,
            旧有_vscode_tasksJSON_文件之缓冲数据块,
            旧有_tasksJSON_内容全文,
            vscode_之任务配置确有改动,
            拟写入_vscode_tasksJSON_之内容全文,
            vscode_tasksJSON_纵使有变动也不应制作备份文件,
        }
    }).then(({
        旧有_vscode_tasksJSON_文件确实存在,
        旧有_vscode_tasksJSON_文件之缓冲数据块,
        // 旧有_tasksJSON_内容全文,
        vscode_之任务配置确有改动,
        拟写入_vscode_tasksJSON_之内容全文,
        vscode_tasksJSON_纵使有变动也不应制作备份文件,
    }) => {
        const 消息分隔线 = '─'.repeat(51)

        if (旧有_vscode_tasksJSON_文件确实存在) {
            console.log(`${
                本工具集一切命令行消息之前缀
            }\n    ${
                消息分隔线
            }\n    综上， VSCode 的 ${
                粉笔工具.magentaBright('tasks.json')
            } ${
                vscode_之任务配置确有改动
                    ? 粉笔工具.redBright('确有改动')
                    : 粉笔工具.green('整个文件无任何改动')
            }。\n    ${
                消息分隔线
            }\n`)
        } else {
            console.info(`${
                本工具集一切命令行消息之前缀
            }\n    ${
                消息分隔线
            }\n    将创建 VSCode 的 ${
                粉笔工具.magentaBright('tasks.json')
            } 文件。\n    ${
                消息分隔线
            }\n`)
        }





        if (!vscode_之任务配置确有改动) {
            return Promise.resolve(null)
        }





        文件系统工具之扩展版.mkdirpSync(vscode_tasksJSON_文件所处之文件夹之完整路径)





        if (旧有_vscode_tasksJSON_文件之缓冲数据块 instanceof Buffer && !vscode_tasksJSON_纵使有变动也不应制作备份文件) {
            const 时间戳 = 求当前时间之文本_可用于文件系统之文件名()
            const 备份文件之文件名 = `tasks-吴乐川备份于-${时间戳}.jsonc`
            const 备份文件之文件完整路径 = 路径工具.join(
                vscode_tasksJSON_文件所处之文件夹之完整路径,
                备份文件之文件名
            )

            文件系统工具之扩展版.writeFileSync(备份文件之文件完整路径, 旧有_vscode_tasksJSON_文件之缓冲数据块)

            console.log(`${
                本工具集一切命令行消息之前缀
            }\n    VSCode 先前的 ${
                粉笔工具.magentaBright('tasks.json')
            } 文件已另存为备份：\n    ${
                粉笔工具.greenBright(备份文件之文件名)
            } 。\n    ${
                粉笔工具.green(备份文件之文件完整路径)
            }\n`)
        }





        文件系统工具之扩展版.writeFileSync(vscode_tasksJSON_文件之完整路径, 拟写入_vscode_tasksJSON_之内容全文)

        console.info(`${
            本工具集一切命令行消息之前缀
        }\n    VSCode 的 ${
            粉笔工具.magentaBright('tasks.json')
        } ${
            旧有_vscode_tasksJSON_文件确实存在
                ? '文件内容已变更'
                : '文件已创建'
        }。\n    ${
            粉笔工具.redBright(vscode_tasksJSON_文件之完整路径)
        }\n`)





        // 为了日志清晰、有序、易读，我最终还是舍弃了 Promsie.all 或 Promsie.allSettled 的做法，改为顺次执行各功能。
    })





    /**
     * @param {object}                  配置项集
     * @param {string}                  配置项集.本工具集一切命令行消息之前缀
     * @param {Array<范_vscode_任务项>} 配置项集.任务列表
     * @param {string}                  配置项集.任务标签
     * @param {范_vscode_任务项}        配置项集.拟采纳的任务定义
     * @param {范_粉笔工具}             配置项集.粉笔工具
     *
     * @returns {boolean} 任务列表已有改动
     */
    function 确保某_vscode_任务存在 ({ 本工具集一切命令行消息之前缀, 任务列表, 任务标签, 拟采纳的任务定义, 粉笔工具 } = {}) {
        if (!拟采纳的任务定义 || typeof 拟采纳的任务定义 !== 'object' || Array.isArray(拟采纳的任务定义)) {
            console.log(`${本工具集一切命令行消息之前缀}\n    为任务 “${任务标签}” 给出的任务项无效。`)
            return
        }

        拟采纳的任务定义.label = 任务标签

        let 已有改动 = false

        let 关注的任务项之列表编号 = 任务列表.findIndex(某任务项 => 某任务项.label === 任务标签)
        if (关注的任务项之列表编号 < 0) {
            const 任务项 = {
                label: 任务标签,
            }

            任务列表.push(任务项)

            关注的任务项之列表编号 = 任务列表.length - 1

            已有改动 = true
        }

        const 执行结果 = 将JSON中单个属性或成员配置为新值(任务列表[关注的任务项之列表编号], 拟采纳的任务定义)

        if (执行结果.已有改动) {
            已有改动 = true

            任务列表[关注的任务项之列表编号] = 执行结果.新实体
        }

        console.log(`${
            本工具集一切命令行消息之前缀
        }\n    在 VSCode 的 ${
            粉笔工具.magentaBright('tasks.json')
        } 中，\n    名为 “ ${
            粉笔工具.cyanBright(任务标签)
        } ” 的任务\n    ${
            已有改动
                ? 粉笔工具.redBright('或为新增，或有改动')
                : 粉笔工具.green('原先已存在，且本次并无改动')
        }。\n`)

        return 已有改动
    }
}
