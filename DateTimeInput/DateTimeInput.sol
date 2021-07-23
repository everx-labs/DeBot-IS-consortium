pragma ton-solidity >= 0.35.0;

interface IDateTimeInput {
	function getDate(
        uint32 answerId,
        string prompt,
        int128 minDate,
        int128 maxDate
    ) external returns (int128 date);
    
    function getTime(
        uint32 answerId,
        string prompt,
        uint32 minTime,
        uint32 maxTime,
        uint8 interval,
        int16 inTimeZoneOffset
    ) external returns (uint32 time, int16 timeZoneOffset);
}

library DateTimeInput {

    int8 constant DEBOT_WC = -31;
    uint256 constant ID = 0x4e862a9df81183ab425bdf0fbd76bd0b558c7f44c24887b4354bf1c26c74a623;

    function getDate(uint32 answerId, string prompt, int128 minDate, int128 maxDate) public pure {
        address addr = address.makeAddrStd(DEBOT_WC, ID);
        IDateTimeInput(addr).getDate(answerId, prompt, minDate, maxDate);
    }

    function getTime(
        uint32 answerId,
        string prompt,
        uint32 minTime,
        uint32 maxTime,
        uint8 interval,
        int16 inTimeZoneOffset
    ) public pure {
        address addr = address.makeAddrStd(DEBOT_WC, ID);
        IDateTimeInput(addr).getTime(answerId, prompt, minTime, maxTime, interval, inTimeZoneOffset);
    }

}

contract DateTimeInputABI is IDateTimeInput {

    function getDate(
        uint32 answerId,
        string prompt,
        int128 minDate,
        int128 maxDate
    ) external override returns (int128 date) {}
    
    function getTime(
        uint32 answerId,
        string prompt,
        uint32 minTime,
        uint32 maxTime,
        uint8 interval,
        int16 inTimeZoneOffset
    ) external override returns (uint32 time, int16 timeZoneOffset) {}

}

