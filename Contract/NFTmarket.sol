// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity ^0.8.3;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";


contract NFTMarket is ReentrancyGuard {
    using Counters for Counters.Counter;
    Counters.Counter private _itemIds;
    Counters.Counter private _itemsSold;

    address payable owner;
    uint256 listingPrice = 0.025 ether;

    constructor() {
        owner = payable(msg.sender);
    }

    /*  
    Definitions MarketItem
    @param: itemId 
    @param: ntfContract NFT ERC721 URI Storage deployed on ERC721URIStorage
    @param: seller  Address of Seller
    @param: owner Address of Owner
    @param: price Price of the item
    @param: sold  Sold or not, boolean
    */
    struct MarketItem {
        uint itemId;
        address nftContract;
        uint256 tokenId;
        address payable seller;
        address payable owner;
        uint256 price;
        bool sold;
    }

    mapping(uint256 => MarketItem) private idToMarketItem;
    
     /* Listing NFT to the Marketplace */
    function createMarketItem(
        address nftContract,
        uint256 tokenId,
        uint256 price
    ) public payable nonReentrant {  
    
    	  
    	 /* Check if listingPrice is provided, this revenue will go to Marketplace Owner*/
        require(price > 0, "Price must be at least 1 wei");
        require(msg.value == listingPrice, "Price must be equal to listing price");

	  	/* create new itermId，tokenId */
        _itemIds.increment();
        uint256 itemId = _itemIds.current();


	 	/* fill in MarkItem information, and set the NFT URI, seller address, price */
        idToMarketItem[itemId] =  MarketItem(
        itemId,
        nftContract,
        tokenId,
        payable(msg.sender),
    payable(address(0)),
        price,
        false
        );

		/* change the NFT ownership from owner to MarketAddress */
        IERC721(nftContract).transferFrom(msg.sender, address(this), tokenId);

        emit MarketItemCreated(
            itemId,
            nftContract,
            tokenId,
            msg.sender,
            address(0),
            price,
            false
        );
    }


	/* sellContract　createMarketSale */
    function createMarketSale(
        address nftContract,
        uint256 itemId
    ) public payable nonReentrant {
     	/* check if buyer has provided paied enough balance */
        uint price = idToMarketItem[itemId].price;
        uint tokenId = idToMarketItem[itemId].tokenId;
        require(msg.value == price, "Please submit the asking price in order to complete the purchase");

		/* Transfer sold value to seller */
        idToMarketItem[itemId].seller.transfer(msg.value);
        
       	/* Transfer token to new owner *.
        IERC721(nftContract).transferFrom(address(this), msg.sender, tokenId);
        idToMarketItem[itemId].owner = payable(msg.sender);
        idToMarketItem[itemId].sold = true;
        _itemsSold.increment();
        
        /* Transfer Listing Fee to MarketPlace Owner */
        payable(owner).transfer(listingPrice);
    }