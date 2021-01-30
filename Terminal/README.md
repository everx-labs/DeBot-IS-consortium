# Terminal Interface

**Status**: Proposed

| Name      | ID                                                                |
| :-------- | :---------------------------------------------------------------- |
| Terminal  | 8796536366ee21852db56dccb60bc564598b618c865fc50c8b1ab740bba128e3  |


## Description

Simple input/output. Allows to print string messages to the user and get input from the user for simple types like integers, strings, booleans.

## Functions

Since DeBot is a smart contract then all functions work asyncronously by design. It means that they don't return anything despite the fact that all have `returns` value in their specification. Result callback will be called later and it must have arguments defined in `returns` section.

`inputStr` - prints prompt message to the user and returns string entered by user

arguments: 

	answerId: uint32 - function id of result callback
	
	prompt: bytes - string printed to the user and describing what to enter

returns: 

	value: bytes - utf8 string entered by user.

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

`inputBoolean` - prints prompt message to the user and returns true or false choise (yes or no)

arguments: 

	answerId: uint32 - function id of result callback
	
	prompt: bytes - string printed to the user and describing what to enter

returns: 

	value: bool - user choice converted to true or false

`inputTons` - prints prompt message to the user and returns number of nanotons entered by user.

arguments: 

	answerId: uint32 - function id of result callback
	
	prompt: bytes - string printed to the user and describing what to enter

returns: 

	value: uint128 - number of nanotons.

`print` - shows string message to the user

arguments: 

	message: bytes - utf8 string as byte array

returns: 

	void

`printf` - shows formatted string message to the user

arguments: 

	fmt: bytes - utf8 string as byte array that must be printed to the user

	fargs: cell - cell with serialized format arguments that must be inserted into `format` string replacing format specifiers (subsequences between `{}` brackets).

	Format specifier is one of ABI type like `{int32}`, `{address}`, `{cell}`, `{uint256[]}` and so on or one of the following types:
		- `{utime}` - prints unixtime in UTC date time format. Format argument is an `uint32` integer.
		- `{value}` - prints number of tons in `decimal.float` format with 9 digits after `.`.

returns: 

	void

## Declaration in Solidity

```jsx
interface ITerminal {

	function inputStr(uint32 answerId, string prompt) external returns (string value);
	function inputInt (uint32 answerId, string prompt) external returns (int256 value);
	function inputUint(uint32 answerId, string prompt) external returns (uint256 value);
	function inputTons(uint32 answerId, string prompt) external returns (uint128 value);
	function inputBoolean(uint32 answerId, string prompt) external returns (bool value);
	function print(string message) external;
	function printf(string format, Tvmcell fargs) external;
}
```

## Declaration in C++

```cpp
namespace tvm { namespace schema {

__interface ITerminal {

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
	[[internal]]
	void print(string message);
	[[internal]]
	void printf(string fmt, cell fargs);
}
};
```

## Code Example

### Solidity

Example.sol

### C++

TODO: add later