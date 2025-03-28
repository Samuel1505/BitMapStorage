// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/BitmapStorage.sol";

contract BitmapStorageTest is Test {
    BitmapStorage bitmap;

    function setUp() public {
        bitmap = new BitmapStorage();
    }

    function testStoreAndRetrieve() public {
        // Store some values
        bitmap.storeDataInSlot(42, 0);
        bitmap.storeDataInSlot(255, 1);
        bitmap.storeDataInSlot(123, 31);

        // Check individual slots
        assertEq(bitmap.getValueInSlot(0), 42);
        assertEq(bitmap.getValueInSlot(1), 255);
        assertEq(bitmap.getValueInSlot(31), 123);

        // Check all values
        uint8[32] memory values = bitmap.getAllValues();
        assertEq(values[0], 42);
        assertEq(values[1], 255);
        assertEq(values[31], 123);
    }

    function testInvalidSlot() public {
        vm.expectRevert("Slot must be between 0 and 31");
        bitmap.storeDataInSlot(1, 32);
    }
}