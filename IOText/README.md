# IOText Browser Interface

**Status**: Proposed

| Name                | ID                                                                |
| :------------------ | :---------------------------------------------------------------- |
| IOText	      | fecaec789cea79b3c3aff019cfa32f3e707edce10221c3f7e24dec264467c5bf  |


## Description

Browser Interface. Allow to input and output multiline text.

## Functions

Since DeBot is a smart contract then all functions work asyncronously by design. It means that they don't return anything despite the fact that all have `returns` value in their specification. Result callback will be called later and it must have arguments defined in `returns` section.

`input` - get multiline text from user input. 

arguments: 

	answerId: uint32 - function id of result callback
	prompt   : string - string printed to the user and describing what to enter

returns: 

	text: bytes - entered text

`output` - show multiline text to user. 

arguments: 

	answerId: uint32 - function id of result callback
	text: bytes - text to print

returns: 

	result: bool - result of operation



## Declaration in Solidity

```jsx
interface IIOText {
	function input(uint32 answerId, string prompt) external returns (bytes text);
	function output(uint32 answerId, bytes text) external returns (bool result);
}
```

## Declaration in C++

```cpp
namespace tvm { namespace schema {

__interface IIOText {
	[[internal, answer_id]]
	bytes input(string prompt);
	[[internal, answer_id]]
	bool_t output(bytes text);
	[[internal, answer_id]]
}

}
};
```

## Code Example

### Solidity

[Example.sol](examples/Example.sol)

### C++

TODO: add later
