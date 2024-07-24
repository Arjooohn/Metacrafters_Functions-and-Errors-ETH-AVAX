// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract MathOperations {
    // Addition
    function calculateSum(uint256 num1, uint256 num2) public pure returns (uint256) {
        uint256 result = num1 + num2;
        // Check for overflow
        assert(result >= num1);
        return result;
    }

    // Subtraction
    function calculateDifference(uint256 minuend, uint256 subtrahend) public pure returns (uint256) {
        // Ensure no underflow
        if (subtrahend > minuend) {
            revert("Subtraction underflow: the subtrahend is greater than the minuend.");
        }
        uint256 result = minuend - subtrahend;
        return result;
    }

    // Multiplication
    function calculateProduct(uint256 factor1, uint256 factor2) public pure returns (uint256) {
        if (factor1 == 0 || factor2 == 0) {
            return 0;
        }
        uint256 result = factor1 * factor2;
        // Check for overflow
        assert(result / factor1 == factor2);
        return result;
    }

    // Division
    function calculateQuotient(uint256 dividend, uint256 divisor) public pure returns (uint256) {
        // Ensure no division by zero
        require(divisor != 0, "Division by zero is not allowed.");
        uint256 result = dividend / divisor;
        return result;
    }
    
    // Modulus
    function calculateRemainder(uint256 dividend, uint256 divisor) public pure returns (uint256) {
        // Ensure no division by zero
        require(divisor != 0, "Division by zero is not allowed.");
        return dividend % divisor;
    }
}
