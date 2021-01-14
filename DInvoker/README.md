# DInvoker Interface

**Status**: Proposed

| Name     | ID                                                                |
| :--------| :---------------------------------------------------------------- |
| DInvoker | f19b3d918094a2361db2090508ce6237b5f8588bd5fcabee1a11c173ada20fb3  |

## Description

Allows to call function of another DeBot and return answer from it to caller.

## Functions

`invoke` - calls function of target Debot. 
Remark: Debot Browser must download the Debot's state if it is called for a first time.

arguments: 

    callee: address - address of target DeBot.

	request: cell - encoded internal body of request with function id and arguments for invoking DeBot.

returns: 

	void

`complete` - must be called by invoked DeBot to notify caller that invoking is completed.

arguments: 

    caller: address - address of caller DeBot.

	response: cell - encoded internal body of response with function id and arguments for caller DeBot.

returns: 

	void

## Declaration in Solidity

```jsx

interface IDInvoker {

    function invoke(address callee, TvmCell request) external;
	function complete(address caller, TvmCell response) external;

}
```

## Declaration in C++

```cpp
namespace tvm { namespace schema {

__interface IDInvoker {

	[[internal]]
	void invoke(address callee, cell request);
	[[internal]]
	void complete(address caller, cell response);

}
};
```

## Code Example

### Solidity

Example.sol

### C++

TODO: add later.