// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Modifier {

    modifier isCorrect{
        require(true==true,"It is not true");
        _;         // _ means: put the function’s body remaining code here. i.e return 1,2,3 or 4
    }
    
    function f1() public pure isCorrect returns(uint) {
        return 1;
    }
    function f2() public pure isCorrect returns(uint) {
        return 2;
    }
    function f3() public pure isCorrect returns(uint) {
        return 3;
    }
    function f4() public pure isCorrect returns(uint) {
        return 4;
    }

/*
Problem: Many functions were repeating the same require() check.
Solution: Modifiers solve repetition --> Modifier is like a reusable block of code.

Example: modifier isCorrect{
            require(true==true,"It is not true");
            _;        
         }
Meaning: - First run the require()
         - Then run the rest of the function where _ is.

function f1() {  } ................. function f2(){  }
So modifier does:
    ✔ Writes the require() only once  
    ✔ Used in many functions 
    ✔ Makes code cleaner

If modifier condition fails
    - Example: comparing true == false → always fails
    - All functions with that modifier revert the transaction
*/

// Passing argument to modifier: Let’s say a function checks if a number is even.  
        modifier isEven(uint a){
            require(a%2==0,"Number not Even");
            _;
        }

        function Result(uint _a) public pure isEven(_a) returns(bool){
            return true;
        }
/* 
Working:
    - Whatever value you passed into the function Result(uint _a) the same value is sent to the modifier isEven(_a) as well.
    - The modifier receives this value and checks the condition inside require() BEFORE function runs.
    - If OK →  Function returns true
    - If NOT → Transaction reverted → function does NOT run
*/
}