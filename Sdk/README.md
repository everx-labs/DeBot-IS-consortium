> :warning: **This Interface should be implemented by DeBot Engine**
# Sdk System Interface

**Status**: Proposed

| Name                | ID                                                                |
| :------------------ | :---------------------------------------------------------------- |
| Sdk		      | 8fc6454f90072c9f1f6d3313ae1608f64f4a0660c6ae9f42c68b6a79e2a1bc4b  |


## Description

System Interface. Single interface that contain all functions that should be implemented by DeBot Engine.

## Functions

Since DeBot is a smart contract then all functions work asyncronously by design. It means that they don't return anything despite the fact that all have `returns` value in their specification. Result callback will be called later and it must have arguments defined in `returns` section.

`getBalance` - get account balance. 

arguments: 

	answerId: uint32 - function id of result callback
	addr    : address - address of contract

returns: 

	nanotokens: uint128 - result in nanotokens

`getAccountType` - get account type. 

arguments: 

	answerId: uint32 - function id of result callback
	addr    : address - address of contract

returns: 

	acc_type: int8 - account type

`getAccountCodeHash` - get account code hash. 

arguments: 

	answerId: uint32 - function id of result callback
	addr    : address - address of contract

returns: 

	acc_type: uint256 - account code hash

`chacha20` - performs symmetric chacha20 encryption.

arguments: 

	answerId: uint32 - function id of result callback
	data: bytes - source data to be encrypted or decrypted
	nonce: bytes - 96-bit nonce
	key: uint256 - 256-bit key

returns: 

	output: bytes - encrypted or decrypted data

`signHash` - sign hash with user key.

arguments: 

	answerId: uint32 - function id of result callback
	hash: uint256 - hash 

returns: 

	arg1: bytes - result of operation

`genRandom` - generate random byte array of the specified length

arguments: 

	answerId: uint32 - function id of result callback
	length: uint32 - size of random byte array

returns: 

	buffer: bytes - generated bytes 

`compress7z` - compress byte array with 7z

arguments: 

	answerId: uint32 - function id of result callback
	uncompressed: bytes - uncompressed byte array

returns: 

	comp: bytes - compressed byte array

`uncompress7z` - uncompress byte array with 7z

arguments: 

	answerId: uint32 - function id of result callback
	compressed: bytes - compressed byte array

returns: 

	uncomp: bytes - uncompressed byte array


>Deprecated: convertTokens, getAccountState, loadBocFromFile, encryptAuth, genKeypairFromSecret.

## Declaration in Solidity

```jsx
interface ISdk {
	//account info
	function getBalance(uint32 answerId, address addr) external returns (uint128 nanotokens);
	function getAccountType(uint32 answerId, address addr) external returns (int8 acc_type);
	function getAccountCodeHash(uint32 answerId, address addr) external returns (uint256 code_hash);
	//crypto 
	function chacha20(uint32 answerId, bytes data, bytes nonce, uint256 key) external returns (bytes data);
	//crypto utils
	function signHash(uint32 answerId, uint256 hash) external returns (bytes arg1);
	function genRandom(uint32 answerId, uint32 length) external returns (bytes buffer);
	//7z
	function compress7z(uint32 answerId, bytes uncompressed) external returns (bytes comp);
	function uncompress7z(uint32 answerId, bytes compressed) external returns (bytes uncomp);
}
```

## Declaration in C++

```cpp
namespace tvm { namespace schema {

struct KeyPair {
	uint256 publicKey;
	uint256 secretKey;
};

__interface ISdk {
	//account info
	[[internal, answer_id]]
	uint128 getBalance(address addr);
	[[internal, answer_id]]
	uint128 getAccountType(address addr);
	[[internal, answer_id]]
	uint128 getAccountCodeHash(address addr);
	//crypto 
	[[internal, answer_id]]
	bytes chacha20(bytes data, bytes nonce, uint256 key);
	//crypto utils
	[[internal, answer_id]]
	bytes signHash(uint256 hash);
	[[internal, answer_id]]
	bytes genRandom(uint32 length);
	//7z
	[[internal, answer_id]]
	KeyPair compress7z(bytes uncompressed);
	[[internal, answer_id]]
	bytes uncompress7z(bytes compressed);
}

}
};
```

## Code Example

### Solidity

[Example.sol](examples/Example.sol)

### C++

TODO: add later