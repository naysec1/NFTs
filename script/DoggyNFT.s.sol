// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {DoggyNFT} from "../src/DoggyNFT.sol";

contract DeployBasicNft is Script {
    function run() external returns (DoggyNFT) {
        vm.startBroadcast();
        DoggyNFT basicNft = new DoggyNFT(
            "https://ipfs.io/ipfs/bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json"
        );
        vm.stopBroadcast();
        return basicNft;
    }
}
