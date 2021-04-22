> :warning: **This Interface should be implemented by DeBot Engine**
# Hex System Interface

**Status**: Proposed

| Name         | ID                                                                |
| :----------- | :---------------------------------------------------------------- |
| Hex	       | edfbb00d6ebd16d57a1636774845af9499b400ba417da8552f40b1250256ff8f  |

## Description

Allows you to encode and decode Hex strings
> :warning: **This Interface should be implemented by DeBot Engine**

## Functions

`encode` - encode data to hex format.

arguments: 

    answerId: uint32 - function id of result callback.

    data: bytes - input binary data

returns: 

     hexstr: string - hex string

`decode` - decode string from base64 format.

arguments: 

    answerId: uint32 - function id of result callback.

    hexstr: string - hex string

returns: 

     data: bytes - output binary data
		
## Declaration in Solidity

```jsx


interface IHex {

    function encode(uint32 answerId, bytes data) external returns (string hexstr);
    function decode(uint32 answerId, string hexstr) external returns (bytes data);

}
```

## Declaration in C++

```cpp
namespace tvm { namespace schema {

__interface IHex {

	[[internal, answer_id]]
	string encode(bytes data);
        [[internal, answer_id]]
	string decode(string hexstr);
	
};

}}
```

## Code Example

### Solidity

[Example.sol](examples/Example.sol)

### C++

TODO: add later.
