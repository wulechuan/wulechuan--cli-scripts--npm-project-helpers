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





/**
 * @typedef {import('./9-功能之自动配置-vscode-tasks-json')} 范_内部功能之自动配置_vscode_tasksJSON
 */

/**
 * @typedef {import('./9-功能之在采用该工具集的项目中自动构建命令行脚本集')} 范_内部功能之在采用该工具集的项目中自动构建命令行脚本集
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
 * @param {范_本工具集随附之辅助工具集}   配置项集.本工具集随附之辅助工具集
 *
 * @param {string}                        配置项集.本工具集一切命令行消息之前缀
 * @param {string}                        配置项集.本工具集自身根文件夹之完整路径
 * @param {范_本工具集自身的_packageJSON} 配置项集.本工具集自身的_packageJSON
 *
 * @param {object}                        配置项集.诸内部功能各自之配置项集
 *
 *
 * @param {object}                        配置项集.诸内部功能各自之配置项集.自动配置_vscode_tasksJSON
 * @param {string}                        配置项集.诸内部功能各自之配置项集.自动配置_vscode_tasksJSON.视作须为其安装本工具集的_npm_项目的根文件的完整路径
 * @param {范_通用的_packageJSON}         配置项集.诸内部功能各自之配置项集.自动配置_vscode_tasksJSON.视作须为其安装本工具集的_npm_项目的_packageJSON
 * @param {string}                        配置项集.诸内部功能各自之配置项集.自动配置_vscode_tasksJSON.视作_dotvscode_文件夹的文件夹之相对路径
 * @param {boolean}                       配置项集.诸内部功能各自之配置项集.自动配置_vscode_tasksJSON.发布本工具集随附的命令行脚本时_个别脚本文件应发布在目标项目之根文件夹下
 * @param {boolean}                       配置项集.诸内部功能各自之配置项集.自动配置_vscode_tasksJSON.vscode_tasksJSON_纵使有变动也不应制作备份文件
 *
 * @param {object}                        配置项集.诸内部功能各自之配置项集.在采用该工具集的项目中自动构建命令行脚本集
 * @param {string}                        配置项集.诸内部功能各自之配置项集.在采用该工具集的项目中自动构建命令行脚本集.视作须为其安装本工具集的_npm_项目的根文件的完整路径
 * @param {范_通用的_packageJSON}         配置项集.诸内部功能各自之配置项集.在采用该工具集的项目中自动构建命令行脚本集.视作须为其安装本工具集的_npm_项目的_packageJSON
 * @param {string}                        配置项集.诸内部功能各自之配置项集.在采用该工具集的项目中自动构建命令行脚本集.用于容纳发布的各命令行脚本的文件树之根文件夹之完整路径
 * @param {string}                        配置项集.诸内部功能各自之配置项集.在采用该工具集的项目中自动构建命令行脚本集.本工具集随附命令行应用范本集文件夹之相对路径
 * @param {string}                        配置项集.诸内部功能各自之配置项集.在采用该工具集的项目中自动构建命令行脚本集.用于研发阶段的命令行工具集_这一文件夹之相对路径
 * @param {boolean}                       配置项集.诸内部功能各自之配置项集.在采用该工具集的项目中自动构建命令行脚本集.发布本工具集随附的命令行脚本时_个别脚本文件应发布在目标项目之根文件夹下
 * @param {boolean}                       配置项集.诸内部功能各自之配置项集.在采用该工具集的项目中自动构建命令行脚本集.发布本工具集随附的命令行脚本时应覆盖旧有的命令行脚本文件
 * @param {boolean}                       配置项集.诸内部功能各自之配置项集.在采用该工具集的项目中自动构建命令行脚本集.发布本工具集随附的命令行脚本时若覆盖旧有的命令行脚本文件则先行备份
 *
 * @returns {Promise<any>}
 */
module.exports = function 本工具集一切自动安装与配置任务之内部总接口 ({
    应开启调试功能,

    粉笔工具,
    路径工具,
    文件系统工具之扩展版,
    微软_jsonc_处理机,
    本工具集随附之辅助工具集,

    本工具集一切命令行消息之前缀,
    本工具集自身根文件夹之完整路径,
    本工具集自身的_packageJSON,

    诸内部功能各自之配置项集,
} = {}) {
    应开启调试功能 && console.debug('>>>> 本工具集一切自动安装与配置任务之内部总接口 <<<<')

    const {
        自动配置_vscode_tasksJSON:                  内部功能之配置项集__自动配置_vscode_tasksJSON = {},
        在采用该工具集的项目中自动构建命令行脚本集: 内部功能之配置项集__在采用该工具集的项目中自动构建命令行脚本集 = {},
    } = 诸内部功能各自之配置项集

    return Promise.all([
        import('./9-功能之自动配置-vscode-tasks-json.js'),
        import('./9-功能之在采用该工具集的项目中自动构建命令行脚本集.js'),
    ]).then(([
        内部功能之自动配置_vscode_tasksJSON_模块,
        内部功能之在采用该工具集的项目中自动构建命令行脚本集_模块,
    ]) => {
        应开启调试功能 && console.debug('>>>> 本工具集一切自动安装与配置任务之内部总接口 then <<<<')

        /** @type {范_内部功能之自动配置_vscode_tasksJSON} */
        const 内部功能之自动配置_vscode_tasksJSON = 内部功能之自动配置_vscode_tasksJSON_模块.default

        /** @type {范_内部功能之在采用该工具集的项目中自动构建命令行脚本集} */
        const 内部功能之在采用该工具集的项目中自动构建命令行脚本集 = 内部功能之在采用该工具集的项目中自动构建命令行脚本集_模块.default



        // 为了日志清晰、有序、易读，我最终还是舍弃了 Promsie.all 或 Promsie.allSettled 的做法，改为顺次执行各功能。
        return Promise.resolve().then(内部功能之自动配置_vscode_tasksJSON({
            应开启调试功能,

            粉笔工具,
            路径工具,
            文件系统工具之扩展版,
            微软_jsonc_处理机,
            本工具集随附之辅助工具集,

            本工具集一切命令行消息之前缀,
            本工具集自身根文件夹之完整路径,
            本工具集自身的_packageJSON,

            ...内部功能之配置项集__自动配置_vscode_tasksJSON,
        })).then(内部功能之在采用该工具集的项目中自动构建命令行脚本集({
            应开启调试功能,

            粉笔工具,
            路径工具,
            文件系统工具之扩展版,

            本工具集随附之辅助工具集,

            本工具集一切命令行消息之前缀,
            本工具集自身根文件夹之完整路径,
            本工具集自身的_packageJSON,

            ...内部功能之配置项集__在采用该工具集的项目中自动构建命令行脚本集,
        }))
    })
}
