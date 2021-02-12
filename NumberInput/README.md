
# NumberInput Interface

**Status**: Proposed

| Name        | ID                                                                |
| :---------- | :---------------------------------------------------------------- |
| NumberInput | c5a9558b2664aed7dc3e6123436d544f13ffe69ab0e259412f48c6d1c8588401  |


## Description

Interface for number input.

## Functions

`int` - prints prompt message to the user and returns singed integer entered by user

arguments:

	answerId: uint32
    prompt: bytes
	min: int256
	max: int256

returns:

	{ value: int256 }

## Declaration in Solidity

interface INumberInput {

	function select(uint32 answerId, string prompt, int256 min, int256 max) external returns (int256 value);

}

## Declaration in C++

namespace tvm { namespace schema {

__interface INumberInput {
	[[internal, answer_id]]
	int256 select(string prompt, int256 min, int256 max);
}

}};

## Code Example

### Solidity

TODO: Add example

### C++

TODO: Add example
