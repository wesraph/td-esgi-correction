// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract NameQ1 {
    string public storedName;

    function setName(string memory _value) public {
        storedName = _value;
    }
}

contract NameQ2 {
    string public storedName;
    address public lastCaller;

    function setName(string memory _value) public {
        storedName = _value;
        lastCaller = msg.sender;
    }
}

contract NameQ3 {
    string public storedName;
    address public lastCaller;
    mapping(address => uint256) public callsCounter;

    function setName(string memory _value) public {
        storedName = _value;
        lastCaller = msg.sender;
        callsCounter[msg.sender]++;
    }
}

contract NameQ4 {
    string public storedName;
    address public lastCaller;
    mapping(address => uint256) public callsCounter;
    mapping(string => uint256) public mappingWithString;

    function setName(string memory _value) public {
        storedName = _value;
        lastCaller = msg.sender;
        callsCounter[msg.sender]++;
    }

    function writeIntoTheStringMapping(string memory key, uint256 value) public {
        mappingWithString[key] = value;
    }
}

contract NameQ5 {
    string public storedName;
    address public lastCaller;
    mapping(address => uint256) public callsCounter;
    mapping(string => uint256) public mappingWithString;
    address public admin;

    constructor() {
        admin = msg.sender;
    }

    function setName(string memory _value) public {
        storedName = _value;
        lastCaller = msg.sender;
        callsCounter[msg.sender]++;
    }

    function writeIntoTheStringMapping(string memory key, uint256 value) public {
        mappingWithString[key] = value;
    }

    function setNameOnlyOwner(string memory _value) public {
        require(admin == msg.sender, "only admin");
        storedName = _value;
        lastCaller = msg.sender;
        callsCounter[msg.sender]++;
    }
}

contract NameQ6 {
    string public storedName;
    address public lastCaller;
    mapping(address => uint256) public callsCounter;
    mapping(string => uint256) public mappingWithString;
    address public admin;

    constructor() {
        admin = msg.sender;
    }

    function setName(string memory _value) public {
        storedName = _value;
        lastCaller = msg.sender;
        callsCounter[msg.sender]++;
    }

    function writeIntoTheStringMapping(string memory key, uint256 value) public {
        mappingWithString[key] = value;
    }

    modifier onlyAdmin() {
        require(admin == msg.sender, "only admin");
        _;
    }

    function setNameOnlyOwner(string memory _value) public onlyAdmin {
        storedName = _value;
        lastCaller = msg.sender;
        callsCounter[msg.sender]++;
    }
}

contract NameQ7 {
    string public storedName;
    address public lastCaller;
    mapping(address => uint256) public callsCounter;
    mapping(string => uint256) public mappingWithString;
    address public admin;

    constructor() {
        admin = msg.sender;
    }

    function setName(string memory _value) public {
        storedName = _value;
        lastCaller = msg.sender;
        callsCounter[msg.sender]++;
    }

    function writeIntoTheStringMapping(string memory key, uint256 value) public {
        mappingWithString[key] = value;
    }

    modifier onlyAdmin() {
        require(admin == msg.sender, "only admin");
        _;
    }

    function setNameOnlyOwner(string memory _value) public onlyAdmin {
        storedName = _value;
        lastCaller = msg.sender;
        callsCounter[msg.sender]++;
    }

    function getNumberOfCallsTimesTwo() public returns (uint256 ret) {
        ret = callsCounter[msg.sender] * 2;
    }
}

contract NameQ8 {
    string public storedName;
    address public lastCaller;
    mapping(address => uint256) public callsCounter;
    mapping(string => uint256) public mappingWithString;
    address public admin;

    event NameUpdated(address indexed updater, string newValue, uint256 updateCount);

    constructor() {
        admin = msg.sender;
    }

    function setName(string memory _value) public {
        storedName = _value;
        lastCaller = msg.sender;
        callsCounter[msg.sender]++;
        emit NameUpdated(msg.sender, _value, callsCounter[msg.sender]);
    }

    function writeIntoTheStringMapping(string memory key, uint256 value) public {
        mappingWithString[key] = value;
    }

    modifier onlyAdmin() {
        require(admin == msg.sender, "only admin");
        _;
    }

    function setNameOnlyOwner(string memory _value) public onlyAdmin {
        storedName = _value;
        lastCaller = msg.sender;
        callsCounter[msg.sender]++;
    }

    function getNumberOfCallsTimesTwo() public returns (uint256 ret) {
        ret = callsCounter[msg.sender] * 2;
    }
}
