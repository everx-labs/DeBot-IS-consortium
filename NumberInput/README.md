
# NumberInput Interface

**Status**: Accepted

| Name        | ID                                                                |
| :---------- | :---------------------------------------------------------------- |
| NumberInput | c5a9558b2664aed7dc3e6123436d544f13ffe69ab0e259412f48c6d1c8588401  |


## Description

Interface for number input.

## Functions

`get` - prints prompt message to the user and returns singed integer entered by user

arguments:

    answerId: uint32 - id of callback function.
    prompt: bytes - utf-8 string to print to the user before input.
    min: int256 - minimal value allowed to input.
    max: int256 - maximum value allowed to input.

returns:

	{ value: int256 }

## Declaration in Solidity

interface INumberInput {

	function get(uint32 answerId, string prompt, int256 min, int256 max) external returns (int256 value);

}

## Declaration in C++

namespace tvm { namespace schema {

__interface INumberInput {
	[[internal, answer_id]]
	int256 get(string prompt, int256 min, int256 max);
}

}};

## Code Example

### Solidity

Example.sol

### C++

TODO: Add example
