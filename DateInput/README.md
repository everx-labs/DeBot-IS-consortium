# DateTimeInput Interface

**Status**: Accepted

| Name         | ID                                                                |
| :--------    | :---------------------------------------------------------------- |
| DateInput    | 4e862a9df81183ab425bdf0fbd76bd0b558c7f44c24887b4354bf1c26c74a623  |


## Description

Allows to input date and time.

`getDate` - returns date selected by user.

Note: function accepts date in unixtime (seconds from the midnight UTC-0 of 1st Jan 1970) which is int128 bits long, negative values are allowed. Date unixtime includes day, month, year and 0 hours, 0 minutes and 0 seconds.

arguments:

	answerId: uint32 - function id of result callback

    prompt: bytes - utf-8 string to print to the user before input.

    minDate: int128 - minimum date that can be chosen.
    
    maxDate: int128 - maximum date that can be chosen.

    timeZoneOffset: int16 - time zone offset related to UTC-0 in minutes. There is a special value 0x7FFF which defines local user time zone.

returns:

	date: int128 - chosen date.

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
