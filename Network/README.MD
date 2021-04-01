
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
    url: bytes - This defines the resource that you wish to fetch
    headers: bytes - JSON, Any headers you want to add to your request

returns:

	{ statusCode: int32, headers: string[], content: string }

`post` - send data to the server using an HTTP POST request.

arguments:

    answerId: uint32 - id of callback function.
    url: bytes - This defines the resource that you wish to fetch
    headers: bytes - JSON, Any headers you want to add to your request
    body: bytes - Any body that you want to add to your request

returns:

	{ statusCode: int32, headers: string[], content: string }

## Declaration in Solidity

```solidity
interface INetwork {

    function get(uint32 answerId, bytes url, bytes headers) external returns (int32 statusCode, string[] headers, string content);
	
    function post(uint32 answerId, bytes url, bytes headers, bytes body) external returns (int32 statusCode, string[] headers, string content);

}
```
## Declaration in C++

```
namespace tvm { namespace schema {

struct Response
{
    int32 status_сode;
    string[] headers;
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

TODO: Add example

### C++

TODO: Add example
