// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract MemoryStorage {

    uint[3] public arr=[11,22,33];  // #1 - arr is an array that we created at storage area

    function fmemory() public view {   // - Here remb: view is used to read state variable. In this function, we are modifying local variable check it.
        uint[3] memory arr1 = arr;     // - Here, arr1 is local variable and this arr1 is getting stored in this memory area. 
                                       //   while this arr is getting stored at storage area i.e #1
                                       // - Here, arr1 is an array that we have created inside the memory
                                    
        arr1[0]=100;   // changes only arr1 now it become arr1 100,22,33 but arr1 is a temporary copy and it is limited to this function only
    }
    // Output: but arr stays 11,22,33

    function fstorage() public {     // - see this --> no view and pure because we are changing state variable
        uint[3] storage arr2 = arr;  // - Here storage keyword will help us to point out this array i.e arr 
                                     //   it means it will help us to reference this arr array 
                                     //   you will say how --> so we have here, arr2 as a local variable name and in this i will assign arr i.e {arr2=arr}
                                     // - Here, arr2 is a pointer to arr
         
        arr2[1]=200;  // changes arr also  
    }
    // Output: arr become 11,200,33 

    function retunArr() public view returns(uint[3] memory){
        return arr;
    }

    
}
