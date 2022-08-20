//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Bet {
    address owner;

    constructor() payable {
        console.log("Contract started with balance: ", address(this).balance);
        owner = msg.sender;
    }

    event Payment(address indexed from, address indexed to, uint256 amount);

    function setBet(string memory message) public payable {
        require(
            (msg.sender).balance >= msg.value,
            "Your balance is not enough"
        );
        payable(address(this)).send(msg.value);
        console.log(message);
        console.log("Balance of contract", address(this).balance);
    }

    function withdraw() public payable {
        require(msg.sender == owner, "You cannot call this function");
        require(msg.value <= address(this).balance, "Insufficient funds");
        payable(owner).send(msg.value);
    }

    function payment(address payable winner, uint256 amount) public payable {
        require(msg.sender == owner, "You can not call this transaction");

        require(
            amount <= address(this).balance,
            "You're trying to withdraw more amount than contract balance"
        );
        console.log("Balance of winner before: ", winner.balance);
        payable(winner).transfer(amount);
        console.log(
            "Balance of contract after withdraw: ",
            address(this).balance
        );
        emit Payment(address(this), winner, amount);
        console.log(msg.sender, owner);
        console.log("Balance of winner after: ", winner.balance);
    }
}
