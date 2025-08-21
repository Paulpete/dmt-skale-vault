// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @title Dream Meme Token (DMT)
 * @notice Fixed 5,000,000,000 supply, minted directly to the Vault at deploy.
 */
contract DMT is ERC20 {
    constructor(address recipient) ERC20("Dream Meme Token", "DMT") {
        require(recipient != address(0), "Recipient is zero");
        uint256 supply = 5_000_000_000 * 10 ** decimals();
        _mint(recipient, supply);
    }
}
