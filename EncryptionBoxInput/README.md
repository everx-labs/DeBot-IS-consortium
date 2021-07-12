
# EncryptionBoxInput Interface

**Status**: Proposed.
**Revision**: 1.

| Name               | ID                                                                |
| :----------------- | :---------------------------------------------------------------- |
| EncryptionBoxInput | 5b5f76b54d976d72f1ada3063d1af2e5352edaf1ba86b3b311170d4d81056d61  |


## Description

Interface for creating new encryption box that can encrypt/decrypt data using defined crypto algorithm.


## Functions

`getNaclSecretBox` - prints prompt message to the user and returns handle to opened Nacl secret box.

arguments:

    answerId: uint32 - id of function callback.
    prompt: bytes - utf-8 string to print to the user before input, OPTIONAL (empty string is similar to null).
    nonce: bytes - bytes of nonce.

returns:

	handle: uint32 - id of registered encryption box.

`getNaclBox` - prints prompt message to the user and returns handle to Nacl box.

arguments:

    answerId: uint32 - id of function callback.
    prompt: bytes - utf-8 string to print to the user before input, OPTIONAL (empty string is similar to null).
    nonce: bytes - bytes of nonce.
    theirPubkey: uinit256 - receiver's public key. 

returns:

	handle: uint32 - id of registered encryption box.

`getChaCha20Box` - prints prompt message to the user and returns handle to ChaCha20 box.

arguments:

    answerId: uint32 - id of function callback.
    prompt: bytes - utf-8 string to print to the user before input, OPTIONAL (empty string is similar to null).
    nonce: bytes - 96-bit nonce.

returns:

	handle: uint32 - id of registered encryption box.

Note: Encryption secret key must be derived from signing keypair selected by user. Browser should choose arbitrary hdpath for derivation and keep it in secret.

Note: encryption box handle can be used later to encrypt/decrypt data. Use Sdk.encrypt or Sdk.decrypt functions.

`remove` - removes encryption box handle from Browser and destroys underlying Encryption Box.

arguments:

    answerId: uint32 - id of function callback.
    handle: uint32 - encryption box handle to remove. This handle becomes invalid after removing.

returns:

    removed: bool - true if handle was found and successfully removed. Otherwise false.

`getSupportedAlgorithms` - returns a list of algorithms supported by DeBot Browser.

arguments:

    none

returns:

    names: bytes[] - array of algorithm names supported by DeBot Browser.

## Declaration in Solidity

```solidity
interface IEncryptionBoxInput {

	function getNaclSecretBox(uint32 answerId, string prompt, bytes nonce) external returns (uint32 handle);
    function getNaclBox(uint32 answerId, string prompt, bytes nonce, uint256 theirPubkey) external returns (uint32 handle);
    function getChaCha20Box(uint32 answerId, string prompt, bytes nonce) external returns (uint32 handle);
    function remove(uint32 answerId, uint32 handle) external returns (bool removed);
    function getSupportedAlgorithms() external returns (string[] names);
}
```

## Declaration in C++

namespace tvm { namespace schema {

__interface IEncryptionBoxInput {
	[[internal, answer_id]]
	uint32 getNaclSecretBox(string prompt, bytes nonce);
    [[internal, answer_id]]
	uint32 getNaclBox(string prompt, string algorithm, bytes nonce, uint256 theirPubkey);
    [[internal, answer_id]]
	uint32 getChaCha20Box(string prompt, bytes nonce);
    [[internal, answer_id]]
    bool remove(uint32 handle);
    [[internal, answer_id]]
    string[] getSupportedAlgorithms();
}

}};


## Code Example

### Solidity

examples/Example.sol


### C++

TODO: Add example
