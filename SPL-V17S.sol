// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProtectedSelfDestructExample {
    address public owner;
    bool public isDestroyed;

    constructor() {
        owner = msg.sender;
        isDestroyed = false;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function destroyContract() public onlyOwner {
        require(!isDestroyed, "Contract has already been destroyed");
        isDestroyed = true;
        selfdestruct(payable(owner));
    }
}
