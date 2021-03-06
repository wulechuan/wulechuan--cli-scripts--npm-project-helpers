/**
 * @typedef {import('chalk').ChalkInstance} 范_粉笔工具
 */

/**
 * @typedef {import('@wulechuan/text-basic-typography')['将原文本改造为包含简朴排版的新文本']} 范_将原文本改造为包含简朴排版的新文本
 */

/**
 * @typedef {import('../../../package.json')} 范_本工具集自身的_packageJSON
 */





/**
 * @param {object}                                配置项集
 *
 * @param {范_粉笔工具}                           配置项集.粉笔工具
 * @param {范_将原文本改造为包含简朴排版的新文本} 配置项集.将原文本改造为包含简朴排版的新文本
 * @param {string}                                配置项集.本工具集一切命令行消息之前缀
 * @param {范_本工具集自身的_packageJSON}         配置项集.本工具集自身的_packageJSON
 */
module.exports = function 在命令行终端窗口打印本工具集之简介 ({
    粉笔工具,
    将原文本改造为包含简朴排版的新文本,
    本工具集一切命令行消息之前缀,
    本工具集自身的_packageJSON,
} = {}) {
    if (!本工具集自身的_packageJSON) { return }

    const {
        排版好的内容全文: 排版后的描述文本全文,
        最终采纳的排版配置,
    } = 将原文本改造为包含简朴排版的新文本({
        原文本: 本工具集自身的_packageJSON.description,
        整体缩进级数: 1,
        列表引领符: '· ',
    })

    const {
        // 整体缩进级数,
        整体缩进之文本,
        // 列表引领符,
        // 首层缩进之文本,
        首层缩进之文本_并含整体缩进,
        // 首层缩进之文本_含列表引领符,
        首层缩进之文本_含列表引领符_并含整体缩进,
        非首层之单层缩进之文本,
        // 各段落间的额外空白行数,
    } = 最终采纳的排版配置

    console.info(`\n${
        本工具集一切命令行消息之前缀
    }\n\n《${
        粉笔工具.bgGreenBright.black(' 简介 ')
    }》\n\n${
        排版后的描述文本全文
    }\n\n${
        整体缩进之文本
    }应用示例：\n\n${
        首层缩进之文本_含列表引领符_并含整体缩进
    }PowerShell ：\n${
        首层缩进之文本_并含整体缩进}${非首层之单层缩进之文本
    }${
        粉笔工具.cyanBright('<本工具集之根文件夹>.\\用于研发阶段的命令行工具集\\PowerShell\\Update-更新所有-npm-依赖包至允许范围内的最新版本.ps1')
    }\n\n${
        首层缩进之文本_含列表引领符_并含整体缩进
    }bash ：\n${
        首层缩进之文本_并含整体缩进}${非首层之单层缩进之文本
    }${
        粉笔工具.yellowBright('<本工具集之根文件夹>./用于研发阶段的命令行工具集/bash/update-更新所有-npm-依赖包至允许范围内的最新版本.sh')
    }\n`)
}
