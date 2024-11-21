// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @title TradeToken
 */

contract TradeToken is ERC20 {
    string public description = "Token For Any Products";
    uint8 public decimals = 2;
    uint256 public INITIAL_SUPPLY = 10000000;

    address public seller;
    uint256 public priceInTokens;
    // bool public isSold;
    mapping(address => bool) public isSold;
    event TradeConfirmed(address indexed buyer);

    string public name = "TadeToken";
    string public symbol = "TRDT";

    // uint256 public _priceInTokens = 25;

    constructor() public {
        _mint(msg.sender, INITIAL_SUPPLY);
        seller = msg.sender;
        priceInTokens = 20;
    }

    function confirmTrade() external {
        require(isSold[msg.sender] == false, "Item has already been sold");
        require(seller != msg.sender, "You cannot buy your own item");
        require(balanceOf(msg.sender) >= priceInTokens, "Insufficient tokens");
        _transfer(seller,msg.sender, priceInTokens);
        isSold[msg.sender] = true;
        emit TradeConfirmed(msg.sender);
    }
}
