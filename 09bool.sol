// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Boolean {
    bool public value = true;
    
 // checking if a number is even.
    function checkEven(uint a) public pure returns(bool) {
        if (a%2==0) {
            return true;
        } else {
            return false;
        }
    }
}
/*
bool data type: can only be true or false.

Bool default value: When you declare a boolean variable and do NOT give any value:
Example: bool public value;    // Its default value is false.

Setting bool manually: If you write
Example: bool public value = true;  // After deploying, the value will be true.

Where bool is used:
- Mostly in conditions (if-else).
- Example function: checking if a number is even.
*/