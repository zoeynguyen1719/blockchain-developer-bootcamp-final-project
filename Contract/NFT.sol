// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity ^0.8.3;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

/* Create Contract NFT, inherits ERC721URIStorage, Generate ERC721 URI Storage */
contract NFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    address contractAddress;

    constructor(address marketplaceAddress) ERC721("Metaverse", "METT") {
    /* Construct the contract, initialize CreateAddress as marketplaceAddress */
        contractAddress = marketplaceAddress;
    }

    function createToken(string memory tokenURI) public returns (uint) {
    /* calls internal increment function, generate new tokenId as indexId */
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
		
    /* Mint NFT with current tokenId for contract caller, set tokenURI, and make it public */
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        setApprovalForAll(contractAddress, true);
        return newItemId;
    }
}


enroll()