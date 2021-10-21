# SecurityCardManagement Interface

**Status**: Proposed

| Name                        | ID                                                                |
| :-------------------------- | :---------------------------------------------------------------- |
| SecurityCardManagement      | 5960c60629709699c0f80756ee9a4074dde26e8f68cddd03bf0507d8eb07915f  |


## Description

Allows to manage security card.

## Functions

Since DeBot is a smart contract then all functions work asyncronously by design. It means that they don't return anything despite the fact that all have `returns` value in their specification. Result callback will be called later and it must have arguments defined in `returns` section.

`getBlockHashes` - get H2, H3 hashes and serial number from security card.
The browser should call `getHashes` function from the security card library to get H2, H3 and serial number.
This will not work if the card applet has the status: "TonWalletApplet is personalized.".

arguments:

	answerId: uint32 - function id of result callback

returns:

	h2: uint256 - H2 hash
	h3: uint256 - H3 hash
	sn: uint192 - card serial number


`turnOnWallet` - verify and setup security card initial data.
Before forwarding the request to a security card, a browser must request a pin code and send it to the card with other data.

arguments:

	answerId: uint32 - function id of result callback
	sn      : uint192 - card serial number
	p1      : bytes - authentication password (128 bytes)
	iv      : bytes - vector for AES128 CBC initialization for encrypting P1 (16 bytes)
	cs      : bytes - common secret(32 bytes)

returns: 

	pubkey: uint256 - security card public key

`setRecoveryData` - set recovery data to security card

arguments: 

	answerId: uint32 - function id of result callback
	recoveryData : bytes - recovery data

returns: 

	result: bool - result of operation

`getRecoveryData` - get recovery data from security card

arguments: 

	answerId: uint32 - function id of result callback

returns: 

	recoveryData : bytes - recovery data

`getSerialNumber` - get serial number of touched card

arguments: 

	answerId: uint32 - function id of result callback

returns: 

	serialNumber : uint192 - card serial number

`getTonWalletAppletState` - get card applet state

arguments: 

	answerId: uint32 - function id of result callback

returns: 

	state : string - result of operation

`createKeyForHmac` - create secret key for HMAC SHA256. This key is saved into Android keystore or iOS keychain and then is used by the app to sign APDU commands data fields. 

arguments: 

	answerId: uint32  - function id of result callback
	p1:       bytes   - authentication password (128 bytes) 
	cs:       bytes   - common secret(32 bytes)
	sn:       uint192 - card serial number

returns:

    void

`getCardList` - get the list of serial numbers of the user's cards for which we have keys in Android keystore/iOS keychain.
The browser should call `getAllSerialNumbers` function from the security card library to get the list of serial numbers of the cards.

arguments: 

	answerId: uint32 - function id of result callback

returns: 

	list : uint192[] - array of serial numbers of the cards

`deleteCard` - delete key for given serialNumber from Android keystore/iOS keychain.
The browser should call `deleteKeyForHmac` function from the security card library to get operation execution status (and `finishDeleteKeyFromKeyChainAfterInterruption` function if it is necessary).

arguments: 

	answerId: uint32 - function id of result callback
	sn:       uint192 - serial number of the card to delete

returns: 

	result: bool - result of operation

`isCardExists` - checks whether the key for this serial number exists in the Android keystore/iOS keychain.
The browser should call `isKeyForHmacExist` function from the security card library to get operation execution status 

arguments: 

	answerId: uint32 - function id of result callback
	sn:       uint192 - serial number of the card for checking

returns: 

	result: bool - result of operation

`getPublicKey` - allows to get the public key of the card

arguments:

    answerId: uint32 - function id of result callback

returns:

	pubkey: uint256 - public key of the card

## Declaration in Solidity

```jsx
interface ISecurityCardManagement {
    function getBlockHashes(uint32 answerId) external returns (uint256 h2, uint256 h3, uint192 sn);
    function turnOnWallet(uint32 answerId, uint192 sn, bytes p1, bytes iv, bytes cs) external returns (uint256 pubkey);
    function setRecoveryData(uint32 answerId, bytes recoveryData) external returns (bool result);
    function getRecoveryData(uint32 answerId) external returns (bytes recoveryData);
	function getSerialNumber(uint32 answerId) external returns (uint192 serialNumber);
	function getTonWalletAppletState(uint32 answerId) external returns (string state);
	function createKeyForHmac(
		uint32 answerId,
		bytes p1,
		bytes cs,
		uint192 sn
	) external;
	function getCardList(uint32 answerId) external returns (uint192[] list);
	function deleteCard(uint32 answerId, uint192 sn) external returns (bool result);
	function isCardExists(uint32 answerId, uint192 sn) external returns (bool result);
	function getPublicKey(uint32 answerId) external returns (uint256 pubkey);

}
```

## Declaration in C++

```cpp
namespace tvm { namespace schema {

	struct blockHashRes {
		uint256 h2;
		uint256 h3;
		uint192 sn;
	};

	__interface ISecurityCardManagement {

		[[internal, answer_id]]
		blockHashRes getBlockHashes();
		[[internal, answer_id]]
		uint256 turnOnWallet(uint192 sn, bytes p1, bytes iv, bytes esc);
		[[internal, answer_id]]
		bool_t setRecoveryData(bytes recoveryData);
		[[internal, answer_id]]
		bytes getRecoveryData();
		[[internal, answer_id]]
		uint192 getSerialNumber();
		[[internal, answer_id]]
		bytes getTonWalletAppletState();
		[[internal, answer_id]]
		void createKeyForHmac(bytes p1, bytes cs, uint192 sn);
		[[internal, answer_id]]
		uint192[] getCardList();
		[[internal, answer_id]]
		bool_t deleteCard(uint192 sn);
		[[internal, answer_id]]
		bool_t isCardExists(uint192 sn);
		[[internal, answer_id]]
		uint256 getPublicKey();

	}
};
```

## Code Example

### Solidity

[Example.sol](examples/Example.sol)

### C++

TODO: add later
