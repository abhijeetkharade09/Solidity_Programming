// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/*Event Organization Contract
Entities:
Organizer - Creates event
Attendee - Buys ticket
Transfer ticket option - Attendee can transfer purchased ticket to someone else
*/


contract EventContract{

    struct Event{
        address organizer;
        string name;
        uint date;
        uint price;
        uint ticketCount;
        uint ticketRemaining;
    }

    mapping(uint=>Event) public events; // details of event
    mapping(address=>mapping (uint=>uint)) public tickets;
    uint public nextId;

    function createEvent(string calldata name, uint date, uint price, uint ticketCount) public{
        require(block.timestamp<date,"You cannot create event of past date");
        require(ticketCount>0,"Ticket count must be greater than zero");
        events[nextId]=Event(msg.sender,name,date,price,ticketCount,ticketCount);
        nextId++;
    }

    function buyTicket(uint id, uint quantity) public payable{
        require(events[id].date!=0,"Event does not exist");
        require(events[id].date>block.timestamp,"Event has ended");
        Event storage _event=events[id];
        require(msg.value==(_event.price*quantity),"Ether not enough");
        require(_event.ticketRemaining>=quantity,"Not enough ticket left");
        _event.ticketRemaining-=quantity;
        tickets[msg.sender][id]+=quantity;
    }

    function transferTicket(uint id, uint quantity, address to) public{
        require(events[id].date!=0,"Event does not exist");
        require(events[id].date>block.timestamp,"Event has ended");
        require(tickets[msg.sender][id]>=quantity,"You do not have ticket to transfer");
        tickets[msg.sender][id]-=quantity;
        tickets[to][id]+=quantity;
    }
}