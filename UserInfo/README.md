# UserInfo Interface

**Status**: Proposed
**Revision**: 0

| Name      | ID                                                                |
| :-------- | :---------------------------------------------------------------- |
| UserInfo  | a56115147709ed3437efb89460b94a120b7fe94379c795d1ebb0435a847ee580  |


## Description

Allows to get information about current user.

## Functions

`getAccount` - allows DeBots to receive TON address of user main account. Method should be implemented without user interaction if possible. Otherwise DeBot Browser should ask user to enter TON address of smart contract which can be considered the main user account. If user has no default account then zero address should be used.

arguments:

	answerId: uint32 - function id of result callback

returns:

	value: address - TON address of main user account.

`getPublicKey` - allows DeBots to receive user default public key. Method should be implemented without user interaction if possible. If user has no default public key then the method should return 0.

arguments:

    answerId: uint32 - function id of callback.

returns:

	value: uint256 - user default public key, can be 0.

`getSigningBox` - allows DeBot to receive handle to keypair which can be used to sign external messages to the address returned by `UserInfo.getAccount`. This function can return zero handle. In that case DeBot should not use it to sign messages and should implement other ways to recevie signing keypair (e.g using `SigningBoxHandle` interface or delegate DEngine to receive signing box from browser).

arguments:

    answerId: uint32 - function id of callback.

returns:

	handle: uint32 - handle to signing keypair, can be 0.

Important: this interface can be extended in future to retrieve more information about user.

## Declaration in Solidity

```jsx
interface IUserInfo {

    function getAccount(uint32 answerId) external returns (address value);
    function getPublicKey(uint32 answerId) external returns (uint256 value);
    function getSigningBox(uint32 answerId) external returns (uint32 handle);
}
```

## Declaration in C++

```cpp
namespace tvm { namespace schema {

__interface IUserInfo {
	[[internal, answer_id]]
	address getAccount();
	[[internal, answer_id]]
	uint256 getPublicKey();
    [[internal, answer_id]]
	uint32 getSigningBox();
}

};
```

## Code Example

### Solidity

Example.sol

### C++

TODO: add later
