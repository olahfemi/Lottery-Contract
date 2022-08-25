// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Lottery {

    // Initializing the state variables
    uint winningNumber = 10;

    uint randNonce = 0;
 
// Defining a function to generate
// a random number and comparing the 
// number to the winning number
function randMod(uint _modulus) internal returns(bool) {
   
   // increase nonce
   randNonce++; 
   return winningNumber == uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, randNonce))) % _modulus;
 }

}