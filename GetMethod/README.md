# GetMethod Interface

**Status**: Proposed

| Name      | ID                                                                |
| :-------- | :---------------------------------------------------------------- |
| GetMethod | 3d0323283da25520cc32eb881b41e556055bf666351f09b4729f38838e0f7049  |

## Description

Allows to run get-method of target smart contract.

## Functions

`run` - runs get-method.

arguments: 

    answerId: uint32 - function id of result callback. Names and count of callback parameters must be equal to return values of get-method.

	message: cell - unsigned message encoded into tree of cells. Message body must contain function id and arguments of get-method.
    
returns: 

	void

## Declaration in Solidity

```jsx
interface IGetMethod {

    function run(uint32 answerId, TvmCell message) external;

}
```

## Declaration in C++

```cpp
namespace tvm { namespace schema {

__interface IGetMethod {

	[[internal]]
	void run(uint32 answerId, cell message);
};

}}
```

## Code Example

### Solidity

Example.sol

### C++

TODO: add later.