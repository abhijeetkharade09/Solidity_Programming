// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Keyword {
    uint public num;

    function setter(uint _num) public{
        num = _num;   // Use no keyword when Function modifies a state variable.
    }

    function getter() public view returns(uint){     
        return num;   // Use view when: Function reads a state variable.
    }

    function random() public pure returns(uint){
        uint abc;
        abc = 7;
        return abc;  
                    // Use pure when: Function does NOT read or write any state variable.
                    // Only uses local variables.
    }
}