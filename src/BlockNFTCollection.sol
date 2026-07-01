// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {ERC721URIStorage} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BlockNFTCollection is ERC721 {
    uint256 private _nextTokenId;
    constructor(string memory name, string memory symbol) ERC721(name, symbol) {}

    function awardItem(address player) public {
        uint256 tokenId = _nextTokenId++;
        _safeMint(player, tokenId);
    }
}
