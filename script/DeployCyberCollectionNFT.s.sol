// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Script} from "forge-std/Script.sol";

import {CyberCollectionNFT} from "../src/CyberCollectionNFT.sol";

contract CyberCollectionNFT_Test is Script {
    function run() external returns (CyberCollectionNFT) {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast();

        string memory name_ = "Cyber Collection";
        string memory symbol_ = "CYBR";
        uint256 totalSupply_ = 2;
        string memory baseUri_ = "ipfs://bafybeic6437irlc2al6gqmf3lzannkjf6p2u2eq5g6t3csivp5ax2eeloe/";

        // invoke the contract
        CyberCollectionNFT cyberCollectionNFT = new CyberCollectionNFT(name_, symbol_, totalSupply_, baseUri_);

        vm.stopBroadcast();
        return cyberCollectionNFT;
    }
}
