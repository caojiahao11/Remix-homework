// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;




interface IRomanConverter {
    function RomantoInt(string calldata x) external pure returns (uint);
}
 