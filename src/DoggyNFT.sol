// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DoggyNFT is ERC721, Ownable {
    uint256 public nextTokenId;
    uint256 public constant MAX_SUPPLY = 10000;
    string private baseTokenURI;

    constructor(string memory _baseTokenURI) ERC721("DoggyNFT", "DOGY") Ownable(msg.sender) {
        baseTokenURI = _baseTokenURI;
    }

    function mint() external {
        require(nextTokenId < MAX_SUPPLY, "Max supply reached");
        _safeMint(msg.sender, nextTokenId);
        nextTokenId++;
    }

    function setBaseURI(string memory _baseTokenURI) external onlyOwner {
        baseTokenURI = _baseTokenURI;
    }

    function _baseURI() internal view override returns (string memory) {
        return baseTokenURI;
    }
}
