// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;
// @title GarageManager
// @author zkb1t
contract GarageManager {
    // Car struct definition
    struct Car {
        string make;
        string model;
        string color;
        uint numberOfDoors;
    }

    // mapping to store a list of cars, indexed by address
    mapping(address => Car[]) public garage;

    // function to add a car to the user's collection in the garage
    function addCar(string memory _make, string memory _model, string memory _color, uint _numberOfDoors) public {
        Car memory newCar = Car({
            make: _make,
            model: _model,
            color: _color,
            numberOfDoors: _numberOfDoors
        });
        garage[msg.sender].push(newCar);
    }

    // function to return all cars owned by the calling user
    function getMyCars() public view returns (Car[] memory) {
        return garage[msg.sender];
    }

    // function to return all cars owned by a specific user
    function getUserCars(address user) public view returns (Car[] memory) {
        return garage[user];
    }

    // function to update a car of the calling user
    function updateCar(uint index, string memory _make, string memory _model, string memory _color, uint _numberOfDoors) public {
        if (index >= garage[msg.sender].length) {
            revert("BadCarIndex");
        }

        garage[msg.sender][index] = Car({
            make: _make,
            model: _model,
            color: _color,
            numberOfDoors: _numberOfDoors
        });
    }

    // function to delete the entry in garage for the sender
    function resetMyGarage() public {
        delete garage[msg.sender];
    }
}