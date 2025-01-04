// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleWallet {
    mapping(address => uint256) public balances;

    // Event to log transfers
    event Transfer(address indexed from, address indexed to, uint256 amount);

    // Deposit function to send Ether to the contract
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    // Withdraw function to send Ether from the contract
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        payable(msg.sender).transfer(amount);
        balances[msg.sender] -= amount;
        emit Transfer(msg.sender, address(this), amount);
    }

    // Check balance function
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}
