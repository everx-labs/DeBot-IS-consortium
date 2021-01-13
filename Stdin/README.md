# Stdin Interface

**Status**: Proposed

| Name      | ID                                                                |
| :-------- | :---------------------------------------------------------------- |
| Stdin     | 8796536366ee21852db56dccb60bc564598b618c865fc50c8b1ab740bba128e3  |


## Description

Allows to get input from user for basic types like integers, addresses, public keys, strings, cells.

## Functions

`getStr` - prints prompt message to the user and returns string entered by user

arguments: 

	answerId: uint32 - function id of result callback
	
	prompt: bytes - string printed to the user and describing what to enter

returns: 

	value: bytes - string entered by user

`getInt` - prints prompt message to the user and returns singed integer entered by user

arguments: 

	answerId: uint32 - function id of result callback
	
	prompt: bytes - string printed to the user and describing what to enter

returns: 

	value: int256 - integer entered by user

`getUint` - prints prompt message to the user and returns unsinged integer entered by user

arguments: 

	answerId: uint32 - function id of result callback
	
	prompt: bytes - string printed to the user and describing what to enter

returns: 

	value: uint256 - integer entered by user

`getAddr` - prints prompt message to the user and returns address entered by user

arguments: 

	answerId: uint32 - function id of result callback
	
	prompt: bytes - string printed to the user and describing what to enter

returns: 

	value: uint256 - signed integer entered by user

`getCell` - prints prompt message to the user and returns TON address entered by user

arguments: 

	answerId: uint32 - function id of result callback
	
	prompt: bytes - string printed to the user and describing what to enter

returns: 

	value: cell - root cell of tree of cells

## Declaration in Solidity

```jsx
interface IStdin {

	function getStr(uint32 answerId, string prompt) external returns (string value);
	function getInt (uint32 answerId, string prompt) external returns (int256 value);
	function getUint(uint32 answerId, string prompt) external returns (uint256 value);
	function getAddr(uint32 answerId, string prompt) external returns (address value);
	function getCell(uint32 answerId, string prompt) external returns (TvmCell value);
	function getTons(uint32 answerId, string prompt) external returns (uint128 value);

}
```

## Declaration in C++

```cpp
namespace tvm { namespace schema {

__interface IStdin {

	[[internal, answer_id]]
	string getStr(string prompt);
	[[internal, answer_id]]
	uint256 getInt(string prompt);
	[[internal, answer_id]]
	int256 getUint(string prompt);
	[[internal, answer_id]]
	address getAddr(string prompt);
	[[internal, answer_id]]
	cell getCell(string prompt);
	[[internal, answer_id]]
	uint128 getTons(string prompt);

}
};
```

## Code Example

### Solidity

Example.sol

### C++

TODO: add later