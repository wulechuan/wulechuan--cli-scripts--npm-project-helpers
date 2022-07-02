module.exports = {
    求当前时间之文本_可用于文件系统之文件名,
    将JSON中单个属性或成员配置为新值,
    探测采用本工具集的_npm_项目的根文件夹路径,
}





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
 * @returns {string} 时间戳之人类可读文本，且可用于文件系统之文件名（文件夹名）。
 */
function 求当前时间之文本_可用于文件系统之文件名 () {
    return new Date().toLocaleString('zh-cn', {
        dateStyle: 'long',
        timeStyle: 'medium',
    }).replace(/[\s:]/g, '_')
}





/**
 *
 * @param {any} 旧有实体
 * @param {any} 拟配置为该实体
 * @returns {{ 已有改动: boolean; 新实体: any }}
 */
function 将JSON中单个属性或成员配置为新值 (旧有实体, 拟配置为该实体) {
    if (typeof 拟配置为该实体 === 'function') {
        throw new TypeError('tasks.json 中怎么还有函数？')
    }

    if (typeof 拟配置为该实体 !== 'object') {
        return {
            已有改动: 旧有实体 !== 拟配置为该实体,
            新实体: 拟配置为该实体,
        }
    }

    if (!拟配置为该实体) { // typeof null === 'object'
        if (旧有实体 === null || 旧有实体 === undefined) {
            return {
                已有改动: false,
                新实体: 旧有实体,
            }
        } else {
            return {
                已有改动: true,
                新实体: null,
            }
        }
    }

    if (Array.isArray(拟配置为该实体) && Array.isArray(旧有实体) && 拟配置为该实体.length === 旧有实体.length) {
        return 拟配置为该实体.reduce((
            /** @type {ReturnType<将JSON中单个属性或成员配置为新值>} */
            综合结果,

            拟配置为该成员,

            列表编号
        ) => {
            const 本项之执行结果 = 将JSON中单个属性或成员配置为新值(旧有实体[列表编号], 拟配置为该成员)

            if (本项之执行结果.已有改动) {
                综合结果.已有改动 = true
            }

            // 旧有实体[列表编号] = 本项之执行结果.新实体 // 覆盖原始列表
            综合结果.新实体.push(本项之执行结果.新实体)

            return 综合结果
        }, {
            已有改动: false,
            // 新实体: 旧有实体,
            新实体: [],
        })
    }

    if (!!旧有实体 && typeof 旧有实体 === 'object' && !Array.isArray(旧有实体)) {
        return Object.keys(拟配置为该实体).reduce((综合结果, 键) => {
            const 旧有值 = 旧有实体[键]
            const 拟配置值 = 拟配置为该实体[键]

            const 本项之执行结果 = 将JSON中单个属性或成员配置为新值(旧有值, 拟配置值)

            if (本项之执行结果.已有改动) {
                综合结果.已有改动 = true
            }

            // 旧有实体[键] = 本项之执行结果.新实体 // 覆盖原始字典
            综合结果.新实体[键] = 本项之执行结果.新实体

            return 综合结果
        }, {
            已有改动: false,
            // 新实体: 旧有实体,
            新实体: {},
        })
    }



    /**
     * 至此，可能的情形如下：
     *   -   两个都是数组对象，但长度不等。
     *   -   一个是非数组对象，另一个不是（哪怕另一个是数组）。
     * 策略为直接采用新值，抛弃旧值。
     */

    return {
        已有改动: true,
        新实体: 拟配置为该实体,
    }
}





/**
 * @param {object}                  配置项集
 * @param {范_粉笔工具}             配置项集.粉笔工具
 * @param {范_路径工具}             配置项集.路径工具
 * @param {范_文件系统工具之扩展版} 配置项集.文件系统工具之扩展版
 *
 * @param {string}                  配置项集.本函数之一切消息之前缀
 * @param {string}                  配置项集.探测之起点之绝对路径
 *
 * @returns {{ 理想的文件夹之完整路径: string; 未成功: boolean; 疑似为本工具集自身的_install_生命周期任务故不必配置命令行脚本: boolean; 找到的_node_modules_之个数: number; 失败之原因: string; }}
 */
