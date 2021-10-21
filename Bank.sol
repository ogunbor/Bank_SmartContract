pragma solidity 0.7.5;


contract EtherWallet {
    
    mapping(address => uint) balance;
    
    address public owner;
    
    constructor(address _owner) {
        owner = _owner;
    }
    
    
    function deposit() public payable {
    }
    
    // send money to recipient's address
    function send(address payable to, uint amount) public {
         require(balance[msg.sender] <= amount);
         
         if(msg.sender == owner) {
            to.transfer(amount); 
            return;
         }
        revert('Sender is not allowed');
    }
    
    function balanceOf() public  view returns(uint){
        //return balance[msg.sender];
        return address(this).balance;
    }
}