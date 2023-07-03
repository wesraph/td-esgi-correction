// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);
    }

    function testIncrement() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }

    function testSetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }

    function testDecrement() public {
        counter.increment();
        counter.decrement();
        assertEq(counter.number(), 0);
    }

    // Ce test ne va pas fonctionner car la valeur initiale du "number" est 0
    // et "decrement()" lui soustrait 1. Comme "number" ne peut que prendre des
    // valeurs positives, cela va provoquer un "underflow" et passer à la
    // valeur maximal de number (2^256)-1. Les versions récentes de solidity
    // vérifient automatiquement que cela ne soit pas possible mais durant les
    // premières années de la création du langage cette faille n'était pas fixée
    // et a été résponsable de nombreux hacks
    function testDecrementWithoutIncrement() public {
        counter.decrement();
        assertEq(counter.number(), 0);
    }

    // La différence est que dans ce test nous affichons la valeur de "number".
    // Il ne faut pas oublier de mettre "-vvv" à la fin de la commande forge
    function testPrintValue() public {
        counter.increment();
        console.log("The value is:", counter.number());
    }
}
