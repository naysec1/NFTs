// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/DoggyNFT.sol";

contract DoggyNFTTest is Test {
    DoggyNFT public doggyNFT;
    address public USER = makeAddr("user");
    string public constant PUG =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    address alice = makeAddr("alice");
    address bob = makeAddr("bob");

    function setUp() public {
        doggyNFT = new DoggyNFT(PUG);
    }

    function testname() public view {
        string memory name = "DoggyNFT";
        assertEq(doggyNFT.name(), name);
        string memory symbol = "DOGY";
        assertEq(doggyNFT.symbol(), symbol);
    }

    function testMint() public {
        vm.prank(alice);
        doggyNFT.mint();
        vm.prank(bob);
        doggyNFT.mint();
        assertEq(doggyNFT.ownerOf(0), alice);
        assertEq(doggyNFT.ownerOf(1), bob);
    }
}
