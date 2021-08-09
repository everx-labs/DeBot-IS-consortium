# CountryInput Interface

**Status**: Accepted

| Name         | ID                                                                |
| :--------    | :---------------------------------------------------------------- |
| CountryInput | 9b593b1fec84f39a45821a119da78f79af36fe62a64541ba5fd04d5898cf6241  |


## Description

Allows to input the country code (ISO 3166-1 alpha-2).

## Functions

Since DeBot is a smart contract then all functions work asyncronously by design. It means that they don't return anything despite the fact that all have `returns` value in their specification. Result callback will be called later and it must have arguments defined in `returns` section.


`get` - allows to get the country code selected by the user.

arguments:

    answerId: uint32 - function id of result callback

    prompt: bytes - utf-8 string to print to the user before input

returns:

    value: string - country code selected by user

## Declaration in Solidity

```jsx
interface ICountryInput {
    function get(uint32 answerId, string prompt) external returns (string value);
}
```

## Declaration in C++

```cpp
namespace tvm { namespace schema {

    __interface ICountryInput {

        [[internal, answer_id]]
        string get(string prompt);

    };

}}
```

## Code Example

### Solidity

Example.sol
<!-- 
### C++

TODO: add later -->