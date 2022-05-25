/**
 * 吴乐川
 * 2022-05-16
 *
 * 本工具集主体是一些 PowerShell 脚本和 Bash 脚本，应运行在命令行环境。
 * 但本工具集依托 npm 平台发布和管理，因此也“入乡随俗”式的提供了一个 JavaScript 入口，即为本 index.js 文件。
 * 本文件无意提供过多功能，徒打印本工具集之简介尔。
 */





/**
 * @typedef {import('../../package.json')} 范_本工具集自身的_packageJSON
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
 * @typedef {typeof import('@wulechuan/text-basic-typography')} 范_吴乐川文本简朴排版工具
 */

/**
 * @typedef {import('../辅助工具集')} 范_本工具集随附之辅助工具集
 */

/**
 * @typedef {import('./功能集/8-在命令行终端呈现本工具集之简介')} 范_在命令行终端呈现本工具集之简介
 */





// 注意，下方路径并不是相对于本 js 文件的路径！
const 本工具集自身_packageJSON_相对于_nodejs_进程工作目录的路径 = './package.json'





Promise.all([
    import('chalk'),
    import('node:path'),
    import('fs-extra'),
    import('@wulechuan/text-basic-typography'),
    // import('./辅助工具集/index.js'),
    import('./功能集/8-在命令行终端呈现本工具集之简介.js'),
]).then(([
    粉笔工具_模块,
    路径工具_模块,
    文件系统工具之扩展版_模块,
    吴乐川文本简朴排版工具_模块,
    // 本工具集随附之辅助工具集_模块,
    在命令行终端呈现本工具集之简介_模块,
]) => {
    /** @type {范_粉笔工具} */
    const 粉笔工具 = new 粉笔工具_模块.Chalk()

    /** @type {范_路径工具} */
    const 路径工具 = 路径工具_模块.default

    /** @type {范_文件系统工具之扩展版} */
    const 文件系统工具之扩展版 = 文件系统工具之扩展版_模块.default

    /** @type {范_吴乐川文本简朴排版工具} */
    const 吴乐川文本简朴排版工具 = 吴乐川文本简朴排版工具_模块

    // /** @type {范_本工具集随附之辅助工具集} */
    // const 本工具集随附之辅助工具集 = 本工具集随附之辅助工具集_模块.default

    /** @type {范_在命令行终端呈现本工具集之简介} */
    const 在命令行终端呈现本工具集之简介 = 在命令行终端呈现本工具集之简介_模块.default





    const {
        将原文本改造为包含简朴排版的新文本,
    } = 吴乐川文本简朴排版工具

    const 本工具集自身_packageJSON_之完整路径 = 路径工具.resolve(本工具集自身_packageJSON_相对于_nodejs_进程工作目录的路径)

    /** @type {范_本工具集自身的_packageJSON} */
    const 本工具集自身的_packageJSON = 文件系统工具之扩展版.readJSONSync(本工具集自身_packageJSON_之完整路径)

    const 本工具集一切命令行消息之前缀 = `${
        粉笔工具.whiteBright(本工具集自身的_packageJSON.name)
    }： ${
        粉笔工具.bgGray.whiteBright('【无实质功能的主接口】')
    }`





    在命令行终端呈现本工具集之简介({
        粉笔工具,
        将原文本改造为包含简朴排版的新文本,
        本工具集一切命令行消息之前缀,
        本工具集自身的_packageJSON,
    })
})
