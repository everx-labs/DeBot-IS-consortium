# TimeInput Interface

**Status**: Proposed

| Name         | ID                                                                |
| :--------    | :---------------------------------------------------------------- |
| TimeInput    | 047e749303e8a807c13a63c623567b028e822100805d9e6096aad71ada8ef27f  |


## Description

Allows to input day time.

struct Time:

    hrs: uint8 - index of an hour within a day. Must be in range [0, 24).

    mins: uint8 - index of a minute within an hour. Must be in range [0, 60].

    timestamp: uint32 - timestamp in seconds within 24 hours period. Must be in range [0, 86400]. Used instead of hrs, mins.


`get` - allows to get the timestamp within a day selected by the user.

arguments:

	answerId: uint32 - function id of result callback

    prompt: bytes - utf-8 string to print to the user before input.

    minTime: Time - minimum time that can be chosen. NOTE: Time.timestamp can be zero if Time.hrs, Time.mins are defined.
    
    maxTime: Time - maximum time that can be chosen. NOTE: Time.timestamp can be zero if Time.hrs, Time.mins are defined.

    interval: uint8 - minimal allowed interval between neibour times in minutes. Must be in range [1, 30].

    timeZoneOffset: int16 - offset in minutes according to time zone.

returns:

	time: Time - chosen time.

## Declaration in Solidity

```jsx
struct Time {
    uint8 hr;
    uint8 min;
    uint32 timestamp;
}

interface ITimeInput {
	function get(uint32 answerId, string prompt, Time minTime, Time maxTime, uint8 interval, int16 timeZoneOffset) external returns (Time time);
}
```

## Declaration in C++

```cpp
namespace tvm { namespace schema {

struct Time {
    uint8 hrs;
    uint8 mins;
    uint32 timestamp;
}

__interface ITimeInput {

	[[internal, answer_id]]
	Time get(uint32 answerId, string prompt, Time minTime, Time maxTime, uint8 interval, int16 timeZoneOffset);

};

}}
```

## Code Example

### Solidity

Example.sol

### C++

TODO: add later
