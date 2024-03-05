// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;
// @title ArraysExercise
// @author zkb1t
contract ArraysExercise {
    uint[] public numbers = [1,2,3,4,5,6,7,8,9,10];
    address[] public senders;
    uint[] public timestamps;

    // Return a Complete Array
    function getNumbers() public view returns (uint[] memory) {
        return numbers;
    }

    // Reset Numbers
    function resetNumbers() public {
        numbers = [1,2,3,4,5,6,7,8,9,10];
    }

    // Append to an Existing Array
    function appendToNumbers(uint[] calldata _toAppend) public {
        uint originalLength = numbers.length;
        uint toAppendLength = _toAppend.length;

        uint[] memory newNumbers = new uint[](originalLength + toAppendLength);

        for (uint i = 0; i < originalLength; i++) {
            newNumbers[i] = numbers[i];
        }

        for (uint j = 0; j < toAppendLength; j++) {
            newNumbers[originalLength + j] = _toAppend[j];
        }

        numbers = newNumbers;
    }

    // Timestamp Saving
    function saveTimestamp(uint _unixTimestamp) public {
        senders.push(msg.sender);
        timestamps.push(_unixTimestamp);
    }

    // Timestamp Filtering
    function afterY2K() public view returns (uint[] memory, address[] memory) {
        uint counter = 0;
        for (uint i = 0; i < timestamps.length; i++) {
            if (timestamps[i] > 946702800) {
                counter++;
            }
        }

        uint[] memory postY2KTimestamps = new uint[](counter);
        address[] memory postY2KSenders = new address[](counter);

        counter = 0;
        for (uint i = 0; i < timestamps.length; i++) {
            if (timestamps[i] > 946702800) {
                postY2KTimestamps[counter] = timestamps[i];
                postY2KSenders[counter] = senders[i];
                counter++;
            }
        }

        return (postY2KTimestamps, postY2KSenders);
    }

    // Resets
    function resetSenders() public {
        delete senders;
    }

    function resetTimestamps() public {
        delete timestamps;
    }
}