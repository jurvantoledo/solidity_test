// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract SimpleStorage {

    uint256 public favoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    // inside people we add the variables
    // People public person = People({favoriteNumber: 2, name: "Patrick"});

    // dynamic array
    People[] public people;

    // mapping
    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    // view, pure dont need to make transactions
    // view wants to read state of the blockchain.
    // public variables have veiw functions thats why public also is blue.
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }

    // memory means after execution delete variable.
    // storage stores variable
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        // to add people to array
        people.push(People(_favoriteNumber, _name));
        // [_name] = the key
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}