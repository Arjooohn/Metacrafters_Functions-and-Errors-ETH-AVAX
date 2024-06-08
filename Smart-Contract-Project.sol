// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract SimpleContract {
    // Function using require() to ensure input is within a range
    function requireCheck(uint x) public pure {
        require(x > 0 && x < 100, "Input must be between 1 and 99.");
    }

    // Function using assert() to verify an internal condition
    function assertCheck(uint y) public pure {
        uint result = y * 2;
        assert(result > y); // This should always be true for non-zero y
    }

    // Function using revert() to explicitly handle an error case
    function revertCheck(uint z) public pure {
        if (z == 0) {
            revert("Input must be non-zero.");
        }
    }
}
