// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GasCostlyPatternsExample {
    uint256[] public data;

    // Corrected: Storing data in a dynamic array
    function storeData(uint256 _value) public {
        data.push(_value);
    }

    // Corrected: Using a fixed-size loop to limit gas consumption
    function gasConsumingLoop(uint256 iterations) public pure {
        require(iterations <= 100, "Iterations limit exceeded"); // Set a reasonable limit
        for (uint256 i = 0; i < iterations; i++) {
            // Gas consumption is now limited with a reasonable iteration count
        }
    }

    // Corrected: Reading storage data outside of a loop to reduce gas
    function readData(uint256 index) public view returns (uint256) {
        require(index < data.length, "Index out of bounds");
        return data[index];
    }

    // Corrected: Using proper recursion with a base case to prevent stack exhaustion
    function recursiveFunction(uint256 n) public pure {
        recursiveHelper(n);
    }

    function recursiveHelper(uint256 n) private pure {
        if (n > 0) {
            recursiveHelper(n - 1);
        }
    }
}
