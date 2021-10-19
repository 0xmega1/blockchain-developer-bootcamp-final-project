// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract SuperMeta is ERC721, ERC721Enumerable, ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("SuperMeta", "SUPR") {}

    function _baseURI() internal pure override returns (string memory) {
        return "http://metadata.json";
    }

    function safeMint(address to) public onlyOwner { // I think I want to remove onlyOwner - confirm
        _safeMint(to, _tokenIdCounter.current());
        _tokenIdCounter.increment();
    }

    // The following functions are overrides required by Solidity.

    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

     // Stub functions for functionality

    function mintToken(address _to) 
        public 
    {

        // Mint a new token and point to tokenURI that contains a mix of selected metadata from NFTA and NFTB 

    }
    function viewToken() 
        public 
        view 
        returns (uint tokenId, address owner, string baseUri) 
    {

        // Looks up a token by ID and return the ID, owner and full token URI (concatenate baseURI + token ID)

    }

    function viewOwnerTokens(address owner)
    public
    view
    {
        // Look up the tokens owned by an address and return an array of tokenIds
    }
}