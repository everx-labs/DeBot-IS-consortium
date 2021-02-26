
# AmountInput Interface

**Status**: Accepted

| Name        | ID                                                                |
| :---------- | :---------------------------------------------------------------- |
| AmountInput | a1d347099e29c1624c8890619daf207bde18e92df5220a54bcc6d858309ece84  |


## Description

Interface for amount input.

## Functions

`get` - prints prompt message to the user and returns amount of tokens entered by user.

arguments:

	answerId: uint32 - id of function callback.
	prompt: bytes - utf-8 string to print to the user before input.
	decimal: uint8 - number of decimals used by amount token, e.g. 9 - means that browser should multiply token amount to 1000000000 to get its debot represenation.
	min: uint128 - minimal amount that can be entered by user.
	max: uint128 - maximum amount that can be entered by user.

returns:

	{ value: uint128 } - amount of tokens multiplied by `10^decimals`. To get the integer part of an amount debot should divide value by `10^decimals`.

## Declaration in Solidity

interface IAmountInput {

	function get(uint32 answerId, string prompt, uint8 decimals, uint128 min, uint128 max) external returns (uint128 value);

}

## Declaration in C++

namespace tvm { namespace schema {

__interface IAmountInput {
	[[internal, answer_id]]
	uint128 get(string prompt, uint8 decimals, uint128 min, uint128 max);
}

}};

## Code Example

### Solidity

Example.sol

### C++

TODO: Add example
