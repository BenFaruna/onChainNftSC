//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/Base64.sol";


contract OnChainNFT is ERC721URIStorage {
    using Strings for uint256;
    
    uint256 private _tokenIds;

    constructor() ERC721 ("DevFarunaNFT", "DFN"){

    }

    function getTokenURI(uint256 _tokenId) pure public returns (string memory) {
        string memory id = Strings.toString(_tokenId);
        bytes memory dataURI = abi.encodePacked(
            '{',
                '"name": "DevFarunaNFT #', id, '",',
                '"description": "DevFaruna giving out free NFTs ', id, '",',
                '"image": "', generateNFT(_tokenId), '"',
            '}'
        );
        return string(
            abi.encodePacked(
                "data:application/json;base64,",
                Base64.encode(dataURI)
            )
        );
    }

    function generateNFT(uint256 _tokenId) pure public returns (string memory) {
        bytes memory svg = abi.encodePacked(
        '<svg id="sw-js-blob-svg" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">',
        '<defs><linearGradient id="sw-gradient"><stop id="stop1" stop-color="rgb(248, 117, 55)" offset="0%"></stop><stop id="stop2" stop-color="rgb(251, 168, 31)" offset="100%"></stop></linearGradient></defs>',
        '<path fill="url(#sw-gradient)" d="M 17.5 -19.2 C 25 -14.5 35.1 -11.2 37.9 -5.2 C 40.7 0.7 36.1 9.5 30.4 15.7 C 24.6 22 17.7 25.8 10.8 27.3 C 3.9 28.8 -3 28 -10 26.1 C -16.9 24.1 -24 21 -29.9 15.1 C -35.8 9.3 -40.5 0.7 -38.3 -5.9 C -36.2 -12.5 -27.1 -16.9 -19.5 -21.7 C -12 -26.4 -6 -31.5 -0.5 -30.8 C 5 -30.2 9.9 -24 17.5 -19.2 Z" transform="matrix(1,0,0,1,50,50)" style="transition: all 0.3s ease 0s" stroke="url(#sw-gradient)"></path>',
        '<text font-size="12" x="25" y="50" fill="rgb(255, 255, 255)">',
            Strings.toString(_tokenId),
        '</text></svg>'
        );

        return string(
            abi.encodePacked(
                "data:image/svg+xml;base64,",
                Base64.encode(svg)
            )
        );
    }

    function mint() public {
        _tokenIds = _tokenIds + 1;

        _safeMint(msg.sender, _tokenIds);
        _setTokenURI(_tokenIds, getTokenURI(_tokenIds));
    }

}