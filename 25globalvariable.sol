// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract GlobalVariable {
/* msg.sender */
  function CallerAddress() public view returns(address) {  
    return msg.sender; // msg.sender will return the address of person who is actually calling this function therefore in function returns(address) declared.
  }

/* block.timestamp
   - Returns the timestamp of the current block (in seconds)
   - Represents the approximate time when the block was created */

   function returnBlockTimeStamp() public view returns(uint){
    return block.timestamp;
   }


}
/*
# Global Variable:
- Global Variable in solidity makes the life of solidity developer very easy.
- Global variables are special built-in variables provided by Solidity. They give 
  information about the blockchain, transaction and contract.
- You can use them anywhere inside your smart contract.

# Important global variables:
    msg.sender → who called the function
    msg.value → how much Ether was sent
    block.timestamp → time of block creation

# msg.sender
  - msg.sender will return the address of person who is actually calling this function therefore in function returns(address) declared. 

  How it works:
  - If user1 calls this function → returns address of user1
  - If user2 calls this function → returns address of user2

# block.timestamp
  What is block.timestamp?
  - It is the time WHEN the transaction was added to the blockchain.
  - The number is UNIX time (seconds since 1 Jan 1970).

  Example: 
  - Block timestamp = 1764310378
  - We can convert it into date & time in unixtimestamp.com
    Your Time Zone==> Fri Nov 28 2025 11:42:58 GMT+0530 (India Standard Time)

# msg.value 
--> we will talk about msg.value later, when we talk about payable address and payable function
    because then only you are going to understand the concept of this msg.value

*/