# SecurityCardManagement Interface

**Status**: Proposed

| Name                        | ID                                                                |
| :-------------------------- | :---------------------------------------------------------------- |
| SecurityCardManagement      | 5960c60629709699c0f80756ee9a4074dde26e8f68cddd03bf0507d8eb07915f  |


## Description

Allows to manage security card.

## Functions

Since DeBot is a smart contract then all functions work asyncronously by design. It means that they don't return anything despite the fact that all have `returns` value in their specification. Result callback will be called later and it must have arguments defined in `returns` section.

`getBlockHashes` - get H2 and H3 hashes from security card. 
The browser should call several functions from the security card library to get H2 and H3. The workflow:
1. get H2 using the getHashOfEncryptedPassword function;
2. get H3 using getHashOfCommonSecret function.

arguments: 

	answerId: uint32  - function id of result callback
	sn	: uint192 - card serial number

returns: 

	h2: uint256 - H2 hash
	h3: uint256 - H3 hash

`turnOnWallet` - verify and setup security card initial data. 
Before forwarding the request to a security card, a browser must request a pin code and send it to the card with other data.

arguments: 

	answerId: uint32 - function id of result callback	
	sn	: uint192 - card serial number
	p1      : uint128 - authentication password
	iv      : uint16 - vector for AES128 CBC initialization for encrypting P1
	ecs     : uint32 - encrypted common secret

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


## Declaration in Solidity

```jsx
interface ISecurityCardManagement {
    function getBlockHashes(uint32 answerId, uint192 sn) public returns (uint256 h2, uint256 h3); 
    function turnOnWallet(uint32 answerId, uint192 sn, uint128 p1, uint16 iv, uint32 ecs) public returns (uint256 pubkey);
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
	blockHashRes getBlockHashes(uint192 sn);
	[[internal, answer_id]]
	uint256 turnOnWallet(uint192 sn. uint128 p1, uint16 iv, uint32 esc);
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
