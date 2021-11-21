// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract sharedWallet {
    
    address  owner;
    uint public balaceReceived;
    
    constructor ()  {
        owner = msg.sender;
    }
    
    function depositFunds(address payable _sharedWallet) public payable {
        balaceReceived += msg.value;
        _sharedWallet.transfer(address(this).balance);
    }
    
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
    
    function withdrawAllFunds(address payable _to) public payable {
        require(owner == _to, "You are not the owner" );
         balaceReceived -= msg.value;
        _to.transfer(msg.value);
       
    }
}

