pragma ton-solidity >= 0.35.0;

interface IDateTimeInput {
    
    function getDate(
        uint32 answerId,
        string prompt,
        int128 defDate,
        int128 minDate,
        int128 maxDate
    ) external returns (int128 date);

    function getTime(
        uint32 answerId,
        string prompt,
        int128 defTime,
        uint32 minTime,
        uint32 maxTime,
        uint8 interval
    ) external returns (uint32 time);

    function getDateTime(
        uint32 answerId,
        string prompt,
        int128 defDatetime,
        int128 minDatetime,
        int128 maxDatetime,
        uint8 interval,
        int16 inTimeZoneOffset
    ) external returns (int128 datetime, int16 timeZoneOffset);

    function getTimeZoneOffset(uint32 answerId) external returns (int16 timeZoneOffset);
}

library DateTimeInput {

    int8 constant DEBOT_WC = -31;
    uint256 constant ID = 0x4e862a9df81183ab425bdf0fbd76bd0b558c7f44c24887b4354bf1c26c74a623;

    function getDate(
        uint32 answerId,
        string prompt,
        int128 defDate,
        int128 minDate,
        int128 maxDate
    ) public pure {
        address addr = address.makeAddrStd(DEBOT_WC, ID);
        IDateTimeInput(addr).getDate(answerId, prompt, defDate, minDate, maxDate);
    }

    function getTime(
        uint32 answerId,
        string prompt,
        uint32 defTime,
        uint32 minTime,
        uint32 maxTime,
        uint8 interval
    ) public pure {
        address addr = address.makeAddrStd(DEBOT_WC, ID);
        IDateTimeInput(addr).getTime(answerId, prompt, defTime, minTime, maxTime, interval);
    }

    function getDateTime(
        uint32 answerId,
        string prompt,
        int128 defDatetime,
        uint32 minDatetime,
        uint32 maxDatetime,
        uint8 interval,
        int16 inTimeZoneOffset
    ) public pure {
        address addr = address.makeAddrStd(DEBOT_WC, ID);
        IDateTimeInput(addr).getDateTime(
            answerId, prompt, defDatetime, minDatetime, maxDatetime, interval, inTimeZoneOffset
        );
    }

    function getTimeZoneOffset(uint32 answerId) public pure {
        address addr = address.makeAddrStd(DEBOT_WC, ID);
        IDateTimeInput(addr).getTimeZoneOffset(answerId);
    }

}

contract DateTimeInputABI is IDateTimeInput {

    function getDate(
        uint32 answerId,
        string prompt,
        int128 defDate,
        int128 minDate,
        int128 maxDate
    ) external override returns (int128 date) {}
    
    function getTime(
        uint32 answerId,
        string prompt,
        int128 defTime,
        uint32 minTime,
        uint32 maxTime,
        uint8 interval
    ) external override returns (uint32 time) {}

    function getDateTime(
        uint32 answerId,
        string prompt,
        int128 defDatetime,
        int128 minDatetime,
        int128 maxDatetime,
        uint8 interval,
        int16 inTimeZoneOffset
    ) external override returns (int128 datetime, int16 timeZoneOffset) {}

    function getTimeZoneOffset(uint32 answerId) 
        external override returns (int16 timeZoneOffset) {}
}

