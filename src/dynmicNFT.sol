// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DynamicNFT is ERC721, Ownable {
    uint256 public TokenId;
    uint256 public constant MAX_SUPPLY = 10000;
    string private sadSvgImageURI;
    string private happySvgImageURI;

    enum Mood {
        sad,
        happy
    }

    mapping(uint256 => Mood) private s_tokenIdtoMood;

    constructor(string memory _sadSvgImageURI, string memory _happySvgImageURI)
        ERC721("MoodNft", "MN")
        Ownable(msg.sender)
    {
        TokenId = 0;
        sadSvgImageURI = _sadSvgImageURI;
        happySvgImageURI = _happySvgImageURI;
    }

    function mint() public {
        require(TokenId < MAX_SUPPLY, "Max Supply Reached");
        _mint(msg.sender, TokenId);
        s_tokenIdtoMood[TokenId] = Mood.happy;
        TokenId++;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        string memory imageURI;

        if (s_tokenIdtoMood[tokenId] == Mood.sad) {
            imageURI = sadSvgImageURI;
        } else {
            imageURI = happySvgImageURI;
        }

        string memory tokenMetadata = string(
            abi.encodePacked(
                '{"name": "',
                name(),
                '", "description": "An NFT that reflects your mood!", ',
                '"attributes": [{"trait_type": "Mood", "value": "100"}], ',
                '"image": "',
                imageURI,
                '"}'
            )
        );

        return string.concat("data:application/json;base64,", Base64.encode(bytes(tokenMetadata)));
    }
}
