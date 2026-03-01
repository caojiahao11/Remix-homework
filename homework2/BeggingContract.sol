// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract BeggingContract {
    // 1. 记录合约所有者（部署合约的地址）
    address private immutable _owner;

    // 2. 记录捐赠者地址→捐赠金额的mapping
    mapping(address => uint) private _donations;

      // 3. 定义事件：记录捐赠、提取操作（面试加分项）
    event Donated(address indexed donor, uint amount);
    event Withdrawn(address indexed owner, uint totalAmount);

    // 构造函数：部署时设置所有者
    constructor() {
        _owner = msg.sender;
    }

    // 4. 修饰器：限制只有所有者能调用（复用性高）
    modifier onlyOwner() {
        require(msg.sender == _owner, "Only owner can call this function");
        _;
    }

    function donate() external payable{
        require(msg.value > 0, "Donation amount must be greater than 0"); // 确保捐赠金额>0
        _donations[msg.sender] += msg.value; // 累加捐赠金额
        emit Donated(msg.sender,msg.value); // 触发捐赠事件
    }

    function getDonation(address donor) external view returns (uint256) {
        return _donations[donor];
    }
    function withdraw() external onlyOwner{
        uint totalBalance = address(this).balance; // 获取合约当前ETH余额
        require(totalBalance > 0, "No funds to withdraw"); // 确保有余额可提取
        // 转账给所有者（用call方式更安全）
        (bool success, ) = payable(_owner).call{value: totalBalance}("");
        require(success, "Withdrawal failed");
        emit Withdrawn(_owner, totalBalance); // 触发提取事件
    }

    
    function getTotalBalance() external view returns (uint){
        return address(this).balance;
    }
}