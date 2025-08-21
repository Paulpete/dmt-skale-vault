// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol"; 
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title DmtVault (Ownerless-ops ready)
 * @notice Minimal vault that receives full DMT supply on day 1.
 *         You can extend with bots, burns, reinvest, etc.
 */
contract DmtVault is Ownable {
    IERC20 public token;
    bool public tokenBound;

    event TokenBound(address token);
    event Rescue(address token, address to, uint256 amount);

    constructor(address _owner) Ownable(_owner) {}

    function bindToken(address _token) external onlyOwner {
        require(!tokenBound, "Already bound");
        require(_token != address(0), "Zero token");
        token = IERC20(_token);
        tokenBound = true;
        emit TokenBound(_token);
    }

    // Simple rescue in case tokens get stuck; extend with distribution logic later
    function rescue(address erc20, address to, uint256 amount) external onlyOwner {
        require(to != address(0), "Zero to");
        IERC20(erc20).transfer(to, amount);
        emit Rescue(erc20, to, amount);
    }
}
