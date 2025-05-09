pragma solidity ^0.8.20;

contract Counter{
    uint256 public count;    
    function increment() public{
        count += 1;
    }
    function decrement() public{
        require(count >0, "Underflow");
        count -= 1;
    }
    function reset() public{
        count=0;
    }

}