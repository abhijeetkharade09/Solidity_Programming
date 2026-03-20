// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract MemoryvsCalldata {

    uint[5] public arr;

    // Remb: Whenever you are using reference data type inside a function you have to use this memory keyword

    function insertArr(uint[5] memory _arr) public {
        arr=_arr;
    }
    function insertArr2(uint[5] memory _arr) public{
        arr=_arr;     
        arr[2]=30;  // you can use memory keyword if you want to make changes in array i.e arr
    }
    /* 
     - If you don't want to make changes in array then also you can use --> memory keyword 
       otherwise you can also use --> calldata so that you can tell solidity compiler see I am not making any changes in array i.e arr
    
    function callArr2(uint[5] calldata _arr) public{
        arr=_arr;    //  ✅ You only read the array or string cannot make changes
      
    }
    function callArr2(uint[5] calldata _arr) public{
        arr=_arr;      
        arr[2]=30;   //  ❌ Cannot be modified(read-only)
    }
    */
    function returnArr2() public view returns(uint[5] memory){
        return arr;      // memory keyword is used for returning reference data type variable i.e(uint[5] memory)
    }
}

/*
memory vs calldata

# memory                                                   # calldata
- Temporary copy of the data                               - Temporary, but it does not create a copy like memory directly reads from the input data area.
- Can be modified                                          - Cannot be modified
- Remb: Used at function arguments, inside functions       - Remb: Used only at function arguments, means you cannot use inside function 
  and also while returning reference data type variable      or while returning reference data type variable  i.e returns(datatype)

# When to use? 
- Use calldata for external read-only data, you cannot change the array
- Use memory if you want to change the array
*/