# TimeInput Interface

**Status**: Proposed

| Name         | ID                                                                |
| :--------    | :---------------------------------------------------------------- |
| TimeInput    | 047e749303e8a807c13a63c623567b028e822100805d9e6096aad71ada8ef27f  |


## Description

Allows to input day time.

struct Time:

    hr: uint8 - index of an hour within a day. Must be in range [0, 24).

    min: uint8 - index of a minute within an hour. Must be in range [0, 60].

    timestamp: uint32 - timestamp in seconds within 24 hours period. Must be in range [0, 86400]. Note: DeBot Browser should use `timestamp` if it is non zero otherwise a combination of `hr` and `min`.


`get` - allows to get the timestamp within a day selected by the user.

arguments:

	answerId: uint32 - function id of result callback

    prompt: bytes - utf-8 string to print to the user before input.

    minTime: Time - minimum time that can be chosen. NOTE: Time.timestamp can be zero if Time.hr, Time.min are defined.
    
    maxTime: Time - maximum time that can be chosen. NOTE: Time.timestamp can be zero if Time.hr, Time.min are defined.

    interval: uint8 - minimal allowed interval between neibour times in minutes. Valid values are {1, 2, 3, 4, 5, 6, 10, 12, 15, 20, 30}.

returns:

	time: Time - chosen time.
    localTimeZone: int16 - user local time zone offset in minutes.

## Declaration in Solidity

```jsx
struct Time {
    uint8 hr;
    uint8 min;
    uint32 timestamp;
}

interface ITimeInput {
	function get(uint32 answerId, string prompt, Time minTime, Time maxTime, uint8 interval) external returns (Time time, int16 localTimeZone);
}
```

## Declaration in C++

```cpp
namespace tvm { namespace schema {

struct Time {
    uint8 hr;
    uint8 min;
    uint32 timestamp;
}

__interface ITimeInput {

	[[internal, answer_id]]
	(Time, int16) get(uint32 answerId, string prompt, Time minTime, Time maxTime, uint8 interval);

};

}}
```

## Code Example

### Solidity

Example.sol

### C++

TODO: add later
