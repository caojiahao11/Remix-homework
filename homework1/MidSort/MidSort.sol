// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./IMidSort.sol";

contract MidSort is IMidSort{
    /**
     * @dev 二分查找核心方法（升序数组专用）
     * @param _sortedArr 升序排列的uint数组（必须有序！）
     * @param _target 要查找的目标数值
     * @return index 找到则返回对应索引，找不到返回 type(uint).max（等价于-1，Solidity无负数）
     */
    function binarySearch(uint[] memory _sortedArr, uint _target) external pure returns(uint index) {
        // 初始化左右指针：左指针指向数组首位，右指针指向数组末位
        uint left = 0;
        uint right = _sortedArr.length - 1;

        // 核心循环：左指针 ≤ 右指针 时持续查找
        while(left <= right) {
            // 计算中间索引（防溢出写法，等价于 (left+right)/2）
            uint mid = left + (right - left) / 2;
            
            // 1. 找到目标值 → 直接返回中间索引
            if(_sortedArr[mid] == _target) {
                return mid;
            }
            // 2. 中间值 < 目标值 → 目标在右半区，左指针右移
            else if(_sortedArr[mid] < _target) {
                left = mid + 1;
            }
            // 3. 中间值 > 目标值 → 目标在左半区，右指针左移
            else {
                right = mid - 1;
            }
        }
        
        // 循环结束未找到 → 返回最大值代表“查找失败”（Solidity uint不能返回-1）
        return type(uint).max;
    }
}