// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Calculator {
    // Addition
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        uint256 sum = a + b;
        // Check for overflow
        assert(sum >= a);
        return sum;
    }

    // Subtraction
    function subtract(uint256 a, uint256 b) public pure returns (uint256) {
        // Ensure no underflow
        if (b > a) {
            revert("Subtraction underflow: second number is greater than the first number.");
        }
        uint256 difference = a - b;
        return difference;
    }

    // Multiplication
    function multiply(uint256 a, uint256 b) public pure returns (uint256) {
        if (a == 0 || b == 0) {
            return 0;
        }
        uint256 product = a * b;
        // Check for overflow
        assert(product / a == b);
        return product;
    }

    // Division
    function divide(uint256 a, uint256 b) public pure returns (uint256) {
        // Ensure no division by zero
        require(b != 0, "Division by zero is not allowed.");
        uint256 quotient = a / b;
        return quotient;
    }
    
    // Modulus
    function mod(uint256 a, uint256 b) public pure returns (uint256) {
        // Ensure no division by zero
        require(b != 0, "Division by zero is not allowed.");
        return a % b;
    }
}
