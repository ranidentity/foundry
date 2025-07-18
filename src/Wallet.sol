// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Wallet{
    uint public value1 = 1 wei;
    uint public value2 = 1 gwei;
    uint public count = 0;
    receive() external payable{}
     
    fallback() external payable{
        count++;
    }
    
    function checkBalance() public view returns(uint){
        return address(this).balance;
    }

    function sendWei(address payable _to) public payable{
        
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed"); //if false then ...
    }
}