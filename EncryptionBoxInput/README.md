
# EncryptionBoxInput Interface

**Status**: Proposed

| Name               | ID                                                                |
| :----------------- | :---------------------------------------------------------------- |
| EncryptionBoxInput | 5b5f76b54d976d72f1ada3063d1af2e5352edaf1ba86b3b311170d4d81056d61  |


## Description

Interface for creating new encryption box that can encrypt/decrypt data using defined crypto algorithm.


## Functions

`get` - prints prompt message to the user and returns handle to opened encryption box.

arguments:

    answerId: uint32 - id of function callback.
    prompt: bytes - utf-8 string to print to the user before input, OPTIONAL (empty string is similar to null).
    algorithm: bytes - utf-8 string with a name of encryption algorithm. Can be one of the following value: "NaclBox",  "NaclSecretBox", "Chacha20" - or other algorithm name supported by Browser.
    params: TvmCell - packed algorithm parameters.

returns:

	handle: uint32 - id of registered encryption box.

Note: encryption box handle can be used later to encrypt/decrypt data. Use Sdk.encrypt or Sdk.decrypt functions.

`getSupportedAlgorithms` - returns a list of algorithm names supported by DeBot Browser which can be used as `algorithm` argument in `EncryptionBoxInput.get` function.

arguments:

    none

returns:

    names: bytes[] - array of algorithm names supported by DeBot Browser.

## Declaration in Solidity

```solidity
interface IEncryptionBoxInput {

	function get(uint32 answerId, string prompt, string algorithm, TvmCell params) external returns (uint32 handle);
    function getSupportedAlgorithms() external returns (string[] names);
}
```

## Declaration in C++

namespace tvm { namespace schema {

__interface IEncryptionBoxInput {
	[[internal, answer_id]]
	(uint32) get(string prompt, string algorithm, cell params);
    [[internal, answer_id]]
    (string[]) getSupportedAlgorithms();
}

}};


## Code Example

### Solidity

examples/Example.sol


### C++

TODO: Add example
