/*
What the project contains:

There are two main roles:
# Manager
- Person who creates the contract.
- Controls the lottery.
- Picks the winner.

# Players
- Anyone who participates by paying the entry fee.
- Entry fee = 1 Ether (set as assumption).

# Lottery flow:
- Players send 1 Ether to join the lottery.
- Their addresses are stored in a dynamic payable array.
- Manager waits until 3 or more players have joined.
- Manager calls pickWinner()
- A random player is selected.
- The ENTIRE contract balance is sent to that winner.
- The players array is reset to empty for the next round.

REMB:
- msg.sender will return the address of person who is actually calling this function.
- msg.value is used to know how much Ether was sent.
*/

// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Lottery{

    // entities - manager, players and winner

    address public manager; // manager is the address of the person who deployed the contract
    address payable[] public players; // array of addresses of players
    address payable public winner;

    constructor(){
        manager = msg.sender;
    }

    // Participate Function (Players Joining Lottery)
    function participate() public payable{
        require(msg.value == 10 wei,"Player should pay 1 wei");
        players.push(payable(msg.sender));
    }

    // GetBalance Function (Only manager can check the balance)
    function getBalance() public view returns(uint){
        require(msg.sender == manager,"Only manager can check the balance");
        return address(this).balance;
    }

    // Random Number Generation Function
    function random() internal view returns(uint){
        return uint(
            keccak256(abi.encodePacked(block.difficulty,block.timestamp,players.length))
        );
    }

    // Pick Winner Function
    function pickWinner() public{
        require(manager==msg.sender,"you are not the manager");
        require(players.length >= 3,"Player are less than 3");

        uint r = random();
        uint index = r% players.length;
        winner = players[index];
        winner.transfer(getBalance());
        players = new address payable[](0); // this will intialize the players array back to 0

    }


}