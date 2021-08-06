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

    defaultDate: int128 - date by default.

    minDate: int128 - minimum date that can be chosen.
    
    maxDate: int128 - maximum date that can be chosen.

returns:

	date: int128 - chosen date unixtime (UTC-0).

`getTime` - returns the timestamp within a day selected by the user.

arguments:

	answerId: uint32 - function id of result callback

    prompt: bytes - utf-8 string to print to the user before input.

    defaultTime: uint32 - time by default.

    minTime: uint32 - minimum time that can be chosen.
    
    maxTime: uint32 - maximum time that can be chosen.

    minuteInterval: uint8 - minimal allowed minuteInterval between neibour times in minutes. Valid values are {1, 2, 3, 4, 5, 6, 10, 12, 15, 20, 30}.

returns:

    time: uint32 - chosen timestamp.

`getDateTime`- allow to select date and time.

arguments:

    answerId: uint32 - function id of result callback.
    
    prompt: bytes - utf-8 string to print to the user before input.

    defaultDatetime:  int128 - unixtime, default date and time.
    
    minDatetime: int128 - unixtime, minimum allowed date and time to choose.

    maxDatetime: int128 - unixtime, maximum allowed date and time to choose.

    minuteInterval: uint8 - minimal allowed minuteInterval between neibour times in minutes. Valid values are {1, 2, 3, 4, 5, 6, 10, 12, 15, 20, 30}.

    inTimeZoneOffset: int16 - time zone offset related to UTC-0 in minutes. There is a special value 0x7FFF which defines local user time zone.

returns:

    datetime: int128 - unixtime of chozen date and time.

    timeZoneOffset: int16 - time zone offset in minutes. Use this value for correct date and time representation for the user.

`getTimeZoneOffset` - returns user time zone offset in minutes.

arguments:

    answerId: uint32 - function id of result callback.

returns:

    timeZoneOffset: int16 - user time zone offset in minutes.


## Declaration in Solidity

```jsx
interface IDateTimeInput {
	function getDate(
        uint32 answerId,
        string prompt,
        int128 defaultDate,
        int128 minDate,
        int128 maxDate
    ) external returns (int128 date);
    function getTime(
        uint32 answerId,
        string prompt,
        int128 defaultTime,
        uint32 minTime,
        uint32 maxTime,
        uint8 minuteInterval
    ) external returns (uint32 time);
    function getDateTime(
        uint32 answerId,
        string prompt,
        int128 defaultDatetime,
        int128 minDatetime,
        int128 maxDatetime,
        uint8 minuteInterval,
        int16 inTimeZoneOffset
    ) external returns (int128 datetime, int16 timeZoneOffset);
    function getTimeZoneOffset(uint32 answerId) external returns (int16 timeZoneOffset);
}
```

## Declaration in C++

TODO: add later
## Code Example

### Solidity

examples/Example.sol

### C++

TODO: add later
