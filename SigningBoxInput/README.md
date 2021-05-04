
# SigningBoxInput Interface

**Status**: Proposed

| Name            | ID                                                                |
| :-------------- | :---------------------------------------------------------------- |
| SigningBoxInput | c13024e101c95e71afb1f5fa6d72f633d51e721de0320d73dfd6121a54e4d40a  |


## Description

Interface for getting signing box.

## Functions

`get` - prints prompt message to the user and returns handle for selected SigningBox

arguments:

	answerId: uint32 - id of function callback.
	prompt: bytes - utf-8 string to print to the user before input
	possiblePublicKeys: uint256[] - keys for identification of signing box

returns:

	{ handle: uint32, pubkey: uint256 }

## Declaration in Solidity

```solidity
interface ISignBoxInput {

	function get(uint32 answerId, string prompt, uint256[] possiblePublicKeys) external returns (uint32 handle);

}
```

## Declaration in C++

TODO: Add declaration


## Code Example

### Solidity

TODO: Add example


### C++

TODO: Add example
