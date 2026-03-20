// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract State {
    uint public num = 4;   // state variable

    uint public num2;

    // constructor() {
    //     num2 = 10;
    // }

    function setter() public {
        num2 = 10;
    }

}
/*
What are State Variables?
Variables declared inside the contract (outside functions).
Their data is stored permanently on blockchain.

Example: uint public num;

Ways to initialize: (to change the default value of the state variable) 
1.Initializing the variable at declaration 
2.Inside constructor 
3.Using setter function

Important
Changing/writing state variables costs gas.
Reading state variables is free.
*/
