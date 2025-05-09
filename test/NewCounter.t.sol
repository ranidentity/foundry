pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/NewCounter.sol";

contract CounterTest is Test{
    Counter public counter;

    function setUp() public{
        counter= new Counter();
    }
    
    function testIncrement() public{
        counter.increment();
        assertEq(counter.count(),1);
    }

    function testDecrement() public{
        counter.increment();
        counter.decrement();
        assertEq(counter.count(),0);
    }
    function testReset() public{
        counter.reset();
        assertEq(counter.count(),0);
    }
    function testUnderflowReverts() public {
    vm.expectRevert("Underflow");
    counter.decrement();
}

}