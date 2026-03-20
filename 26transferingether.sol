// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract TransferEther {

//#1 Payable Functions(Receiving Ether in Contract)
     function sendEthertoContract() public payable {
 
     }

//#2 Reading Contract Balance (address(this).balance)
     function balanceOfContract() public view returns(uint) {
        return address(this).balance;   //  .balance gives how much Ether that address holds (in wei).
     }

//  Global Variable (msg.value) 
//# Payable Address(Sending Ether to External Own Accounts(EOA))
     function sendETHtoEOA(address payable reciever) public payable {
            reciever.transfer(msg.value);
     }

}
/*
# Recap: we will talk about msg.value later, when we talk about payable address and payable function
         because then only you are going to understand the concept of this msg.value

# Transfering Ether:
- Let's say, I want to transfer Ether to my contract. And if you remember from our ethereum types of accounts video, 
  I told you right that smart contract have there own account and this smart contract can also recieve Ether and this will
  we are going to see in this video.

*/

/*# Payable Keyword In Solidity: payable is a special keyword in Solidity that allows a function or an address to receive Ether.*/
/*
#1 Payable Functions (Receiving Ether in Contract)
Goal: Understand how a smart contract receives Ether.

The function: function sendEtherToContract() public payable {}

Why payable?
- Without payable, Solidity will not allow the function to receive Ether.
- payable = makes the function capable for accepting funds.

What happens when you call it?
1.You select an account from Remix.
2.You enter an Ether amount in the VALUE box.
3.Click the function.
4.Ether gets transferred from your account → to contract account address.

Example:
- You type 10 Ether
- Call sendEtherToContract()
- 10 Ether deducted from your wallet account
- And 10 Ether will added to the contract account

Important👉: 
   - You can have whatever code you want inside this function, but in order to recieve some Ether.
   - You don’t need any code inside a payable function to receive Ether.
      Just marking it payable is enough.
--------------------------------------------------------------------------------------------------------------------

#2 Reading Contract Balance (address(this).balance)
Goal: This shows the total Ether stored in the contract.

function balanceOfContract() public view returns(uint) {
    return address(this).balance;
}
Explanation:
    this refers to the current contract.
    address(this) get the Ethereum address of the current contract.
    .balance gives how much Ether that address holds (in wei).
    
Contract balance lives at: address(this).balance

Why wei?
- Blockchain stores value in wei, not in ether.
- 1 Ether = 10^18 wei (very large number)

Demo: - Contract receives 20 Ether
      - Calling balanceOfContract() returns a huge number (because it’s in wei)

You can use an online converter to convert wei → ether.
---------------------------------------------------------------------------------------------------------------------


# Payable Address(Sending Ether to External Own Accounts(EOA))
Goal: Now you learn how to send Ether to other person’s wallet address.

The function:
function sendEth(address payable receiver) public payable {
    receiver.transfer(msg.value);
}

Key points:
1. The receiver must be payable
Otherwise, the address cannot receive money.

2. The function itself must be payable
Because user needs to send Ether into this function so it can transfer out.

3. msg.value is used to know how much Ether was sent.

Example:
You choose Account A as the caller.
Enter 10 Ether.
Enter Account B as the receiver address.
Call the function.

RESULT:
10 Ether is deducted from Account A.
10 Ether is added to Account B.

msg.value recap:
Whatever amount you enter in the Remix VALUE box
→ that amount becomes msg.value.
*/


