// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;


contract GlobalVariables{
    address public contractAddress;
    address public payer;
    address public origin;
    uint public amount;

    constructor(){
        contractAddress = address(this); 
    }

    function pay() public payable{
        payer = msg.sender;
        origin = tx.origin;
        amount = msg.value;
    }

    function getBlockInfo() public view returns(uint, uint,uint){
        return(
            block.number,
            block.timestamp,
            block.chainid
        );
    }
}