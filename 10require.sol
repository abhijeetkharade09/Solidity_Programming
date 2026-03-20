// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Require {
    
    function isZero(uint a) public pure returns(bool) {

        require(a==0, "a is not equal to 0");  // (2) 
        return true;   //(1)
    }
   
// Using if-else instead of require
    function isZeroIf(uint b) public pure returns(bool) {
        if(b==0){
            return true;
        }          
        revert("a is not equal to 0"); // (2)
    //  return "a is not equal to 0";  // (1)
    }
}

/*
require() is used to check conditions before the rest of the function runs.
It is mainly used for:
- Input validation             - Access control (checking who can call the function)
- Preventing invalid actions   - Error handling

Explanation:
- require(a == 0, ...) checks whether a is 0.
- If you enter 0 → condition is true → returns true
- If you enter 12 → condition is false → function stops and error shown: "a is not equal to 0"

🔥Transaction Reverted
If require() fails i.e false:
The blockchain reverses all changes and says: “Transaction reverted to initial state.”
All gas left is returned (unused)
Blockchain behaves like the function never ran
This prevents wrong data from being stored.

IMP Q. Is require() same as if-else?
--> Yes, but require() is: -shorter -cleaner -most commonly used

// Important difference:
// (1) Returning a string or boolean is NOT an error.
// (2) Only revert() or require() through an error.

Conclusion
require() is preferred because:
- You write less code - Easy to read - Used by most developers
revert() → through manual error
*/