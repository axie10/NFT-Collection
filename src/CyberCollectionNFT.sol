// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {ERC721URIStorage} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";

contract CyberCollectionNFT is ERC721 {
    // We need to write this to use the library
    using Strings for uint256;

    // Variables
    uint256 private _nextTokenId; // 0 by default
    uint256 private totalSupply;
    string private baseUri;

    // Events
    event MintNFT(address userAddress_, uint256 tokenId_);

    // Constructor
    constructor(string memory name_, string memory symbol_, uint256 totalSupply_, string memory baseUri_)
        ERC721(name_, symbol_)
    {
        totalSupply = totalSupply_;
        baseUri = baseUri_;
    }

    // Functions
    function mint() public {
        require(_nextTokenId < totalSupply, "Sold out");
        // Important point of NFT because not mint two token equals
        _safeMint(msg.sender, _nextTokenId);
        uint256 id = _nextTokenId;
        // tokenURI(_nextTokenId);
        _nextTokenId++;

        emit MintNFT(msg.sender, id);
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return baseUri;
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        _requireOwned(tokenId);

        string memory baseURI = _baseURI();
        return bytes(baseURI).length > 0 ? string.concat(baseURI, tokenId.toString(), ".json") : "";
    }
}
