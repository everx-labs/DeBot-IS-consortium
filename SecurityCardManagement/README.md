# SecurityCardManagement Interface

**Status**: Proposed

| Name                        | ID                                                                |
| :-------------------------- | :---------------------------------------------------------------- |
| SecurityCardManagement      | 5960c60629709699c0f80756ee9a4074dde26e8f68cddd03bf0507d8eb07915f  |


## Description

Allows to manage security card.

## Functions

Since DeBot is a smart contract then all functions work asyncronously by design. It means that they don't return anything despite the fact that all have `returns` value in their specification. Result callback will be called later and it must have arguments defined in `returns` section.

`getBlockHashs` - get H2 and H3 hashes from security card. 
The browser should call several functions from the sacurity card library to get H2 and H3. The workflow:
1. get H2 using the getHashOfEncryptedPassword function;
2. get H3 using getHashOfCommonSecret function.

arguments: 

	answerId: uint32 - function id of result callback

returns: 

	h2: uint256 - H2 hash
	h3: uint256 - H3 hash

`turnOnWallet` - verify and setup security card initial data.

arguments: 

	answerId: uint32 - function id of result callback	
	p1      : uint128 - authentication password
	iv      : uint16 - vector for AES128 CBC initialization for encrypting P1
	ecs     : uint32 - encrypted common secret
	pin	: uint16 - security card pin code

returns: 

	pubkey: uint256 - security card public key

`addSigningBox` - add security card signing box to browser. Notify browser to add security card.

arguments: 

	answerId: uint32 - function id of result callback	
	pubkey  : uint256 - security card public key
	
returns: 

	result: bool - result of operation

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


## Declaration in Solidity

```jsx
interface ISecurityCardManagement {
    function getBlockHashs(uint32 answerId) public returns (uint256 h2, uint256 h3); 
    function turnOnWallet(uint32 answerId, uint128 p1, uint16 iv, uint32 ecs, uint16 pin) public returns (uint256 pubkey);
    function addSigningBox(uint32 answerId, uint256 pubkey) public return (bool result);
    function setRecoveryData(uint32 answerId, bytes recoveryData) public return (bool result);
    function getRecoveryData(uint32 answerId) public return (bytes recoveryData);
}
```

## Declaration in C++

```cpp
namespace tvm { namespace schema {

struct blockHashRes {
	uint256 h2;
	uint256 h3;
};

__interface ISecurityCardManagement {

	[[internal, answer_id]]
	blockHashRes getBlockHashs();
	[[internal, answer_id]]
	uint256 turnOnWallet(uint128 p1, uint16 iv, uint32 esc, uint16 pin);
	[[internal, answer_id]]
	bool_t addSigningBox(uint256 pubkey);
	[[internal, answer_id]]
	bool_t setRecoveryData(bytes recoveryData);
	[[internal, answer_id]]
	bytes getRecoveryData();

}
};
```

## Code Example

### Solidity

[Example.sol](examples/Example.sol)

### C++

TODO: add later
