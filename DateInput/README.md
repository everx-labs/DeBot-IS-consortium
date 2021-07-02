# DateInput Interface

**Status**: Accepted

| Name         | ID                                                                |
| :--------    | :---------------------------------------------------------------- |
| DateInput    | 4e862a9df81183ab425bdf0fbd76bd0b558c7f44c24887b4354bf1c26c74a623  |


## Description

Allows to input Date.

struct Date:

    day: uint8 - number of the day. Must be in range [1, 31].

    month: uint8 - number of month. Must be in range [1, 12].

    year: uint16 - number of years.

    unixtime: int128 - extended unixtime in seconds for a defined day, month, year.


`get` - allows to get date selected by user.

arguments:

	answerId: uint32 - function id of result callback

    prompt: bytes - utf-8 string to print to the user before input.

    minDate: Date - minimum date that can be chosen. NOTE: Date.unixtime can be zero if day, month and year are defined.
    
    maxDate: Date - maximum date that can be chosen. NOTE: Date.unixtime can be zero if day, month and year are defined.

returns:

	date: Date - chosen date.

## Declaration in Solidity

```jsx
struct Date {
    uint8 day;
    uint8 month;
    uint16 year;
    int128 unixtime;
}

interface IDateInput {
	function get(uint32 answerId, string prompt, Date minDate, Date maxDate) external returns (Date date);
}
```

## Declaration in C++

```cpp
namespace tvm { namespace schema {

struct Date {
    uint8 day;
    uint8 month;
    uint16 year;
    int128 unixtime;
}

__interface IDateInput {

	[[internal, answer_id]]
	Date get(string prompt, Date minDate, Date maxDate);

};

}}
```

## Code Example

### Solidity

Example.sol

### C++

TODO: add later