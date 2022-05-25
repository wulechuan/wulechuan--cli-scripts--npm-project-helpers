/**
 * 吴乐川
 * 2022-05-19
 *
 * 本文件为本工具集之一切自动安装和配置任务之公用入口。
 *
 * 本文件所执行之任务基本等同于
 *     “一整套测试任务集.js”
 * 中的任务。
 *
 * 所不同的是，
 * 各测试任务集之输出均在 “各测试任务产出的文件” 这一文件夹中，
 * 以免干扰到真实的配置文件。
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
 * @typedef {typeof import('jsonc-parser')} 范_微软_jsonc_处理机
 */

/**
 * @typedef {typeof import('@wulechuan/text-basic-typography')} 范_吴乐川文本简朴排版工具
 */

/**
 * @typedef {import('./8-在命令行终端呈现本工具集之简介')} 范_在命令行终端呈现本工具集之简介
 */

/**
 * @typedef {import('./2-一切自动安装与配置任务的主体功能.js')} 范_本工具集一切自动安装与配置任务之内部总接口
 */

/**
 * @typedef {import('../辅助工具集')} 范_本工具集随附之辅助工具集
 */

/**
 * @typedef {import('../../../package.json')} 范_本工具集自身的_packageJSON
 */

/**
 * @typedef {import('../../../package.json')} 范_通用的_packageJSON # 这里假借本工具集自身的 package.json 来表征通用 package.json 的类型定义。因为真正的通用类型定义暂未找到，而假借的这一类型定义也够用了。
 */





// 注意，下方路径并不是相对于【本 js 文件】的路径！
const 本工具集自身_packageJSON_相对于_nodejs_进程工作目录的路径 = './package.json'





执行全套部署任务({ 应开启调试功能: false })





/**
 * @param {object}  配置项集
 *
 * @param {boolean} 配置项集.应开启调试功能
 *
 * @param {boolean} 配置项集.执行各项功能之前应先呈现本工具之简介
 * @param {string}  配置项集.用于研发阶段的命令行工具集_这一文件夹之相对路径
 * @param {boolean} 配置项集.发布本工具集随附的命令行脚本时_个别脚本文件应发布在目标项目之根文件夹下
 *
 * @param {string}  配置项集.视作_dotvscode_文件夹的文件夹之相对路径
 * @param {boolean} 配置项集.vscode_tasksJSON_纵使有变动也不应制作备份文件
 *
 * @param {string}  配置项集.本工具集随附命令行应用范本集文件夹之相对路径
 * @param {string}  配置项集.用于容纳发布的各命令行脚本的文件树之根文件夹之相对路径
 * @param {boolean} 配置项集.发布本工具集随附的命令行脚本时应覆盖旧有的命令行脚本文件
 * @param {boolean} 配置项集.发布本工具集随附的命令行脚本时若覆盖旧有的命令行脚本文件则先行备份
 *
 * @returns {Promise<any>}
 */
