// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;



import "./ISort.sol";

/**
 * @title ISort
 * @dev 排序算法的标准接口，支持对 uint256 数组进行原地排序
 */
contract Sort is ISort{

    function Sortz(uint[] memory x,uint[] memory y) external pure returns(uint[] memory){
        uint[] memory result = new uint256[](x.length + y.length);

        // 复制 x 数组
        for (uint i = 0; i < x.length; i++) {
            result[i] = x[i];
        }
        // 复制 y 数组
        for (uint i = 0; i < y.length; i++) {
            result[x.length + i] = y[i];
        }
         result=Sortx(result);


        return result;
    }


    function Sortx(uint[] memory _result)  private pure returns(uint[] memory){

        for(uint i=1;i<_result.length;i++){
            uint tmp=_result[i];
            uint j=i;
            while((j>0)&&(tmp<_result[j-1])){
                _result[j]=_result[j-1];
                j--;
            }
            _result[j]=tmp;
        }
        return _result;
    }
}