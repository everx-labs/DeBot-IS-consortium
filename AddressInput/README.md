# AddressInput Interface

**Status**: Proposed

| Name         | ID                                                                |
| :--------    | :---------------------------------------------------------------- |
| AddressInput | d7ed1bd8e6230871116f4522e58df0a93c5520c56f4ade23ef3d8919a984653b  |


## Description

Allows to input smart contract address.

## Functions

Since DeBot is a smart contract then all functions work asyncronously by design. It means that they don't return anything despite the fact that all have `returns` value in their specification. Result callback will be called later and it must have arguments defined in `returns` section.

`select` - allows to get TON standard address selected by user.

arguments: 

	answerId: uint32 - function id of result callback
	
returns: 

	value: address - address selected by user.

## Declaration in Solidity

```jsx
interface IAddressInput {
	function select(uint32 answerId) external returns (address value);
}
```

## Declaration in C++

```cpp
namespace tvm { namespace schema {

__interface IAddressInput {

	[[internal, answer_id]]
	address select();
	
};

}}
```

## Code Example

### Solidity

Example.sol

### C++

TODO: add later