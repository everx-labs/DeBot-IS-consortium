# QRCode Interface

**Status**: Accepted

| Name         | ID                                                                |
| :--------    | :---------------------------------------------------------------- |
| QRCode       | 940c152ddf4f920f742507f461026dc08ac56ed3392944d6d3863a409570056b  |


## Description

Allows to scan qrcode and return its data as string.

## Functions

Since DeBot is a smart contract then all functions work asyncronously by design. It means that they don't return anything despite the fact that all have `returns` value in their specification. Result callback will be called later and it must have arguments defined in `returns` section.

`scan` - scans qrcode by camera or from image and returns its decoded data as string.

arguments:

	answerId: uint32 - function id of result callback.

returns:

	value: bytes - utf8 string with qrcode data.

## Declaration in Solidity

```jsx
interface IQRCode {
	function scan(uint32 answerId) external returns (string value);
}
```

## Declaration in C++

```cpp
namespace tvm { namespace schema {

__interface IQRCode {

	[[internal, answer_id]]
	string scan();

};

}}
```

## Code Example

### Solidity

Example.sol

### C++

TODO: add later