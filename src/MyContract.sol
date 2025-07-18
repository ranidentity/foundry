// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract MyContract{
    string public myName="Example modifier";
    uint public count;
    uint public balance;

    function increment1() public {
        // called 
        count++;
    }
    // only within same contract
    function increment2() private{
        count++;
    }
    function callPrivateIncrement() public{
        increment2();
    }
    // only within same contract, can be inherit
    function increment3() internal{
        count++;
    }
    function increment4() external{
        count++;
    }
}