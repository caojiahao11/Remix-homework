// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


interface IVoting {
    //记录
    event Voted(address indexed candidate,address indexed voter,uint totalVotes);
    function vote(address candidate) external;
    function getVotes(address candidate) external view returns(uint256);
    function resetVotes() external;
    
} 