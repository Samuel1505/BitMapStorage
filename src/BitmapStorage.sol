// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BitmapStorage {
    // Single uint256 to store 32 bytes (256 bits total)
    uint256 private data;

    // Function to store a byte in a specific slot (0 to 31)
    function storeDataInSlot(uint8 value, uint8 slot) external {
        require(slot < 32, "Slot must be between 0 and 31");
        require(value <= 255, "Value must fit in a byte (0-255)");

        // Clear the existing byte in the slot
        uint256 mask = ~(uint256(255) << (slot * 8));
        data = data & mask;

        // Set the new byte in the slot
        data = data | (uint256(value) << (slot * 8));
    }

    // Function to return all values in each slot as an array
    function getAllValues() external view returns (uint8[32] memory values) {
        for (uint8 i = 0; i < 32; i++) {
            values[i] = uint8((data >> (i * 8)) & 255);
        }
    }

    // Function to return the value in a specific slot
    function getValueInSlot(uint8 slot) external view returns (uint8) {
        require(slot < 32, "Slot must be between 0 and 31");
        return uint8((data >> (slot * 8)) & 255);
    }
}