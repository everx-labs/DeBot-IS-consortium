# DateTimeInput Interface

**Status**: Accepted

| Name         | ID                                                                |
| :--------    | :---------------------------------------------------------------- |
| DateTimeInput| 4e862a9df81183ab425bdf0fbd76bd0b558c7f44c24887b4354bf1c26c74a623  |


## Description

Allows to input date and time.

`getDate` - returns date timestamp selected by user.

Note: function accepts date in unixtime (seconds from the midnight UTC-0 of 1st Jan 1970) which is int128 bits long, negative values are allowed. Date unixtime includes day, month, year and 0 hours, 0 minutes and 0 seconds.

arguments:

	answerId: uint32 - function id of result callback

    prompt: bytes - utf-8 string to print to the user before input.

    minDate: int128 - minimum date that can be chosen.
    
    maxDate: int128 - maximum date that can be chosen.

returns:

	date: int128 - chosen date unixtime (UTC-0).

`getTime` - returns the timestamp within a day selected by the user.

arguments:

	answerId: uint32 - function id of result callback

    prompt: bytes - utf-8 string to print to the user before input.

    minTime: uint32 - minimum time that can be chosen.
    
    maxTime: uint32 - maximum time that can be chosen.

    interval: uint8 - minimal allowed interval between neibour times in minutes. Valid values are {1, 2, 3, 4, 5, 6, 10, 12, 15, 20, 30}.

    inTimeZoneOffset: int16 - time zone offset related to UTC-0 in minutes. There is a special value 0x7FFF which defines local user time zone.

returns:

	time: uint32 - chosen timestamp without time zone correction.
    timeZoneOffset: int16 - time zone offset in minutes. USe this value for correct date and time representation for the user.

Note: to get datetime timestamp (UTC-0) DeBot should call `getDate` and `getTime` and then summ return values (`date` + `time`).

Note: to find the time related to specified time zone, add `timeZoneOffset` to calculated datetime timestamp.

## Declaration in Solidity

```jsx
interface IDateTimeInput {
	function getDate(uint32 answerId, string prompt, int128 minDate, int128 maxDate) external returns (int128 date);
    function getTime(uint32 answerId, string prompt, uint32 minTime, uint32 maxTime, uint8 interval, int16 inTimeZoneOffset) external returns (uint32 time, int16 timeZoneOffset);
}
```

## Declaration in C++

TODO: add later
## Code Example

### Solidity

examples/Example.sol

### C++

TODO: add later
