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

`draw` - prints text as QR Code to the user.

Note: DeBot Browsers can choose data correction level by itself.

arguments:

	answerId: uint32 - function id of result callback.
    text: bytes - utf-8 string to print.

returns:

	result: uint8 - one of the QRStatus enum value.

enum QRStatus {
    Success = 0,
    DataTooLong = 1,
    InvalidCharacter = 2,
}

## Declaration in Solidity

```jsx
interface IQRCode {
	function scan(uint32 answerId) external returns (string value);
    function draw(uint32 answerId, string text) external returns (QRStatus result);
}
```

## Declaration in C++

```cpp
namespace tvm { namespace schema {
    enum QRStatus {
        Success,
        DataTooLong,
        InvalidCharacter,
    }
__interface IQRCode {

	[[internal, answer_id]]
	string scan();
    [[internal, answer_id]]
    QRStatus draw(string text);

};

}}
```

## Code Example

### Solidity

Example.sol

### C++

TODO: add later