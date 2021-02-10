
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

---

`uint` - prints prompt message to the user and returns unsinged integer entered by user

arguments:

	answerId: uint32
    prompt: bytes
	min: uint256
	max: uint256

returns:

	{ value: uint256 }

## Declaration in Solidity

TODO: Add declaration

## Declaration in C++

TODO: Add declaration

## Code Example

### Solidity

TODO: Add example

### C++

TODO: Add example
