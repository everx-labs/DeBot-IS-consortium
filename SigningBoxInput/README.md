
# SigningBoxInput Interface

**Status**: Proposed

| Name            | ID                                                                |
| :-------------- | :---------------------------------------------------------------- |
| SigningBoxInput | c13024e101c95e71afb1f5fa6d72f633d51e721de0320d73dfd6121a54e4d40a  |


## Description

Interface for getting signing box which can be used to sign external messages and other arbitrary data by handle without accessing the keys directly. 

## Functions

`get` - prints prompt message to the user and returns handle for selected SigningBox

arguments:

	answerId: uint32 - id of function callback.
	prompt: bytes - utf-8 string to print to the user before input.
	possiblePublicKeys: uint256[] - keys for identification of signing box. Can be empty.

returns:

	{ handle: uint32 }

## Declaration in Solidity

```solidity
interface ISigningBoxInput {

	function get(uint32 answerId, string prompt, uint256[] possiblePublicKeys) external returns (uint32 handle);

}
```

## Declaration in C++

namespace tvm { namespace schema {

__interface ISigningBoxInput {
	[[internal, answer_id]]
	(uint32) get(string prompt, vector<uint256> possiblePublicKeys);
}

}};


## Code Example

### Solidity

examples/Example.sol


### C++

TODO: Add example
