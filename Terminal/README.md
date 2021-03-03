# Terminal Interface

**Status**: Accepted

| Name      | ID                                                                |
| :-------- | :---------------------------------------------------------------- |
| Terminal  | 8796536366ee21852db56dccb60bc564598b618c865fc50c8b1ab740bba128e3  |


## Description

Simple input/output. Allows to print string messages to the user and get input string from the user.

## Functions

Since DeBot is a smart contract then all functions work asyncronously by design. It means that they don't return anything despite the fact that all have `returns` value in their specification. Result callback will be called later and it must have arguments defined in `returns` section.

`input` - prints prompt message to the user and returns string entered by user

arguments:

	answerId: uint32 - function id of result callback

	prompt: bytes - string printed to the user and describing what to enter

	multiline: bool - allow multiline text input
returns:

	value: bytes - utf8 string entered by user.

`print` - shows string message to the user

arguments:

    answerId: uint32 - function id of callback, can be 0.

    message: bytes - utf8 string as byte array

returns:

	void

`printf` - shows formatted string message to the user

arguments:

    answerId: uint32 - function id of callback, can be 0.

	fmt: bytes - utf8 string as byte array that must be printed to the user

	fargs: cell - cell with serialized format arguments that must be inserted into `format` string replacing format specifiers (subsequences between `{}` brackets).

	Format specifier is one of ABI type like `{int32}`, `{address}`, `{cell}`, `{uint256[]}` and so on or one of the following types:
		- `{utime}` - prints unixtime in UTC date time format. Format argument is an `uint32` integer.
		- `{ton}` - prints number of tons in `decimal.float` format with 9 digits after `.`.

returns:

	void

## Declaration in Solidity

```jsx
interface ITerminal {

	function input(uint32 answerId, string prompt, bool multiline) external returns (string value);
	function print(uint32 answerId, string message) external;
	function printf(uint32 answerId, string fmt, TvmCell fargs) external;
}
```

## Declaration in C++

```cpp
namespace tvm { namespace schema {

__interface ITerminal {
	[[internal, answer_id]]
	string input(string prompt, bool multiline);
	[[internal, answer_id]]
	bool_t print(string message);
	[[internal, answer_id]]
	bool_t printf(string fmt, cell fargs);
}

};
```

## Code Example

### Solidity

Example.sol

### C++

TODO: add later
