// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "./IRever.sol";
contract Rever  is IRrever{
    function reverseString(string calldata _str) external pure returns (string memory) {
        bytes memory strBytes = bytes(_str); // 字符串转bytes数组
        uint len = strBytes.length;
        // 双指针交换
        for (uint i = 0; i < len / 2; i++) {
            (strBytes[i], strBytes[len - 1 - i]) = (strBytes[len - 1 - i], strBytes[i]);
        }
        return string(strBytes); // bytes转回字符串
}



}
