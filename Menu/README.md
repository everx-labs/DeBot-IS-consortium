
# Menu Interface

**Status**: Proposed

| Name      | ID                                                                |
| :-------- | :---------------------------------------------------------------- |
| Menu      | ac1a4d3ecea232e49783df4a23a81823cdca3205dc58cd20c4db259c25605b48  |


## Description

Interface for menu.

## Functions

`select` - prints prompt message to the user and returns string entered by user

arguments:

	title: bytes - utf8 string with menu title.

	description: bytes - utf8 string with a description of a menu. Optional, can be `""` (empty string).

    items: MenuItem[] - array of menu items.

returns:

	index: uint32 - index of selected menu item starting from 0.

MenuItem {
    title: bytes - utf8 string with a short name of menu item.
    description: string - utf8 string describing details of menu item. Optional, can be `""` (empty string).
    handlerId: uint32 - id of a callback function to be called when this item is selected.
}

## Declaration in Solidity

```jsx

struct MenuItem {
    string title;
    string description;
    uint32 handlerId;
}

interface IMenu {

	function select(string title, string description, MenuItem[] items) external returns (uint32 index);
}
```

## Declaration in C++

```cpp
namespace tvm { namespace schema {

struct MenuItem {
    string title;
    string description;
    uint32 handlerId;
}

__interface IMenu {

	[[internal]]
	uint32 select(string title, string description, vector<MenuItem> items);
}
};
```

## Code Example

### Solidity

Example.sol

### C++

TODO: add later