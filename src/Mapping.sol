// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Mapping{
    mapping(uint => string) public names;
    mapping(uint => address) public addresses;

    struct Book{
        string title;
        string author;
        bool complete;
    }

} 