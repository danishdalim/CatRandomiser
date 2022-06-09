pragma solidity ^0.6.0;

contract CatRandomizer{ //create contract

    event NewCat(uint CatId, string name, uint color);  //create event

    uint colorDigits = 16;      //number of color is determined by 16 digits
    uint colorModulus = 10 ** colorDigits;      //To make sure our car's color is only 16 characters, let's make another uint equal to 10^16. That way we can later use the modulus operator % to shorten an integer to 16 digits

    struct Cat {    //structure included in contract
        string name;
        uint color;
    } 

    Cat[] public cats;  //array to store cat information

    mapping (uint => address) public catToOwner;    //mapping
    

    function _createCat(string memory _name, uint _color) private {  //create cat function
        cats.push(Cat(_name, _color));   //push cat to array
    }

    function _generateRandomColor(string memory _str) private view returns(uint) {  //randomise cat
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % colorModulus;
    }

    function createRandomCat(string memory _name) public {
        uint randColor = _generateRandomColor(_name);
        _createCat(_name, randColor);
    }

}