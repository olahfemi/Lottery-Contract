// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.9;

contract Lottery{
    
    address public admin; 
    address[] public players;

   constructor() {
        admin = msg.sender;
    }
    
    function enter() public payable{
        require(msg.value >= 1 ether, "You need to put in One or more Ether");
        players.push(msg.sender);
    }
    
    function random() private view returns(uint){
        return  uint (keccak256(abi.encode(block.timestamp,  players)));
    }

    modifier restricted(){
        require(msg.sender == admin, "Only the deployer of this contract can use this function");
        _;
    }

    function pickWinner() public restricted{
        uint index = random() % players.length;
        payable (players[index]).transfer(address(this).balance);
    }


}