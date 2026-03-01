// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


interface IRrever {
    function reverseString(string calldata _str) external  pure returns (string memory);

}  