// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MyWallet {

    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {
    }

    function withdraw(uint _amount) external {
        require(msg.sender == owner, "Must own this wallet to send Ether from it");
        // require(address(this).balance >= _amount, "Cannot send more than this wallet holds");
        payable (msg.sender).transfer(_amount);
        
    }
      function getBalance() external view returns(uint){
            return address(this).balance;
        }

}