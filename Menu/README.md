
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

	title: bytes
	
	description: bytes

    items: MenuItem[]

returns: 

	void


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

__interface IMenu {

	[[internal]]
	void select();
}
};
```

## Code Example

### Solidity

Example.sol

### C++

TODO: add later