function 执行全套部署任务 ({
    应开启调试功能 = false,

    执行各项功能之前应先呈现本工具之简介 = false,
    用于研发阶段的命令行工具集_这一文件夹之相对路径 = null,
    发布本工具集随附的命令行脚本时_个别脚本文件应发布在目标项目之根文件夹下 = false,

    视作_dotvscode_文件夹的文件夹之相对路径 = '.vscode',
    vscode_tasksJSON_纵使有变动也不应制作备份文件 = false,

    本工具集随附命令行应用范本集文件夹之相对路径 = null,
    用于容纳发布的各命令行脚本的文件树之根文件夹之相对路径 = '',
    发布本工具集随附的命令行脚本时应覆盖旧有的命令行脚本文件 = false,
    发布本工具集随附的命令行脚本时若覆盖旧有的命令行脚本文件则先行备份 = true,
} = {}) {
    应开启调试功能 && console.debug('>>>> 执行全套部署任务 <<<<')

    return Promise.all([
        import('chalk'),
        import('node:path'),
        import('fs-extra'),
        import('jsonc-parser'),
        import('@wulechuan/text-basic-typography'),
        import('../辅助工具集/index.js'),
        import('./8-在命令行终端呈现本工具集之简介.js'),
        import('./2-一切自动安装与配置任务的主体功能.js'),
    ]).then(([
        粉笔工具_模块,
        路径工具_模块,
        文件系统工具之扩展版_模块,
        微软_jsonc_处理机_模块,
        吴乐川文本简朴排版工具_模块,
        本工具集随附之辅助工具集_模块,
        在命令行终端呈现本工具集之简介_模块,
        本工具集一切自动安装与配置任务之内部总接口_模块,
    ]) => {
        应开启调试功能 && console.debug('>>>> 执行全套部署任务 then <<<<')

        /** @type {范_粉笔工具} */
        const 粉笔工具 = new 粉笔工具_模块.Chalk()

        /** @type {范_路径工具} */
        const 路径工具 = 路径工具_模块.default

        /** @type {范_文件系统工具之扩展版} */
        const 文件系统工具之扩展版 = 文件系统工具之扩展版_模块.default

        /** @type {范_微软_jsonc_处理机} */
        const 微软_jsonc_处理机 = 微软_jsonc_处理机_模块.default

        /** @type {范_吴乐川文本简朴排版工具} */
        const 吴乐川文本简朴排版工具 = 吴乐川文本简朴排版工具_模块

        /** @type {范_本工具集随附之辅助工具集} */
        const 本工具集随附之辅助工具集 = 本工具集随附之辅助工具集_模块.default

        /** @type {范_在命令行终端呈现本工具集之简介} */
        const 在命令行终端呈现本工具集之简介 = 在命令行终端呈现本工具集之简介_模块.default

        /** @type {范_本工具集一切自动安装与配置任务之内部总接口} */
        const 本工具集一切自动安装与配置任务之内部总接口 = 本工具集一切自动安装与配置任务之内部总接口_模块.default





        const {
            将原文本改造为包含简朴排版的新文本,
        } = 吴乐川文本简朴排版工具

        const 本工具集自身_packageJSON_之完整路径 = 路径工具.resolve(本工具集自身_packageJSON_相对于_nodejs_进程工作目录的路径)

        /** @type {范_本工具集自身的_packageJSON} */
        const 本工具集自身的_packageJSON = 文件系统工具之扩展版.readJSONSync(本工具集自身_packageJSON_之完整路径)

        const 本工具集自身根文件夹之完整路径 = 路径工具.dirname(本工具集自身_packageJSON_之完整路径)

        const 本工具集一切命令行消息之前缀 = `${
            粉笔工具.whiteBright(本工具集自身的_packageJSON.name)
        }： ${
            粉笔工具.bgGreen.black('【自动配置】')
        }`





        const 探测结果1 = 本工具集随附之辅助工具集.探测采用本工具集的_npm_项目的根文件夹路径({
            粉笔工具,
            路径工具,
            文件系统工具之扩展版,

            本函数之一切消息之前缀: `${本工具集一切命令行消息之前缀} 探测采用本工具集之 npm 项目之根文件夹之路径：\n`,

            探测之起点之绝对路径: 本工具集自身根文件夹之完整路径,
        })

        if (探测结果1.未成功) {
            if (探测结果1.疑似为本工具集自身的_install_生命周期任务故不必配置命令行脚本) {
                return Promise.reject({ 粉笔工具, 本工具集一切命令行消息之前缀, 出现异常: false })
            } else {
                return Promise.reject({ 粉笔工具, 本工具集一切命令行消息之前缀, 出现异常: true })

            }
        }

        const 视作须为其安装本工具集的_npm_项目的根文件的完整路径 = 探测结果1.理想的文件夹之完整路径
        const 视作须为其安装本工具集的_npm_项目的_packageJSON_的完整路径 = 路径工具.join(
            视作须为其安装本工具集的_npm_项目的根文件的完整路径, 'package.json'
        )

        /** @type {范_通用的_packageJSON} */
        const 视作须为其安装本工具集的_npm_项目的_packageJSON = 文件系统工具之扩展版.readJSONSync(视作须为其安装本工具集的_npm_项目的_packageJSON_的完整路径)

        const 用于容纳发布的各命令行脚本的文件树之根文件夹之完整路径 = 路径工具.join(
            视作须为其安装本工具集的_npm_项目的根文件的完整路径, (用于容纳发布的各命令行脚本的文件树之根文件夹之相对路径 || '')
        )





        // 应开启调试功能 && console.debug('\n @wulechuan/cli-scripts--npm-project-helpers 本工具集自身的_packageJSON', 本工具集自身的_packageJSON, '\n')
        // 应开启调试功能 && console.debug('\n @wulechuan/cli-scripts--npm-project-helpers__dirname \n   ', __dirname, '\n')
        // 应开启调试功能 && console.debug('\n @wulechuan/cli-scripts--npm-project-helpers 本工具集自身根文件夹之完整路径 \n   ', 本工具集自身根文件夹之完整路径, '\n')
        // 应开启调试功能 && console.debug('\n @wulechuan/cli-scripts--npm-project-helpers 用于容纳发布的各命令行脚本的文件树之根文件夹之完整路径 \n   ', 用于容纳发布的各命令行脚本的文件树之根文件夹之完整路径, '\n')





        if (执行各项功能之前应先呈现本工具之简介) {
            在命令行终端呈现本工具集之简介({
                粉笔工具,
                将原文本改造为包含简朴排版的新文本,
                本工具集一切命令行消息之前缀,
                本工具集自身的_packageJSON,
            })
        }





        return 本工具集一切自动安装与配置任务之内部总接口({
            应开启调试功能,

            粉笔工具,
            路径工具,
            文件系统工具之扩展版,
            微软_jsonc_处理机,
            本工具集随附之辅助工具集,

            本工具集一切命令行消息之前缀,
            本工具集自身根文件夹之完整路径,
            本工具集自身的_packageJSON,

            诸内部功能各自之配置项集: {
                自动配置_vscode_tasksJSON: {
                    视作须为其安装本工具集的_npm_项目的根文件的完整路径,
                    视作须为其安装本工具集的_npm_项目的_packageJSON,
                    视作_dotvscode_文件夹的文件夹之相对路径,
                    用于研发阶段的命令行工具集_这一文件夹之相对路径,
                    发布本工具集随附的命令行脚本时_个别脚本文件应发布在目标项目之根文件夹下,
                    vscode_tasksJSON_纵使有变动也不应制作备份文件,
                },

                在采用该工具集的项目中自动构建命令行脚本集: {
                    视作须为其安装本工具集的_npm_项目的根文件的完整路径,
                    视作须为其安装本工具集的_npm_项目的_packageJSON,
                    用于容纳发布的各命令行脚本的文件树之根文件夹之完整路径,
                    本工具集随附命令行应用范本集文件夹之相对路径,
                    用于研发阶段的命令行工具集_这一文件夹之相对路径,
                    发布本工具集随附的命令行脚本时_个别脚本文件应发布在目标项目之根文件夹下,
                    发布本工具集随附的命令行脚本时应覆盖旧有的命令行脚本文件,
                    发布本工具集随附的命令行脚本时若覆盖旧有的命令行脚本文件则先行备份,
                },
            },
        })
    }).catch(传入的工具集 => {
        if (!传入的工具集) { return }



        /** @type {boolean} */
        const 出现异常 = 传入的工具集.出现异常

        /** @type {范_粉笔工具} */
        const 粉笔工具 = 传入的工具集.粉笔工具

        /** @type {string} */
        const 本工具集一切命令行消息之前缀 = 传入的工具集.本工具集一切命令行消息之前缀

        if (出现异常) {
            console.error(`\n${
                本工具集一切命令行消息之前缀
            } ${
                粉笔工具.bgRed.whiteBright(' 自动配置失败 ')
            } 。\n\n    ${
                '虽然本工具集的“自动配置”未能成功，'
            }\n    ${
                '但本工具集仍存在于 node_modules 文件夹中。'
            }\n    ${
                '不妨参阅文档进行手工配置。'
            }\n\n\n`)
        } else {
            console.info(`\n${
                本工具集一切命令行消息之前缀
            } ${
                粉笔工具.bgGreen.black(' 不必执行 ')
            } 。\n\n\n`)
        }
    })
}
