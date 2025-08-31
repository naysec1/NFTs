// SPDX-Licence-Identifer: MIT

pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {DoggyNFT} from "../src/DoggyNFT.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";

contract interact is Script {
    string public constant TOKENURI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function run() external {
        address mostRecentlyDeployed = 0x2279B7A0a67DB372996a5FaB50D91eAA73d2eBe6;
        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        DoggyNFT(contractAddress).mint();
        vm.stopBroadcast();
    }
}
