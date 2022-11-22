// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.8;

contract Bank {
    address public owner;
    mapping(address => uint) private userbalance;

    constructor() public{
        owner = msg.sender;
    }
    modifier onlyOwner(){
        require(msg.sender == owner, 'you are not the owner of this account');
        _;
    }
    function deposite() public payable returns(bool){
        userbalance[msg.sender] += msg.value;
        return true;
    }
    function withdraw(uint amount) public payable onlyOwner returns(bool){
        require(amount <= userbalance[msg.sender],'you dont have enough funds.');
        userbalance[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
        return true;
    }
    function getBalance() public view returns(uint){
        return userbalance[msg.sender];
    }
}
