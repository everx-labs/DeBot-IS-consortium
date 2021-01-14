# Stdout Interface

**Status**: Proposed

| Name      | ID                                                                |
| :-------- | :---------------------------------------------------------------- |
| Stdout    | c91dcc3fddb30485a3a07eb7c1e5e2aceaf75f4bc2678111de1f25291cdda80b  |

## Description

Allows to show plain string messages to the user.

## Functions

`print` - shows string message to the user

arguments: 

	message: bytes - utf8 string as byte array

returns: 

	void

## Declaration in Solidity

```jsx
interface IStdout {

    function print(string message) external;

}
```

## Declaration in C++

```cpp
namespace tvm { namespace schema {

__interface IStdout {

	[[internal]]
	void print(string message);

}
};
```

## Code Example

### Solidity

Example.sol

### C++

TODO: add later.