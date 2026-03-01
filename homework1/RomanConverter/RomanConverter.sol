// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./IRomanConverter.sol";

contract RomanConverter is IRomanConverter{

     function RomantoInt(string calldata _roman) external pure override   returns (uint){
        bytes memory romanBytes=bytes(_roman);
        uint result = 0;
        for (uint i=0;i<romanBytes.length;i++){
            uint currentVal = _getRomanValue(romanBytes[i]);
            if (i < romanBytes.length - 1) {
                uint nextVal = _getRomanValue(romanBytes[i+1]);
                if (currentVal < nextVal) {
                    result -= currentVal;
                } else {
                    result += currentVal;
                }
            } else {
                result += currentVal;
            }
            
        }
        return result;  
     }


     function _getRomanValue(bytes1 romanChar) private pure returns (uint) {
        if (romanChar == 'I') return 1;
        if (romanChar == 'V') return 5;
        if (romanChar == 'X') return 10;
        if (romanChar == 'L') return 50;
        if (romanChar == 'C') return 100;
        if (romanChar == 'D') return 500;
        if (romanChar == 'M') return 1000;
        revert("Invalid Roman character");
     
     

     }
}