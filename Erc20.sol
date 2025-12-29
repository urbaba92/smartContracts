//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20

contract myErc20 {

   string public name = "DreamO";
   string public symbol = "DRM";
   uint8 public decimal = 18;

   uint256 public totalSupply;

   mapping(address => uint256) public balanceOf;
   mapping(addresa => mapping(address => uint256)) public allowance;

   event Transfer(address indexed from, address indexed to, uint256 amount);
   event approval(address indexed owner, address indexed spender, uint256 amount);

   constructor(uint256 _initialsupply) {
	totalSupply = _initialsupply;
	balanceOf[msg.sender] = totalSupply;
	emit transfer(address(0), msg.sender, _initialsupply);
   }

   function transfer(address to, uint256 amount) external returns (bool){
	require(balanceOf[msg.sender] >= amount, "insufficient balance");

	balanceOf[msg.sender] -= amount;
	balanceOf[to] += amount;

	emit transfer(msg.sender, to, amount);
	return true;
   }
   function approve(address spender, uint256 amount)external returns (bool) {
	allowance[msg.sender][spender] = amount;

	emit approval(msg.sender, spender, amount);
	return true;
   }

   function transferFrom(address from, address to, uint256 amount) external returns (bool) {
	uint256 allowed = allowance[from][msg.sender];
	require(allowed >= amount, "Allowance exceed");
	require(balnceOf[from] >= amount, "balance too low");

	allowance[from][msg.sender] = allowed - amount;
	balanceOf[from] -= amount;
	balanceOf[to] += amount;

	emit transfer(from, to, amount);
	return true;
   }
}	 
