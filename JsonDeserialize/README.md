> :warning: **This Interface should be implemented by DeBot Engine**
# JsonDeserialize Interface

**Status**: Proposed

| Name              | ID                                                                |
| :-----------------| :---------------------------------------------------------------- |
| JsonDeserialize   | 442288826041d564ccedc579674f17c1b0a3452df799656a9167a41ab270ec19  |

## Description

Allows to deserialize json into the structure.
> :warning: **This Interface should be implemented by DeBot Engine**

## Functions

`deserialize` - deserialize json into the structure.

arguments:

    answerId: uint32 - function id of result callback. Callback function should have two input parameters: "result" of type bool and "obj" of type <StructName>.

    json: string - json utf8 string.

returns:

     result: bool - result of operation:
        true - operation succeeded;
        false - operation failed.

     obj: <StructName> - deserialised json into structure of type <StructName>

> Note: type of obj parameter is set by `StructName` input parameter. And input parameters of answerId function should have two input parameters: "result" of type bool and "obj" of type `StructName`.


## Declaration in Solidity

```jsx


interface IJsonDeserialize {

    function deserialize(uint32 answerId, string json) external returns (bool result);

}
```

## Declaration in C++

```cpp
namespace tvm { namespace schema {

__interface IJsonDeserialize {

	[[internal, answer_id]]
	bool_t deserialize(string json);

};

}}
```

## Code Example

### Solidity

[Example.sol](examples/Example.sol)

### C++

TODO: add later.
