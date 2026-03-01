// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title ISort
 * @dev 排序算法的标准接口，支持对 uint256 数组进行原地排序
 */
interface IMidSort {
     function binarySearch(uint[] memory _sortedArr, uint _target) external pure returns(uint index);
}