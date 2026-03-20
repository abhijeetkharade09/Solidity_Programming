// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Address {

    address public addr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

}
/*
address data type:
- Stores wallet addresses or smart contract addresses

Example: address public addr;
- The address type is a 160-bit value that does not allow any arithmetic operations

Use of Address Data type:
- Store a user’s account
- Used heavily in payable functions later
- And in upcoming sections when we will talk about payable address and payable functions 
  then we will see one of the most important applications of this address data type but 
  for now just remember it is a data type which is helping us to store address of 
  external own account or of our contract
*/