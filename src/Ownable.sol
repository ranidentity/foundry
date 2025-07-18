// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Ownable{
    address owner;
    constructor(){
        owner = msg.sender;
    }
    modifier onlyOwner {
        require(msg.sender== owner,'caller must be owner');
        _;
    }
}

contract MyContract is Ownable{
    string public name = "Example 1";
    
    function setName(string memory _name) public onlyOwner{
        name = _name;
    }
}