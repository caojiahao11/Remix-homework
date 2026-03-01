// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// 编写合约
// 创建一个名为 BeggingContract 的合约。
// 合约应包含以下功能：
// 一个 mapping 来记录每个捐赠者的捐赠金额。
// 一个 donate 函数，允许用户向合约发送以太币，并记录捐赠信息。
// 一个 withdraw 函数，允许合约所有者提取所有资金。
// 一个 getDonation 函数，允许查询某个地址的捐赠金额。
// 使用 payable 修饰符和 address.transfer 实现支付和提款。


interface IBeggingContract {
    //记录捐赠
    event Donted(address indexed donor,uint256 amount);
    //记录拿钱
    event FoundsWithDrawn(address indexed owner,uint256 amount);
    // 一个 donate 函数，允许用户向合约发送以太币
        // “谁在捐赠？”—— 由 msg.sender 自动获取
        // “捐赠多少以太币？”—— 由 msg.value 自动获取
    function donate() external payable;
    // 一个 withdraw 函数，允许合约所有者提取所有资金。
    function withdraw() external;
    // 一个 getDonation 函数，允许查询某个地址的捐赠金额。
    // function getDonation(address donor) external;
    function getDonation(address donor) external view returns (uint256);




    
}

