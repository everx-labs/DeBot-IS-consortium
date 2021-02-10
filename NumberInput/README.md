
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
	min: int32
	max: int32

returns:

	{ value: int32 }

---

`uint` - prints prompt message to the user and returns unsinged integer entered by user

arguments:

	answerId: uint32
    prompt: bytes
	min: uint32
	max: uint32

returns:

	{ value: uint32 }

## Declaration in Solidity

TODO: Add declaration

## Declaration in C++

TODO: Add declaration

## Code Example

### Solidity

TODO: Add example

### C++

TODO: Add example
