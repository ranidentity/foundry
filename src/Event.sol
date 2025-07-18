// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Event{
    string public message = "hello world";
    
    event MessageUpdated(
        address indexed _user,
        string _message
    );

    function updateMessage(string memory _message) public{
        message = _message;
        emit MessageUpdated(msg.sender, _message);
    }
}