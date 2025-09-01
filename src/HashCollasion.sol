// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HashCollisionExample {
    function permit(
        string memory permit_type_hash,
        address _owner,
        address _spender,
        string memory value, //normally uint, but we use string for demonstration purposes
        string memory nonce, //normally uint, but we use string for demonstration purposes
        string memory deadline //normally uint, but we use string for demonstration purposes
    ) public pure returns (bytes memory) {
        bytes memory data = abi.encodePacked(permit_type_hash, _owner, _spender, value, nonce, deadline);
        return data;
    }
}
