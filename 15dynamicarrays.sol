// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract DynamicArray{ // A dynamic array is an array whose size can grow or shrink during runtime.
    
    uint[] public arr;

    function insert(uint item) public { // Insert elements: Adds a new item at the end of the array.
        arr.push(item);       
    }

    function removeLast() public { // Remove elements: Removes the last item from array
        arr.pop();
    }

    function lengthArr() public view returns(uint){  // Length of the Array: Returns the current size of the array.
        return arr.length;
    }

    function returnAll() public view returns(uint[] memory){ // Return the Entire Array: The array is stored in storage, but returned data goes through memory.
        return arr;  
    }


}