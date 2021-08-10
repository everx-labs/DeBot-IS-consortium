> :warning: **This Interface should be implemented by DeBot Engine**
# System Interface

**Status**: Proposed

| Name            | ID                                                                |
| :-------------- | :---------------------------------------------------------------- |
| Sdk             | 8fc6454f90072c9f1f6d3313ae1608f64f4a0660c6ae9f42c68b6a79e2a1bc4b  |


## Description

Builtin Interface that covers subset of TON SDK functions. Implemented by DEngine.

## Functions

Since DeBot is a smart contract then all functions work asyncronously by design. It means that they don't return anything despite the fact that all have `returns` value in their specification. Result callback will be called later and it must have arguments defined in `returns` section.

### Accounts

`getBalance` - get account balance. 

arguments: 

	answerId: uint32 - function id of result callback.
	addr    : address - address of contract.

returns: 

	nanotokens: uint128 - account balance in nanotokens.

`getAccountType` - get account type. 

arguments: 

	answerId: uint32 - function id of result callback.
	addr    : address - address of contract.

returns: 

	acc_type: int8 - account type. Valid values are -1 (unexist), 0 (uninit), 1 (active), 2 (frozen).

`getAccountCodeHash` - get account code hash.

arguments: 

	answerId: uint32 - function id of result callback.
	addr    : address - smart contract address.

returns: 

	code_hash: uint256 - account code hash.

### Encryption

`encrypt` - encrypt data with defined encryption box.

arguments:

    answerId: uint32 - function id of result callback.
    boxHandle: uint32 - encryption box handle. Remark: it can be received through `EncryptionBoxInput` interface.

returns:

    result: uint32 - result code of operation. 0 if succeeded, otherwise SDK error code.
    encrypted: bytes - encrypted data bytes.

`decrypt` - decrypt data with defined encryption box.

arguments:

    answerId: uint32 - function id of result callback.
    boxHandle: uint32 - encryption box handle. Remark: it can be received through `EncryptionBoxInput` interface.

returns:

    result: uint32 - result code of operation. 0 if succeeded, otherwise SDK error code.
    decrypted: bytes - decrypted data bytes.

### Signing

`signHash` - sign data hash (256bits) with defined signing box.

arguments: 

    answerId: uint32 - function id of result callback.
    boxHandle: uint32 - signing box handle.
    hash: uint256 - data hash to sign.

returns: 

    signature: bytes - 512 bits of signature.

### Utils

`genRandom` - generate random byte array of the specified length.

arguments: 

    answerId: uint32 - function id of result callback.
    length: uint32 - size of random byte array.

returns: 

    buffer: bytes - random bytes.

`substring` - return string of `count` bytes starting from `start` byte of original string.

arguments:

    answerId: uint32 - function id of result callback.
    str: bytes - original string.
    start: uint32 - index of byte in original string from which to start substring. `start` must be less then length of original string.
    count: uint32 - length in bytes of substring. Must be less or equal then ( `str.legnth` - `start` ).

returns: 

    substr: bytes - substring of original string.

### Obsolete functions
    

>**Important: This functions will be removed soon. Don't use them in new DeBots.**

`mnemonicFromRandom` - generate random mnemonic (seed phrase).

arguments:

    answerId: uint32 - function id of result callback.
    dict: uint32 - type of dictionary.
    wordCount: uint32 - word count in mnemonic.

returns:

    phrase: bytes - generated string with mnemonic.

`mnemonicVerify` - verify mnemonic.

arguments:

    answerId: uint32 - function id of result callback.
    phrase: bytes - string with mnemonic.

returns:

    valid: bool - true if mnemonic is valid.

`mnemonicDeriveSignKeys` - derive signing keypair from mnemonic.

arguments:

    answerId: uint32 - function id of result callback.
    phrase: bytes - string with mnemonic.
    path: bytes - string with derivation path (hdpath).

returns:

    pub: uint256 - public key.
    sec: uint256 - secret key.

`hdkeyXprvFromMnemonic` - generate extended master private key from mnemonic.

