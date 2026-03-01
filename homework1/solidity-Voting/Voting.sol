// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "./IVoting.sol";

contract Voting is IVoting{
    // 私有存储：核心数据保护
    mapping(address => uint256) private _votes;
    mapping(address => bool) private _hasVoted;
    address[] private _candidates; // 存储所有候选人，用于重置
    mapping(address => bool) private _candidateExists;



    function vote(address candidate) external override {
        // 安全校验
        require(candidate != address(0), "Invalid candidate address");
        require(!_hasVoted[msg.sender], "Already voted");
        // 核心逻辑
        _votes[candidate] += 1;
        _hasVoted[msg.sender] = true;

        // 记录候选人（用于重置）
        if (!_candidateExists[candidate]) {
            _candidates.push(candidate);
            _candidateExists[candidate] = true;
        }

        // 触发接口定义的事件
        emit Voted(candidate,msg.sender,_votes[candidate]);
    }
    function getVotes(address candidate) external override view returns(uint256){}
    function resetVotes() external  override{
         for (uint256 i = 0; i < _candidates.length; i++) {
            _votes[_candidates[i]] = 0;
        }
    }


}