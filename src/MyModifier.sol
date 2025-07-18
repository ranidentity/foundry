// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract MyModifier{
    string public myName = "Modifier Example";
    address private owner;
    uint public balance;
    // can only rea down variable, cannot write
    function getName1() public view returns(string memory){
        return myName;
    }
    // cannot read / write own variable
    function getSum(uint a, uint b) public pure returns(uint){
        return a+b;
    }
    // payable with ether
    function pay() public payable{
        balance = msg.value;
    }
    // custom modifier
    modifier onlyOwner{
        require(msg.sender == owner,'caller must be owner');
        _;
    }
}