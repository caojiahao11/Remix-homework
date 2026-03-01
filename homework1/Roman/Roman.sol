// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./IRoman.sol";

contract Roman is IRoman{
     function RomantoInt(string calldata _roman) external pure override  returns(uint){
        bytes memory romanBytes =bytes(_roman);
        uint result=0;
        for (uint i=0;i<romanBytes.length;i++){
            uint currentVal = _getRomanValue(romanBytes[i]);

            if(i<romanBytes.length-1){
                uint nextVal=_getRomanValue(romanBytes[i+1]);
                if(currentVal<nextVal){
                    result-=currentVal;
                }else{
                     result+=currentVal;
                }
            }
            result+=currentVal;

        }
        return result;
     }


// 整数转罗马实现（适配你的合约结构）
    function IntToRoman(uint x) external pure returns (string memory) {
        // 校验输入范围（罗马数字仅支持1-3999）
        require(x >= 1 && x <= 3999, "IntToRoman: Number must be 1-3999");

        // 定义数值-罗马字符映射（包含特殊组合）
        uint[13] memory values = [uint(1000), 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
        string[13] memory symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"];

        bytes memory result = new bytes(0);
        for (uint i = 0; i < 13; i++) {
            // 贪心匹配最大数值
            while (x >= values[i]) {
                x -= values[i];
                result = abi.encodePacked(result, symbols[i]);
            }
            if (x == 0) break;
        }
        return string(result);
    }


      function _getRomanValue(bytes1 romanChar) private pure returns (uint){
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

   

