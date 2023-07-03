// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Name.sol";

contract NameTest is Test {
    NameQ1 public nameQ1;
    NameQ2 public nameQ2;
    NameQ3 public nameQ3;
    NameQ4 public nameQ4;
    NameQ5 public nameQ5;
    NameQ6 public nameQ6;
    NameQ7 public nameQ7;
    NameQ8 public nameQ8;

    function setUp() public {
        nameQ1 = new NameQ1();
        nameQ2 = new NameQ2();
        nameQ3 = new NameQ3();
        nameQ4 = new NameQ4();
        nameQ5 = new NameQ5();
        nameQ6 = new NameQ6();
        nameQ7 = new NameQ7();
        nameQ8 = new NameQ8();
    }

    function testSetNameQ1() public {
        nameQ1.setName("bob");
        assertEq(nameQ1.storedName(), "bob");
    }

    function testSetNameQ2() public {
        nameQ2.setName("bob");
        assertEq(nameQ2.storedName(), "bob");
        assertEq(nameQ2.lastCaller(), address(this));
    }

    function testCallsCounter() public {
        nameQ3.setName("alice");
        nameQ3.setName("bob");
        nameQ3.setName("alex");
        assertEq(nameQ3.storedName(), "alex");
        assertEq(nameQ3.lastCaller(), address(this));
        assertEq(nameQ3.callsCounter(address(this)), 3);
    }

    function testWritingIntoTheTestMapping() public {
        // Write into the test mapping a value
        nameQ4.writeIntoTheStringMapping("bob", 123);

        // Let's print the value associated with bob
        console.log("The value associated with bob is", nameQ4.mappingWithString("bob"));
    }

    function testOnlyOwner() public {
        nameQ5.setNameOnlyOwner("bob");

        // Change the caller address to the address
        // 0x0000000000000000000000000000000000000000
        vm.prank(address(0x0000000000000000000000000000000000000000));

        // Tell the VM that we are expecting the call to revert
        // with the error message "only admin"
        vm.expectRevert("only admin");
        nameQ5.setNameOnlyOwner("alice");
    }

    function testOnlyOwnerWithModifier() public {
        nameQ6.setNameOnlyOwner("bob");

        // Change the caller address to the address
        // 0x0000000000000000000000000000000000000000
        vm.prank(address(0x0000000000000000000000000000000000000000));

        // Tell the VM that we are expecting the call to revert
        // with the error message "only admin"
        vm.expectRevert("only admin");
        nameQ6.setNameOnlyOwner("alice");
    }

    function testGetCounterTimesTwo() public {
        nameQ7.setNameOnlyOwner("bob");
        nameQ7.setNameOnlyOwner("alice");
        assertEq(
            nameQ7.getNumberOfCallsTimesTwo(),
            nameQ7.callsCounter(address(this)) * 2,
            "returned value must be 2*callsCounter"
        );
    }

    event NameUpdated(address indexed updater, string newValue, uint256 updateCount);

    function testEvent() public {
        vm.expectEmit(true, true, true, true);
        emit NameUpdated(address(this), "bob", 1);
        nameQ8.setName("bob");
    }
}
