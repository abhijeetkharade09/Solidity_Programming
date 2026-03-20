// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Local {
    uint a;  // state variable

    function local() public pure returns(uint){
        uint b; // local variable
        uint c; // local variable
        return b+c;
    }
}
/*
Declared inside functions.
Stored temporarily in stack, not blockchain storage.
Destroyed after function ends.
*/