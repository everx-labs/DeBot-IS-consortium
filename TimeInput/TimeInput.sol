pragma ton-solidity >= 0.35.0;

struct Time {
    uint8 hr;
    uint8 min;
    uint32 timestamp;
}

interface ITimeInput {

	function get(uint32 answerId, string prompt, Time minTime, Time maxTime, uint8 interval) external returns (Time time, int16 localTimeZone);

}

library TimeInput {

    int8 constant DEBOT_WC = -31;
    uint256 constant ID = 0x047e749303e8a807c13a63c623567b028e822100805d9e6096aad71ada8ef27f;

    function get(uint32 answerId, string prompt, Time minTime, Time maxTime, uint8 interval) public pure {
        address addr = address.makeAddrStd(DEBOT_WC, ID);
        ITimeInput(addr).get(answerId, prompt, minTime, maxTime, interval);
    }

}

contract TimeInputABI is ITimeInput {

    function get(uint32 answerId, string prompt, Time minTime, Time maxTime, uint8 interval) external override returns (Time time, int16 localTimeZone) {}

}

