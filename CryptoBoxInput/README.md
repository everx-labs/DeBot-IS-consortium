
# CryptoBoxInput Interface

**Status**: Proposed

| Name               | ID                                                                |
| :----------------- | :---------------------------------------------------------------- |
| CryptoBoxInput     | 5b5f76b54d976d72f1ada3063d1af2e5352edaf1ba86b3b311170d4d81056d61  |


## Description

Interface for creating new crypto box that stores seed phrase defined by user.

TODO: insert link to Crypto Boxes documentation. 

## Functions

`get` - prints prompt message to the user and returns handle to opened crypto box.

arguments:

	answerId: uint32 - id of function callback.
	prompt: bytes - utf-8 string to print to the user before input, OPTIONAL (empty string is similar to null).

returns:

	handle: uint32 - id of registered crypto box.


Note: crypto box handle can be used later to create encryption box or signing box through Sdk interface. Use Sdk.getEncryptionBox to open crypto box (for encrypt/decrypt operations) and Sdk.getSigningBox to open signing box (for signing external messages and arbitrary data).

## Declaration in Solidity

```solidity
interface ICryptoBoxInput {

	function get(uint32 answerId, string prompt) external returns (uint32 handle);

}
```

## Declaration in C++

namespace tvm { namespace schema {

__interface ICryptoBoxInput {
	[[internal, answer_id]]
	(uint32) get(string prompt);
}

}};


## Code Example

### Solidity

examples/Example.sol


### C++

TODO: Add example
