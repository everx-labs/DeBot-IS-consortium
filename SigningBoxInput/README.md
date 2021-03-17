
# SigningBoxInput Interface

**Status**: Proposed

| Name            | ID                                                                |
| :-------------- | :---------------------------------------------------------------- |
| SigningBoxInput | c13024e101c95e71afb1f5fa6d72f633d51e721de0320d73dfd6121a54e4d40a  |


## Description

Interface for getting signing box and sign a data.

## Functions

`get` - prints prompt message to the user and returns public key for selected SigningBox

arguments:

	answerId: uint32 - id of function callback.
	prompt: bytes - utf-8 string to print to the user before input.
	possiblePublicKeys: uint256[] - keys for identification of signing box

returns:

	{ publicKey: uint256 }

`sign` - prints prompt message to the user, send data for signing and returns signature

arguments:

	answerId: uint32 - id of function callback.
	prompt: bytes - utf-8 string to print to the user before input.
	data: bytes - data for signing
	publicKey: uint256 - key for identification of signing box

returns:

	{ signature: bytes }

## Declaration in Solidity

interface ISignBoxInput {

	function get(uint32 answerId, string prompt, uint256[] possiblePublicKeys) external returns (uint256 publicKey);
	
	function sign(uint32 answerId, string prompt, data: bytes, uint256[] publicKey) external returns (bytes signature);

}

## Declaration in C++

TODO: Add declaration


## Code Example

### Solidity

TODO: Add example


### C++

TODO: Add example
