# Crypto Browser/System Interface

**Status**: Proposed

| Name                | ID                                                                |
| :------------------ | :---------------------------------------------------------------- |
| Crypto		      | fb  |


## Description

Crypto interface allows to store all user private data into a browser. DeBot operates only with handles to the user private data and ask the browser to do all operations with the private data.

## Functions

Since DeBot is a smart contract then all functions work asyncronously by design. It means that they don't return anything despite the fact that all have `returns` value in their specification. Result callback will be called later and it must have arguments defined in `returns` section.

***seed phrase***

`mnemonicFromRandom` - Generates a random mnemonic from the specified dictionary and word count. 

arguments: 

	answerId  : uint32 - function id of result callback
	dict      : uint32 - Dictionary identifier
	wordCount : uint32 - Mnemonic word count

returns: 

	phraseHandle: uint32 - handle to seed phrase

`mnemonicSelect` - Allow user to input or select valid seed phrase. 

arguments: 

	answerId  : uint32 - function id of result callback
	prompt : string - string printed to the user and describing what to enter

returns: 

	phraseHandle: uint32 - handle to seed phrase

`mnemonicFromDeBot` - DeBot can register a seed phrase in the browser. It recommended to get the seed phrase from the user using mnemonicSelect function

arguments: 

	answerId  : uint32 - function id of result callback
	phrase : string - mnemonic phrase

returns: 

	phraseHandle: uint32 - handle to seed phrase
	
`mnemonicPrint` - Print seed phrase by handle to user. Text argument should be formated like "some {} text" and "{}" symbols should be replaced with seed phrase

arguments: 

	answerId  : uint32 - function id of result callback
	text : string - text to print
	phraseHandle: uint32 - handle to seed phrase

returns: 

	result: bool - result of operation	
	
`mnemonicDeriveSignKeys` - Returns ed25519 key pair derived from the specified seed phrase

arguments: 

	answerId  : uint32 - function id of result callback
	phraseHandle: uint32 - handle to seed phrase
	index: uint32 - child index
	hardened: bool - indicates the derivation of hardened/not-hardened key

returns: 

	edHandle: uint32 - handle to the ed25519 key pair
	pubkey: uint256 - publick key of the key pair

`mnemonicRemove` - say browser to remove handle to seed phrase

arguments: 

	answerId  : uint32 - function id of result callback
	phraseHandle: uint32 - handle to seed phrase

returns: 

	result: bool - result of operation
	
***ed25519***	

`edFromRandom` - Generates a random ed25519 key pair. 

arguments: 

	answerId  : uint32 - function id of result callback

returns: 

	edHandle: uint32 - handle to the ed25519 key pair
	pubkey: uint256 - publick key of the key pair

`edSelect` - Allow user to input or select a ed25519 key pair. 

arguments: 

	answerId  : uint32 - function id of result callback
	prompt : string - string printed to the user and describing what to enter

returns: 

	edHandle: uint32 - handle to the ed25519 key pair
	pubkey: uint256 - publick key of the key pair

`edFromDeBot` - DeBot can register a key pair in the browser. It recommended to get the key pair from the user using edSelect function

arguments: 

	answerId  : uint32 - function id of result callback
	pub : uint256 - key pair public key
    sec : uint256 - key pair secret key
    
returns: 

	edHandle: uint32 - handle to the ed25519 key pair

`edGetPubKey` - get public key by handle

arguments: 

	answerId  : uint32 - function id of result callback
	edHandle: uint32 - handle to the ed25519 key pair

returns: 

	pubkey : uint256 - key pair public key
		
`edPrint` - Print a ed25519 keypair by handle to user. Text argument should be formated like "some {} text {}" and the first "{}" symbols should be replaced with the public key and the second "{}" symbols should be replaced with the secret key.

arguments: 

	answerId  : uint32 - function id of result callback
	text : string - text to print
	edHandle: uint32 - handle to the ed25519 key pair

returns: 

	result: bool - result of operation	

`edRemove` - say browser to remove handle to the ed25519 key pair

arguments: 

	answerId  : uint32 - function id of result callback
	edHandle: uint32 - handle to the ed25519 key pair

returns: 

	result: bool - result of operation
	
***curve25519***	

`curveFromRandom` - Generates a random curve25519 key pair. 

