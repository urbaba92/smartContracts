SODX-License-Identifier: MIT
// by urbaba92

pragma solidity ^0.8.0; import "@openzeppelin/contracts/utils/Strings.sol"; 
contract MyContract {
    using Strings for uint256; 
    // Attach the Strings 
    library to uint256 function 
    numberToString(uint256 
    value) public pure returns 
    (string memory) {
        // Using the toString() 
        // function from the 
        // Strings library on a 
        // uint256
        return 
        value.toString();
    }
    function 
    numberToHex(uint256 value) 
    public pure returns (string 
    memory) {
        // Using the 
        // toHexString() 
        // function from the 
        // Strings library on a 
        // uint256
        return 
        value.toHexString();
    }
}
