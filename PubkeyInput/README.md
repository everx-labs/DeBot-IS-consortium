
# PubkeyInput Interface

**Status**: Proposed

| Name        | ID                                                                |
| :---------- | :---------------------------------------------------------------- |
| PubkeyInput | d2245d17280e204409729e42a496afd6fc58bbf3a8f86b8550f0ee5cffc31114  |


## Description

Interface for public key input.

## Functions

`get` - prints prompt message to the user and returns public key entered by user.

arguments:

	answerId: uint32 - id of function callback.
	prompt: bytes - utf-8 string to print to the user before input.

returns:

	{ value: uint256 } - public key entered by user.

## Declaration in Solidity

interface IPubkeyInput {

	function get(uint32 answerId, string prompt) external returns (uint256 value);

}

## Declaration in C++

namespace tvm { namespace schema {

__interface IPubkeyInput {
	[[internal, answer_id]]
	uint256 get(string prompt);
}

}};

## Code Example

### Solidity

[Example.sol](examples/Example.sol)

### C++

TODO: Add example