arguments:

    answerId: uint32 - function id of result callback.
    phrase: bytes - string with mnemonic.

returns:

    xprv: bytes - extended master private key.

`hdkeyDeriveFromXprv` - derive extended private key derived from the specified extended private key and child index.

arguments:

    answerId: uint32 - function id of result callback.
    inXprv: bytes - input xprv.
    childIndex: uint32 - child index in hdpath.
    hardened: bool - defines which key to derive: hardened/not-hardended.

returns:

    xprv: bytes - derived extended master private key.

`hdkeyDeriveFromXprvPath` - derive extended private key derived from the specified extended private key and hdpath.

arguments:

    answerId: uint32 - function id of result callback.
    inXprv: bytes - input xprv.
    path: bytes - string with hdpath.

returns:

    xprv: bytes - derived extended master private key.

`hdkeySecretFromXprv` - generate secret key from xprv.

arguments:

    answerId: uint32 - function id of result callback.
    xprv: bytes - extended master private key.

returns:

    sec: uint256 - secret key.

`hdkeyPublicFromXprv` - generate public key from xprv.

arguments:

    answerId: uint32 - function id of result callback.
    xprv: bytes - extended master private key.

returns:

    pub: uint256 - public key.

`naclSignKeypairFromSecretKey` - generate signing keypair from secret key.

arguments:

    answerId: uint32 - function id of result callback.
    secret: uint256 - secret.

returns:

    pub: uint256 - public key.
    sec: uint256 - secret key.

`naclBox` - encrypt and authenticate data with NaclBox.

arguments:

    answerId: uint32 - function id of result callback.
    decrypted: bytes - data to encrypt.
    nonce: bytes - bytes of nonce.
    publicKey: uint256 - receiver public key.
    secretKey: uint256 - sender secret key.

returns:

    encrypted: bytes - encrypted data bytes.

`naclBoxOpen` - decrypt and verify data encrypted with NaclBox.

arguments:

    answerId: uint32 - function id of result callback.
    encrypted: bytes - data to decrypt.
    nonce: bytes - bytes of nonce.
    publicKey: uint256 - sender public key.
    secretKey: uint256 - receiver secret key.

returns:

    decrypted: bytes - decrypted data bytes.

`naclKeypairFromSecret` - generate encryption keypair from secret.

arguments:

    answerId: uint32 - function id of result callback.
    secret: uint256 - 256 bits of secret.

returns:

    publicKey: uint256 - public key.
    secretKey: uint256 - secret key.

`chacha20` - performs symmetric chacha20 encryption.

arguments: 

	answerId: uint32 - function id of result callback
	data: bytes - source data to be encrypted or decrypted
	nonce: bytes - 96-bit nonce
	key: uint256 - 256-bit key

returns: 

	output: bytes - encrypted or decrypted data


## Declaration in Solidity

```jsx
interface ISdk {
// accounts
function getBalance(uint32 answerId, address addr) external returns (uint128 nanotokens);
function getAccountType(uint32 answerId, address addr) external returns (int8 acc_type);
function getAccountCodeHash(uint32 answerId, address addr) external returns (uint256 code_hash);
function getAccountsDataByHash(uint32 answerId, uint256 codeHash, address gt) external returns (AccData[] accounts);
// encryption
function encrypt(uint32 answerId, uint32 boxHandle, bytes data) external returns (uint32 result, bytes encrypted);
function decrypt(uint32 answerId, uint32 boxHandle, bytes data) external returns (uint32 result, bytes decrypted);
// signing
function signHash(uint32 answerId, uint32 boxHandle, uint256 hash) external returns (bytes signature);
// crypto utils
function genRandom(uint32 answerId, uint32 length) external returns (bytes buffer);
// string
function substring(uint32 answerId, string str, uint32 start, uint32 count) external returns (string substr);
}
```

## Declaration in C++

TODO: add later.

## Code Example

### Solidity

[Example.sol](examples/Example.sol)

### C++

TODO: add later