function 探测采用本工具集的_npm_项目的根文件夹路径 ({
    粉笔工具,
    路径工具,
    文件系统工具之扩展版,

    本函数之一切消息之前缀,
    探测之起点之绝对路径,
} = {}) {
    /**
     * @param {string} 待检验的路径
     * @returns {boolean}
     */
    function 某路径为真实存在的文件 (待检验的路径) {
        let 确为文件 = false
        if (文件系统工具之扩展版.existsSync(待检验的路径)) {
            const 文件描述符 = 文件系统工具之扩展版.statSync(待检验的路径)
            if (文件描述符.isFile()) {
                确为文件 = true
            }
        }

        console.debug(`\n\n${
            本函数之一切消息之前缀
        }\n    某路径为真实存在的文件`, 确为文件, `"${待检验的路径}"`)

        return 确为文件
    }



    if (typeof 本函数之一切消息之前缀 !== 'string' || !本函数之一切消息之前缀.trim()) {
        本函数之一切消息之前缀 = '探测采用某 npm 项目：\n'
    }



    const 返回值 = {
        未成功: true,
        疑似为本工具集自身的_install_生命周期任务故不必配置命令行脚本: false,
        理想的文件夹之完整路径: '',
        失败之原因: '',
        找到的_node_modules_之个数: 0,
    }



    if (!探测之起点之绝对路径 || typeof 探测之起点之绝对路径 !== 'string' || !路径工具.isAbsolute(探测之起点之绝对路径)) {
        console.log(`\n\n${
            本函数之一切消息之前缀
        }\n    ${
            粉笔工具.red('探测之起点之路径必须是绝对路径。')
        }`)

        返回值.失败之原因 = '探测之起点之路径不是绝对路径。'
        return 返回值
    }

    if (某路径为真实存在的文件(探测之起点之绝对路径)) {
        探测之起点之绝对路径 = 路径工具.dirname(探测之起点之绝对路径)
    }

    if (!文件系统工具之扩展版.existsSync(探测之起点之绝对路径)) {
        console.log(`\n\n${
            本函数之一切消息之前缀
        }\n    ${
            粉笔工具.red('探测之起点之路径无效。')
        }`)

        返回值.失败之原因 = '探测之起点之路径无效。'
        return 返回值
    }



    const 各路径片段之列表 = 探测之起点之绝对路径.split(/[\\/]/).filter(路径片段 => !!路径片段)
    // console.log(各路径片段之列表)

    const 在最顶层_node_modules_之上的各路径片段 = []
    let 找到的_node_modules_之个数 = 0

    各路径片段之列表.forEach(路径片段 => {
        if (路径片段 === 'node_modules') {
            找到的_node_modules_之个数++
            return
        }

        if (找到的_node_modules_之个数 === 0) {
            在最顶层_node_modules_之上的各路径片段.push(路径片段)
        }
    })

    console.debug(`\n\n${
        本函数之一切消息之前缀
    }\n    找到的_node_modules_之个数`, 找到的_node_modules_之个数)

    console.debug(`\n\n${
        本函数之一切消息之前缀
    }\n在最顶层_node_modules_之上的各路径片段`, 在最顶层_node_modules_之上的各路径片段)

    返回值.找到的_node_modules_之个数 = 找到的_node_modules_之个数

    if (找到的_node_modules_之个数 === 0) {
        console.log(`\n\n${
            本函数之一切消息之前缀
        }\n    ${
            粉笔工具.yellow(`探测之起点所有的上层文件夹没有任何一个名为 “${粉笔工具.white('node_modules')}”。`)
        }`)

        返回值.失败之原因 = '探测之起点所有的上层文件夹没有任何一个名为“node_modules”。'
        返回值.疑似为本工具集自身的_install_生命周期任务故不必配置命令行脚本 = true
        return 返回值
    } else if (找到的_node_modules_之个数 > 1) {
        console.log(`\n\n${
            本函数之一切消息之前缀
        }\n    ${
            粉笔工具.yellow(`探测之起点所有的上层诸文件夹中不止一个名为 “${粉笔工具.white('node_modules')}”。`)
        }`)

        返回值.失败之原因 = '探测之起点所有的上层诸文件夹中不止一个名为“node_modules”。'
        return 返回值
    }

    const 理想的文件夹之完整路径 = 在最顶层_node_modules_之上的各路径片段.join(路径工具.sep)
    const 理想路径中的_packageJSON_的完整路径 = 路径工具.join(理想的文件夹之完整路径, 'package.json')

    if (某路径为真实存在的文件(理想路径中的_packageJSON_的完整路径)) {
        const 采用本工具集之_npm_包之_packageJSON = 文件系统工具之扩展版.readJSONSync(理想路径中的_packageJSON_的完整路径)

        console.log(`\n\n${
            本函数之一切消息之前缀
        }\n    ${
            粉笔工具.green('成功探测到采用本工具集之 npm 包。')
        }\n        名为 "${
            粉笔工具.white(采用本工具集之_npm_包之_packageJSON.name)
        }"\n        路径为 "${
            粉笔工具.greenBright(理想的文件夹之完整路径)
        }"`)

        返回值.未成功 = false
        返回值.理想的文件夹之完整路径 = 理想的文件夹之完整路径
        return 返回值
    } else {
        console.log(`\n\n${
            本函数之一切消息之前缀
        }\n    ${
            粉笔工具.red('虽探测到疑似采用本工具集之 npm 包之根文件夹，')
        }\n    ${
            粉笔工具.red('但其中没有找到 package.json 这一文件。')
        }`)

        返回值.失败之原因 = '虽探测到疑似采用本工具集之 npm 包之根文件夹，但其中没有找到 package.json 这一文件。'
        return 返回值
    }
}