arguments: 

	answerId  : uint32 - function id of result callback

returns: 

	curveHandle: uint32 - handle to the curve25519 key pair
	pubkey: uint256 - publick key of the key pair

`curveSelect` - Allow user to input or select a curve25519 key pair. 

arguments: 

	answerId  : uint32 - function id of result callback
	prompt : string - string printed to the user and describing what to enter

returns: 

	curveHandle: uint32 - handle to the curve25519 key pair
	pubkey: uint256 - publick key of the key pair

`curveFromDeBot` - DeBot can register a key pair in the browser. It recommended to get the key pair from the user using edSelect function

arguments: 

	answerId  : uint32 - function id of result callback
	pub : uint256 - key pair public key
    sec : uint256 - key pair secret key
    
returns: 

	curveHandle: uint32 - handle to the curve25519 key pair

`curveFromEd` - Calculate the curve25519 key pair from a ed25519 secret key

arguments: 

	answerId  : uint32 - function id of result callback
	edHandle: uint32 - handle to the ed25519 key pair

returns: 

	curveHandle: uint32 - handle to the curve25519 key pair
	
`curveGetPubKey` - get public key by handle

arguments: 

	answerId  : uint32 - function id of result callback
	curveHandle: uint32 - handle to the curve25519 key pair

returns: 

	pubkey : uint256 - key pair public key
		
`curvePrint` - Print a curve25519 keypair by handle to user. Text argument should be formated like "some {} text {}" and the first "{}" symbols should be replaced with the public key and the second "{}" symbols should be replaced with the secret key.

arguments: 

	answerId  : uint32 - function id of result callback
	text : string - text to print
	curveHandle: uint32 - handle to the curve25519 key pair

returns: 

	result: bool - result of operation	

`curveRemove` - say browser to remove handle to the curve25519 key pair

arguments: 

	answerId  : uint32 - function id of result callback
	curveHandle: uint32 - handle to the curve25519 key pair

returns: 

	result: bool - result of operation

***encryption key***

`encFromRandom` - Generates a random encryption key. 

arguments: 

	answerId  : uint32 - function id of result callback
	len  : uint32 - length in bytes

returns: 

	encHandle: uint32 - handle to the encryption key

`encSelect` - Allow user to input or select an encryption key. 

arguments: 

	answerId  : uint32 - function id of result callback
	prompt : string - string printed to the user and describing what to enter

returns: 

	encHandle: uint32 - handle to the encryption key

`encFromDeBot` - DeBot can register a key pair in the browser. It recommended to get the key pair from the user using edSelect function

arguments: 

	answerId  : uint32 - function id of result callback
	key : bytes - encryption key

returns: 

	encHandle: uint32 - handle to the encryption key

`encFromEdSec` - Use a ed25519 secret key as encryption key

arguments: 

	answerId  : uint32 - function id of result callback
	edHandle: uint32 - handle to the ed25519 key pair

returns: 

	encHandle: uint32 - handle to the encryption key
	
`encPrint` - Print an encryption key by handle to user. Text argument should be formated like "some {} text" and the first "{}" symbols should be replaced with the encryption key.

arguments: 

	answerId  : uint32 - function id of result callback
	text : string - text to print
	encHandle: uint32 - handle to the encryption key

returns: 

	result: bool - result of operation	

`curveRemove` - say browser to remove handle to the encryption key

arguments: 

	answerId  : uint32 - function id of result callback
	encHandle: uint32 - handle to the encryption key

returns: 

	result: bool - result of operation
	
***crypto***

`naclBox` - Public key authenticated encryption. Encrypt and authenticate a message using the senders secret key, the recievers public key, and a nonce.. 

arguments: 

	answerId  : uint32 - function id of result callback
	decrypted  : bytes -  data that must be encrypted
	nonce  : bytes - nonce
	theirPublic : uint256 - receiver's public key
	curveHandle: uint32 - handle to the curve25519 key pair

returns: 

	encrypted: bytes - encrypted data
	
`naclBoxOpen` - Decrypt and verify the cipher text using the recievers secret key, the senders public key, and the nonce. 

arguments: 

	answerId  : uint32 - function id of result callback
	encrypted  : bytes -  data that must be decrypted
	nonce  : bytes - nonce
	theirPublic : uint256 - sender's public key
	curveHandle: uint32 - handle to the curve25519 key pair

