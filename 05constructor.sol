// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Construct{

    uint public num=6;

    // constructor(){
    //     num=12;
    // }            // Output: num --> 12

    constructor(uint _num){
        num = _num;
    }
}

/*
- A constructor is a special function that executes only once when the smart contract is deployed.
- It is used for initial setup, like setting initial values or initializing state variables.

constructor(uint _num) {
    num = _num;
}
constructor → keyword that defines the constructor function
(uint _num) → input given during deployment
num = _num; → stores the value into the state variable when contract is deployed
*/

/*
1. Only one constructor is allowed: You cannot create multiple constructors in a contract.
2. Constructor is optional: If your contract does not need initial values, you can skip the constructor.
3. Solidity adds a default constructor: If you do not write a constructor, Solidity automatically adds an empty constructor internally.
4. Runs only once: The constructor runs only during deployment and never again.
5. No function visibility required: You don’t write public or external for constructors (from newer versions of Solidity).
*/