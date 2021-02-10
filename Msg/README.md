# Msg Interface

**Status**: Proposed

| Name      | ID                                                                |
| :-------- | :---------------------------------------------------------------- |
| Msg       | 475a5d1729acee4601c2a8cb67240e4da5316cc90a116e1b181d905e79401c51  |

## Description

Allows to send external messages to destination smart contracts.

## Functions

`sendWithKeypair` - signs message with defined public and secret keys and then sends message to blockchain.

arguments:

    answerId: uint32 - function id of result callback

	message: cell - unsigned message encoded into tree of cells

    pub: uint256 - public key

    sec: uint256 - secret key

returns:

    void

## Declaration in Solidity

```jsx
interface IMsg {

    function sendWithKeypair(uint32 answerId, TvmCell message, uint256 pub, uint256 sec) external;

}
```

## Declaration in C++

```cpp
namespace tvm { namespace schema {
_interface IMsg {

	[[internal, answer_id]]
	bool sendWithKeypair(cell message, uint256 pub, uint256 sec);

};
}}
```

## Code Example

### Solidity

Example.sol

### C++

TODO: add later.