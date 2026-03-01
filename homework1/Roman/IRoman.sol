// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
interface IRoman {

    function RomantoInt(string calldata x) external pure returns (uint);


     function IntToRoman(uint x) external pure returns (string memory);

}