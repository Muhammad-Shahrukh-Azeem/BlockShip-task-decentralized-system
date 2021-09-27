// SPDX-License-Identifier: MIT
pragma solidity =0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract task4 is ERC721{
    
    struct TokenDetails{
        uint tokenId;
        address tokenOwner;
    }

    uint tokenPrice;
    uint256 public constant sha = 0;
    uint256 public constant rub = 1;
    
      constructor() ERC721("ShaToken", "Sha"){
          _safeMint(msg.sender, 55);
    }

    mapping(address => uint256) sellers;
    mapping(address => TokenDetails) orderBook;
    
    function sell(address _seller, uint256 _tokenId) public {
        _approve(_seller, _tokenId);
        sellers[_seller] = _tokenId;
    }
    
    function buy(address _buyer,address _seller , uint _buyerprice, uint256 _tokenId) public {
        require(tokenPrice == _buyerprice);
        _transfer(_seller, _buyer, _tokenId);
        delete orderBook[_seller] = _tokenId;
        orderBook[_buyer] = TokenDetails.tokenId ; 
        
    }

}