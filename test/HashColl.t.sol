// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/HashCollasion.sol";

contract HashCollisionExampleTest is Test {
    HashCollisionExample public hashCollision;

    function setUp() public {
        hashCollision = new HashCollisionExample();
    }

    function testPermit() public {
        string memory permit_type_hash = "someString";
        address _owner = 0x1234567890123456789012345678901234567890;
        address _spender = 0x1234567890123456789012345678901234567891;
        string memory value = "10000";
        string memory nonce = "0";
        string memory deadline = "1500";
        bytes memory encodedPacked = hashCollision.permit(
            permit_type_hash,
            _owner,
            _spender,
            value,
            nonce,
            deadline
        );
        bytes32 hashPacked = keccak256(encodedPacked);
        emit log_bytes32(hashPacked);
    }

    function testMaliciousPermit() public {
        string memory permit_type_hash = "someString";
        address _owner = 0x1234567890123456789012345678901234567890;
        address _spender = 0x1234567890123456789012345678901234567891;
        string memory value = "100000"; // Adding one extra zero
        string memory nonce = "1"; // Incremented nonce
        string memory deadline = "500"; // Reduced deadline
        bytes memory encodedPacked = hashCollision.permit(
            permit_type_hash,
            _owner,
            _spender,
            value,
            nonce,
            deadline
        );
        bytes32 hashPacked = keccak256(encodedPacked);
        emit log_bytes32(hashPacked);
    }
}
