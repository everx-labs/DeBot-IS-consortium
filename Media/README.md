# Media Interface

**Status**: Proposed

| Name         | ID                                                                |
| :--------    | :---------------------------------------------------------------- |
| Media        | 59cdc2aafe53760937dac5b1c4b89ce12950f56a56298108a987cfe49b7c84b5  |


## Description

Allows to show media of different formats (images, docs and others) to the user.

`output` - shows media to the user.

arguments:

	answerId: uint32 - function id of result callback

    prompt: bytes - utf-8 string to print to the user on top of media.

    data: bytes - utf-8 string with encoded media according to [RFC2397](https://datatracker.ietf.org/doc/html/rfc2397).
    
returns:

	result: MediaStatus - status of media output.

`getSupportedMediaTypes` - returns array of supported media types.

arguments:

	answerId: uint32 - function id of result callback
    
returns:

	mediaTypes: bytes[] - array of strings with supported media types. Each string is in the format of "type/subtype". E.g. ["image/png", "image/jpg"].

## Declaration in Solidity

```jsx
enum MediaStatus {
    Success,
    UnsupportedMediaType,
    InvalidDataScheme
}

interface IMedia {
    function output(uint32 answerId, string prompt, string data) external returns (MediaStatus result);
    function getSupportedMediaTypes(uint32 answerId) external returns (string mediaTypes);
}
```

## Declaration in C++

TODO: add later

## Code Example

### Solidity

examples/Example.sol

### C++

TODO: add later
