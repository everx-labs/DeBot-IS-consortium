
# Network Interface

**Status**: Proposed

| Name    | ID                                                                |
| :------ | :---------------------------------------------------------------- |
| Network | e38aed5884dc3e4426a87c083faaf4fa08109189fbc0c79281112f52e062d8ee  |


## Description

Interface for network requests.

## Functions

`get` - load data from the server using an HTTP GET request.

arguments:

    answerId: uint32 - id of callback function.
    url: string - utf8 string with the name of the resource that you wish to fetch.
    headers: bytes[] - array of utf8 strings with HTTP headers that you want to add to your request.

returns:

    statusCode: int32 - response status code.
    retHeaders: string[] - array of utf8 strings with response headers.
    content: string - response body as utf8 string.

`post` - send data to the server using an HTTP POST request.

arguments:

    answerId: uint32 - id of callback function.
    url: string - utf8 string with the name of the resource that you wish to fetch.
    headers: string[] - array of utf8 strings with HTTP headers that you want to add to your request.
    body: string - utf8 string with HTTP request body.

returns:

    statusCode: int32 - response status code.
    retHeaders: string[] - array of utf8 strings with response headers.
    content: string - response body as utf8 string.

## Declaration in Solidity

```solidity
interface INetwork {

    function get(uint32 answerId, bytes url, string[] headers) external
        returns (int32 statusCode, string[] retHeaders, string content);

    function post(uint32 answerId, bytes url, string[] headers, bytes body) external
        returns (int32 statusCode, string[] retHeaders, string content);

}
```
## Declaration in C++

Status: unstable.

```
namespace tvm { namespace schema {

struct Response
{
    int32 status_сode;
    string retHeaders[];
    string content;
}

__interface INetwork {

    [[internal, answer_id]]
    Response get(bytes url, bytes headers);

    [[internal, answer_id]]
    Response post(bytes url, bytes headers, bytes body);

}

}};
```

## Code Example

### Solidity

Example/Example.sol

### C++

TODO: Add example
