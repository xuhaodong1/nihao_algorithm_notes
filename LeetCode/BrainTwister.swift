//
//  BrainTwister.swift
//  LeetCode
//
//  Created by haodong xu on 2022/9/15.
//

import Foundation

/// 脑筋急转弯相关练习题
class BrainTwister: BaseCode {

    /// 题目链接：[672. 灯泡开关 Ⅱ](https://leetcode.cn/problems/bulb-switcher-ii/)
    /// 4 种操作都是取反, 可转换成某种 ^ 操作, 根据运算交换定律, 可推出：
    /// 1. 按钮按动次数一样, 不影响灯泡最终状态
    /// 2. 考虑按动次数的奇偶性
    /// 后根据灯泡序列受到操作的影响性可推出只需观察前三个灯泡 [https://leetcode.cn/problems/bulb-switcher-ii/solution/dengp-by-capital-worker-51rb/]
    /// 之后进行分类讨论即可
    func flipLights(_ n: Int, _ presses: Int) -> Int {
        if presses == 0 { return 1 }
        if n == 1 { return 2 }
        else if n == 2 { return presses == 1 ? 3 : 4}
        else { return presses == 1 ? 4 : presses == 2 ? 7 : 8 }
    }

    /// 题目链接：[777. 在LR字符串中交换相邻字符](https://leetcode.cn/problems/swap-adjacent-in-lr-string/)
    /// 替换操作可转换为 L 往左移动、R 往右移动; 但 L 无法穿过 R、R 也无法穿过 L, 且须保持相对位置一致
    func canTransform(_ start: String, _ end: String) -> Bool {
        let n = start.count, startChars = [Character](start), endChars = [Character](end)
        var i = 0, j = 0
        while i < n || j < n {
            while i < n && startChars[i] == "X" { i += 1 }
            while j < n && endChars[j] == "X" { j += 1 }
            if i == n || j == n { return i == j }
            if startChars[i] != endChars[j] { return false }
            if startChars[i] == "L" && i < j { return false }
            if startChars[i] == "R" && i > j { return false }
            i += 1; j += 1
        }
        return i == j
    }

//    override var excuteable: Bool { return true }
    
    override func executeTestCode() {
        super.executeTestCode()
        print(canTransform("XRXXXLXXXR",
                           "XXRLXXXRXX"))
    }
}
