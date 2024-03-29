// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;
// @title BasicMath
// @author zkb1t
contract BasicMath {
    function adder(uint _a, uint _b) public pure returns (uint, bool) {
        uint sum = _a + _b;
        // Check for overflow
        if (sum < _a || sum < _b) {
            return (0, true); // Overflow occurred
        } else {
            return (sum, false); // No overflow
        }
    }
    
    function subtractor(uint _a, uint _b) public pure returns (uint, bool) {
        // Check for underflow
        if (_b > _a) {
            return (0, true); // Underflow occurred
        } else {
            return (_a - _b, false); // No underflow
        }
    }
}