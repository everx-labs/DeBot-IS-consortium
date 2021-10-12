# ComboBoxInput Interface

**Status**: Accepted

| Name         | ID                                                                |
| :--------    | :---------------------------------------------------------------- |
| CountryInput | 5bb3dcbe1a54be9664cb33caf585ff06ed9fe950b8674c279faf746c5cff4132  |


## Description

Allows you to select an item from a dropdown list.

## Functions

Since DeBot is a smart contract then all functions work asyncronously by design. It means that they don't return anything despite the fact that all have `returns` value in their specification. Result callback will be called later and it must have arguments defined in `returns` section.


`get` - allows to get the item selected by the user.

arguments:

    answerId: uint32 - function id of result callback

    prompt: bytes - utf-8 string to print to the user before input

    items: bytes[] - list of items for selection. (should not be reshuffled by a browser)

returns:

    index: uint256 - index of selected item


## Declaration in Solidity

```jsx
interface IComboBoxInput {
    function get(uint32 answerId, string prompt, string[] items) external returns (uint index);
}
```

## Code Example in Solidity

[Example.sol](examples/Example.sol)