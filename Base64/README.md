> :warning: **This Interface should be implemented by DeBot Engine**
# Base64 System Interface

**Status**: Proposed

| Name         | ID                                                                |
| :----------- | :---------------------------------------------------------------- |
| Base64       | 8913b27b45267aad3ee08437e64029ac38fb59274f19adca0b23c4f957c8cfa1  |

## Description

Allows you to encode and decode Base64 strings
> :warning: **This Interface should be implemented by DeBot Engine**

## Functions

`encode` - encode string to base64 format.

arguments: 

    answerId: uint32 - function id of result callback.

    data: bytes - input binary data

returns: 

     base64: string - base64 string

`decode` - decode string from base64 format.

arguments: 

    answerId: uint32 - function id of result callback.

    base64: string - base64 string

returns: 

     data: bytes - output binary data
		
## Declaration in Solidity

```jsx
interface IBase64 {

    function encode(uint32 answerId, bytes data) external returns (string base64);
    function decode(uint32 answerId, string base64) external returns (bytes data);

}
```

## Declaration in C++

```cpp
namespace tvm { namespace schema {

__interface IBase64 {

	[[internal, answer_id]]
	string encode(bytes data);
        [[internal, answer_id]]
	string decode(string base64);
	
};

}}
```

## Code Example

### Solidity

[Example.sol](examples/Example.sol)

### C++

TODO: add later.
