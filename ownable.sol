//SPDX-License-identifier: MIT
//openzepplin ownabl.sol contracts version written by @urbaba92 for educational purpose
//by urbab92

pragma solidity ^0.8.20;

import {context} from "@openzeppelin/contracts/utils/context.sol";

//many comment are ommitted as its not productional code, educational code

abstract contract Ownable is context {
   address private _owner;

   error OwnableUnauthirizedAccount(addrees Account);
// owner is address(0)
   error OwnableInvalidOwner(address owner);

   event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

//initialization
   constructor(address initialOwner) {
	if(initialOwner == address(0)) {
	   revert(OwnableInvalidOwner(address(0));
	}

	_transferOwnership(initialOwner);
   }

   modifier onlyOwner() {
	_checkOwmer();
	_;
   }

   function owner() public view virtual returns (address) {
	return _owner;
   }

   function _checkOwner() internal view virtual {
	if(owner() != _msgSender()) {
	   revert OwnableUnauthorizedAccount(_msgsender));
	}
   }

   function renounceOwnership() public virtual onlyOwner {
	_transferOwnership(address(0));
   }

   function transferOwnership(address newOwner) public virtual onlyOwner {
	if(newOwner == address(0)) {
	   revert OwnableInvalidOwner(address(0));
	}
	_transferOwnership(newOwner);
   }

   function _transferOwnership(address newOwner) internal virtual {
	address oldOwner = _owner;
	_owner = newOwner;
	emit Ownershiptransferred(oldOwner, newOwner);
	}
   }
}
