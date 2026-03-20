// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Crowdfunding{

    struct Request{
        string description;
        address payable recipient;
        uint value;
        bool completed;
        uint noOfVoters;
        mapping(address=>bool) voters;
    }

    mapping(address=>uint) public contributors;
    mapping(uint=>Request) public requests;

    uint public numRequests;
    address public manager;
    uint public minimumContribution;
    uint public deadline;
    uint public target;
    uint public raisedAmount;
    uint public noOfContributers;

// REMB:
// - msg.sender will return the address of person who is actually calling this function.
// - msg.value is used to know how much Ether was sent.

    constructor(uint _target, uint _deadline){
        target = _target;
        deadline = block.timestamp + _deadline;
        minimumContribution = 10 wei;
        manager = msg.sender;
    }

    modifier onlyManager(){
        require(msg.sender == manager,"You are not the manager");
        _;
    }

    function createRequest(string calldata _description, address payable _recipient, uint _value) public onlyManager{
        Request storage newRequest = requests[numRequests];
        numRequests++;
        newRequest.description = _description;
        newRequest.recipient = _recipient;
        newRequest.value = _value;
        newRequest.completed = false;
        newRequest.noOfVoters = 0;
    }

    function contributions() public payable{
        require(block.timestamp<deadline,"deadline is passed");
        require(msg.value>=minimumContribution,"Minimum Contribution required is 10 wei");

        if(contributors[msg.sender]==0){
            noOfContributers++;
        }
        contributors[msg.sender]+=msg.value;
        raisedAmount+=msg.value;
    }

    function getContractBalance() public view returns(uint){
            return address(this).balance;
    }

    function refund() public {
        require(block.timestamp>deadline && raisedAmount<target,"You are not eligible for refund");
        require(contributors[msg.sender]>0,"You are not a contributor");
        payable(msg.sender).transfer(contributors[msg.sender]);
        contributors[msg.sender]=0;
    }
    
    function voteRequest(uint _requestNo) public{
        require(contributors[msg.sender]>0,"You are not a contributor");
        Request storage thisRequest = requests[_requestNo];
        require(thisRequest.voters[msg.sender]==false,"You have already voted");
        thisRequest.voters[msg.sender]==true;
        thisRequest.noOfVoters++;
    }
    // Number of contributors = 3
    // Total number of votes = 2
    // 2 > 3/2

    function makePayment(uint _requestNo) public onlyManager{
        require(raisedAmount>=target,"Target is not reached");
        Request storage thisRequest = requests[_requestNo];
        require(thisRequest.completed == false,"This request has been completed");
        require(thisRequest.noOfVoters>noOfContributers/2,"Majority does not support the request");
        thisRequest.recipient.transfer(thisRequest.value);
        thisRequest.completed=true;
    }
    
}