# NaclBox Interface

**Status**: Proposed

| Name                | ID                                                                |
| :------------------ | :---------------------------------------------------------------- |
| NaclBox	      | da6e573c0282785d9f8e88a81e0f2665811148cb3bd9b5dcce6a079ab7009958  |


## Description

NaclBox perform naclbox encryption and decryption. Debot should get the signing box from the SigningBox interface and use it for encryption. For encryption, the browser must deduce curve256 keys from the signing box secret key.

## Functions

Since DeBot is a smart contract then all functions work asyncronously by design. It means that they don't return anything despite the fact that all have `returns` value in their specification. Result callback will be called later and it must have arguments defined in `returns` section.

`getPublicKey` - get curve256 public key from signing box handle.

arguments: 

	answerId: uint32 - function id of result callback
        signPublicKey: uint256 - handle to signing box

returns: 

	encryptPublicKey: uint256 - curve256 public key deduce from signing box keys

`encrypt` - Public key authenticated encryption. Encrypt and authenticate a message using the senders secret key, the receivers public key, and a nonce.

arguments: 

	answerId: uint32 - function id of result callback
    	decrypted: bytes - data that must be encrypted encoded
    	nonce: bytes - nonce	
        theirEncryptPublicKey: uint256 - receiver's public key
        signPublicKey: uint256 - handle to signing box

returns: 

	encrypted: bytes - encrypted data
	encryptPublicKey: uint256 - curve256 public key deduce from signing box keys

`decrypt` - Decrypt and verify the cipher text using the receivers secret key, the senders public key, and the nonce.

arguments: 

	answerId: uint32 - function id of result callback
    	encrypted: bytes - data that must be decrypted
    	nonce: bytes - nonce	
        theirEncryptPublicKey: uint256 - receiver's public key
        signPublicKey: uint256 - handle to signing box

returns: 

	decrypted: bytes - decrypted data



## Declaration in Solidity

```jsx
interface INaclBox {
	function getEncryptPublicKey(uint32 answerId, uint256 signPublicKey) external returns (uint256 encryptPublicKey);
	function encrypt(uint32 answerId, bytes decrypted, bytes nonce, uint256 theirEncryptPublicKey, uint256 signPublicKey) external returns (bytes encrypted, uint256 encryptPublicKey);
	function decrypt(uint32 answerId, bytes encrypted, bytes nonce, uint256 theirEncryptPublicKey, uint256 signPublicKey) external returns (bytes decrypted);
}
```

## Declaration in C++

```cpp
#pragma once

namespace tvm { namespace schema {

struct EncryptResult {
	bytes encrypted
	uint256 encryptPublicKey
};

__interface INaclBox {
	[[internal, answer_id]]
	uint256 getPublicKey(uint256 signPublicKey);
	[[internal, answer_id]]
	EncryptResult encrypt(bytes decrypted, bytes nonce, uint256 theirEncryptPublicKey, uint256 signPublicKey);
	[[internal, answer_id]]
	bytes decrypt(bytes encrypted, bytes nonce, uint256 theirEncryptPublicKey, uint256 signPublicKey);
}

}
};
```

## Code Example

### Solidity

[Example.sol](examples/Example.sol)

### C++

TODO: add later
