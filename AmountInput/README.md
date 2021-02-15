
# AmountInput Interface

**Status**: Proposed

| Name        | ID                                                                |
| :---------- | :---------------------------------------------------------------- |
| AmountInput | a1d347099e29c1624c8890619daf207bde18e92df5220a54bcc6d858309ece84  |


## Description

Interface for amount input.

## Functions

`get` - prints prompt message to the user and returns amount of tokens entered by user.

arguments:

	answerId: uint32
    prompt: bytes
    step: uint256
	min: uint256
	max: uint256

returns:

	{ value: uint256 }

## Declaration in Solidity

interface IAmountInput {

	function get(uint32 answerId, string prompt, uint8 decimals, uint256 min, uint256 max) external returns (uint256 value);

}

## Declaration in C++

namespace tvm { namespace schema {

__interface IAmountInput {
	[[internal, answer_id]]
	uint256 get(string prompt, uint8 decimals, uint256 min, uint256 max);
}

}};

## Code Example

### Solidity

TODO: Add example

### C++

TODO: Add example
