// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
// change to safeerc20
// interface IERC20{
//     function transferFrom(address _from, address _to, uint value) external returns (bool success);
// }

contract Wallet is ReentrancyGuard{
    using SafeERC20 for IERC20;
    uint public count = 0;
    address public immutable  owner;

    event WeiSent(address to, uint amount);
    event Deposit(address to, uint amount);
    event Withdrawal(address to, uint amount);
    event TokensWithdrawn(address indexed token, address indexed to, uint256 amount);


    receive() external payable{}
    fallback() external payable{
        count++;
    }
    constructor(){
        owner = msg.sender;
    }

    function checkBalance() public view returns(uint){
        return address(this).balance;
    }

       function depositToken(address _tokenAddress, uint256 _amount) public {
        require(_amount > 0, "Amount must be greater than 0");
        IERC20(_tokenAddress).safeTransferFrom(msg.sender, address(this), _amount);
        emit Deposit(msg.sender, _amount);
    }

    function withdrawToken(address _tokenAddress, uint _amount) external nonReentrant {
        require(msg.sender == owner, "Not the owner");
        require(IERC20(_tokenAddress).balanceOf(address(this)) >= _amount, "Insufficient token balance");
        IERC20(_tokenAddress).safeTransfer(msg.sender, _amount);
        emit TokensWithdrawn(_tokenAddress, msg.sender, _amount);
    }
 
    function sendWei(address payable _to) public payable{
        require(msg.value > 0, "No Ether sent");
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed"); //if false then ...
        emit WeiSent(_to, msg.value);
    }


    function withdrawWei(uint amount)external{
        require(msg.sender == owner,"not the owner");
        require(address(this).balance >= amount,"balance not enough");
        (bool sent,) = payable(owner).call{value:amount}("");
        require(sent,"Withdraw fail");
        emit Withdrawal(owner, amount);
    }
}