pragma ton-solidity >= 0.35.0;

struct Time {
    uint8 hrs;
    uint8 mins;
    uint32 timestamp;
}

interface ITimeInput {

	function get(uint32 answerId, string prompt, Time minTime, Time maxTime, uint8 interval, int16 timeZoneOffset) external returns (Time time);

}

library TimeInput {

    int8 constant DEBOT_WC = -31;
    uint256 constant ID = 0x047e749303e8a807c13a63c623567b028e822100805d9e6096aad71ada8ef27f;

    function get(uint32 answerId, string prompt, Time minTime, Time maxTime, uint8 interval, int16 timeZoneOffset) public pure {
        address addr = address.makeAddrStd(DEBOT_WC, ID);
        ITimeInput(addr).get(answerId, prompt, minTime, maxTime, interval, timeZoneOffset);
    }

}

contract TimeInputABI is ITimeInput {

    function get(uint32 answerId, string prompt, Time minTime, Time maxTime, uint8 interval, int16 timeZoneOffset) external override returns (Time time) {}

}