returns: 

	decrypted: bytes - decrypted data
	
`chacha20` - performs symmetric chacha20 encryption.

arguments: 

	answerId  : uint32 - function id of result callback
	data  : bytes - input data
	nonce  : bytes - nonce
	encHandle: uint32 - handle to the encryption key

returns: 

	output: bytes - output data

***message***

`sendMsg` - sign message with the specified ed25519 keypair and send it to the blockchain. 

arguments: 

	answerId  : uint32 - function id of result callback
	message : TvmCell - unsigned message encoded into tree of cells
	edHandle: uint32 - handle to the ed25519 key pair

returns: 

	result: bool - result of operation


## Declaration in Solidity

```jsx
pragma solidity >= 0.6.0;
interface ICrypto {
    //seed phrase
    function mnemonicFromRandom(uint32 answerId, uint32 dict, uint32 wordCount)  external returns (uint32 phraseHandle);
    function mnemonicSelect(uint32 answerId, string prompt)  external returns (uint32 phraseHandle);
    function mnemonicFromDeBot(uint32 answerId, string phrase) external returns (uint32 phraseHandle);
    function mnemonicPrint(uint32 answerId, string text, uint32 phraseHandle)  external returns (bool result);
    function mnemonicDeriveSignKeys(uint32 answerId, uint32 phraseHandle, uint32 index, bool hardened) external returns (uint32 edHandle, uint256 pubkey);
    function mnemonicRemove(uint32 answerId, uint32 phraseHandle) external returns (bool result);
    //ed25519
    function edFromRandom() external returns (uint32 edHandle, uint256 pubkey);
    function edSelect(uint32 answerId, string prompt)  external returns (uint32 edHandle, uint256 pubkey);
    function edFromDeBot(uint32 answerId, uint256 pub, uint256 sec) external returns (uint32 edHandle);
    function edGetPubKey(uint32 answerId, uint32 edHandle)  external returns (uint256 pubkey);
    function edPrint(uint32 answerId, string text, uint32 edHandle)  external returns (bool result);
    function edRemove(uint32 answerId, uint32 edHandle) external returns (bool result);
    //curve25519
    function curveFromRandom(uint32 answerId) external returns (uint32 curveHandle, uint256 pubkey);
    function curveSelect(uint32 answerId, string prompt)  external returns (uint32 curveHandle, uint256 pubkey);
    function curveFromDeBot(uint32 answerId, uint256 pub, uint256 sec) external returns (uint32 curveHandle);
    function curveFromEd(uint32 answerId, uint32 edHandle)  external returns (uint32 curveHandle, uint256 pubkey);
    function curveGetPubKey(uint32 answerId, uint32 curveHandle)  external returns (uint256 pubkey);
    function curvePrint(uint32 answerId, string text, uint32 curveHandle)  external returns (bool result);
    function curveRemove(uint32 answerId, uint32 curveHandle ) external returns (bool result);
    //encryption key
    function encFromRandom(uint32 answerId, uint32 len) external returns (uint32 encHandle);
    function encSelect(uint32 answerId, string prompt)  external returns (uint32 encHandle);
    function encFromDeBot(uint32 answerId, bytes key) external returns (uint32 encHandle);
    function encFromEdSec(uint32 answerId, uint32 edHandle)  external returns (uint32 encHandle);
    function encPrint(uint32 answerId, string text, uint32 encHandle) external returns (bool result);
    function encRemove(uint32 answerId, uint32 encHandle ) external returns (bool result);
    //crypto
    function naclBox(uint32 answerId, bytes decrypted, bytes nonce, uint256 theirPublic, uint32 curveHandle) external returns (bytes encrypted);
    function naclBoxOpen(uint32 answerId, bytes encrypted, bytes nonce, uint256 theirPublic, uint32 curveHandle) external returns (bytes decrypted);
    function chacha20(uint32 answerId, bytes data, bytes nonce, uint32 encHandle) external returns (bytes output);
    //message
    function sendMsg(uint32 answerId, TvmCell message, uint32 edHandle) external returns (bool result);
}
```

## Declaration in C++
TODO: add later

## Code Example

### Solidity

TODO: add later

### C++

TODO: add later
