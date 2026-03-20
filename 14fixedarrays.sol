// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract FixArrays {

/*    uint[5] public arr;
Meaning: - 5 elements  - Default values = 0      */

//#1 Initialize with values
    uint[5] public arr=[10,20,30,40,50];

//#2 Insert an element using a function
    function insert(uint index, uint _value) public  {
        arr[index]=_value;
    }
//#3 Return Element
    function returnArr(uint _index) public view returns(uint) {
        return arr[_index];
    }
//#4  Returning Entire Array (memory keyword)  // Since we are returning a entire array, having 5 elements so we need to mention that as well.
    function returnAllElements() public view returns(uint[5] memory) {  
            return arr;    
    }

}
/*
# In Solidity, there are actually 2 types of arrays:  - Fixed Array  - Dynamic Array

# We need to use here, memory keyword to make this function work You Will Say Why?
- You must use memory keyword because array is a reference data type. 
- Therefore when we are writing this arr variable at contract level so this arr variable is actually 
  getting stored at storage area we already know that.                                                                                
- SO REMB: whenever you are returning any kind of reference data type use this memory keyword in function or inside the function. 

# Why memory must be used?
- Because the returned array is a temporary copy, and temporary data always uses memory.
- So you must write:
        returns (uint[5] memory)
- This tells Solidity: “When you return this array, store the returned data in memory, not on storage.”
- Calldata is only allowed for function inputs, not for return values. Returned data cannot be in calldata.
- You cannot use memory at contract level because memory keyword is actually used for functions only.
- This memory keyword is also used inside function but not at contract level. 
*/

/* Important Summary for Revision:
 - memory: Whenever you are returning any kind of reference data type use this memory keyword. You cannot use memory at contract level 
           because memory keyword is actually used inside for functions only.
 
 - calldata: Calldata is only allowed for function inputs, not for return values. Returned data cannot be in calldata.
   
*/