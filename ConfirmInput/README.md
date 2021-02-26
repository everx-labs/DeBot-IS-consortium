
# ConfirmInput Interface

**Status**: Accepted

| Name         | ID                                                                |
| :----------- | :---------------------------------------------------------------- |
| ConfirmInput | 16653eaf34c921467120f2685d425ff963db5cbb5aa676a62a2e33bfc3f6828a  |


## Description

Interface for confirm input.

## Functions

`get` - prints prompt message to the user and returns true or false choice

arguments:

	answerId: uint32 - id of function callback.
	prompt: bytes - utf-8 string to print to the user before input.

returns:

	{ value: bool }

## Declaration in Solidity

interface IConfirmInput {

	function get(uint32 answerId, string prompt) external returns (bool value);

}

## Declaration in C++

namespace tvm { namespace schema {

__interface IConfirmInput {
	[[internal, answer_id]]
	bool_t get(string prompt);
}

}};

## Code Example

### Solidity

Example.sol

### C++

TODO: Add example
