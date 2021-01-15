# Stdin Interface

**Status**: Proposed

| Name      | ID                                                                |
| :-------- | :---------------------------------------------------------------- |
| Stdin     | 8796536366ee21852db56dccb60bc564598b618c865fc50c8b1ab740bba128e3  |


## Description

Allows to get input from user for basic types like integers, addresses, public keys, strings, cells.

## Functions

Since DeBot is a smart contract then all functions work asyncronously by design. It means that they don't return anything despite the fact that all have `returns` value in their specification. Result callback will be called later and it must have arguments defined in `returns` section.

`inputStr` - prints prompt message to the user and returns string entered by user

arguments: 

	answerId: uint32 - function id of result callback
	
	prompt: bytes - string printed to the user and describing what to enter

returns: 

	value: bytes - string entered by user.

`inputInt` - prints prompt message to the user and returns singed integer entered by user

arguments: 

	answerId: uint32 - function id of result callback
	
	prompt: bytes - string printed to the user and describing what to enter

returns: 

	value: int256 - integer entered by user

`inputUint` - prints prompt message to the user and returns unsinged integer entered by user

arguments: 

	answerId: uint32 - function id of result callback
	
	prompt: bytes - string printed to the user and describing what to enter

returns: 

	value: uint256 - integer entered by user

`inputAddr` - prints prompt message to the user and returns address entered by user

arguments: 

	answerId: uint32 - function id of result callback
	
	prompt: bytes - string printed to the user and describing what to enter

returns: 

	value: uint256 - signed integer entered by user

`inputCell` - prints prompt message to the user and returns root cell of tree of cells.
Remark: user can type cell data in serialized form encoded in base64 format.

arguments: 

	answerId: uint32 - function id of result callback
	
	prompt: bytes - string printed to the user and describing what to enter

returns: 

	value: cell - root cell of tree of cells

`inputBoolean` - prints prompt message to the user and returns true or false choise (yes or no)

arguments: 

	answerId: uint32 - function id of result callback
	
	prompt: bytes - string printed to the user and describing what to enter

returns: 

	value: bool - user choice converted to true or false

## Declaration in Solidity

```jsx
interface IStdin {

	function inputStr(uint32 answerId, string prompt) external returns (string value);
	function inputInt (uint32 answerId, string prompt) external returns (int256 value);
	function inputUint(uint32 answerId, string prompt) external returns (uint256 value);
	function inputAddr(uint32 answerId, string prompt) external returns (address value);
	function inputCell(uint32 answerId, string prompt) external returns (TvmCell value);
	function inputTons(uint32 answerId, string prompt) external returns (uint128 value);
	function inputBoolean(uint32 answerId, string prompt) external returns (bool value);

}
```

## Declaration in C++

```cpp
namespace tvm { namespace schema {

__interface IStdin {

	[[internal, answer_id]]
	string inputStr(string prompt);
	[[internal, answer_id]]
	uint256 inputInt(string prompt);
	[[internal, answer_id]]
	int256 inputUint(string prompt);
	[[internal, answer_id]]
	address inputAddr(string prompt);
	[[internal, answer_id]]
	cell inputCell(string prompt);
	[[internal, answer_id]]
	uint128 inputTons(string prompt);
	[[internal, answer_id]]
	bool inputBoolean(string prompt);

}
};
```

## Code Example

### Solidity

Example.sol

### C++

TODO: add later